#!/usr/bin/env python3
"""
Regenerate box_art_mon.png, box_art_mon.bin, and box_art_mon.pal
for the fulspec title screen from box_art_mon_original.png.

Produces a proper GBA packed tile sheet:
- 4bpp: exactly 16 palette entries, palette[0] = (0,0,255) transparent key
- Tile 0 = blank (all index 0)
- Remaining tiles = deduplicated unique content tiles
- .bin = 32x20 tilemap (palette 13, matching firered positioning)
- .pal = JASC-PAL format
"""

import struct
import numpy as np
from PIL import Image
from collections import Counter

SRCDIR = "graphics/title_screen/fulspec"
SRC_IMAGE = f"{SRCDIR}/box_art_mon_original.png"
OUT_PNG = f"{SRCDIR}/box_art_mon.png"
OUT_PAL = f"{SRCDIR}/box_art_mon.pal"
OUT_BIN = f"{SRCDIR}/box_art_mon.bin"

TILE_SIZE = 8
TILES_X = 12  # 96 / 8
TILES_Y = 12  # 96 / 8
TILES_PER_ROW = 12  # tile sheet width in tiles
SCREEN_W = 32  # GBA screen tiles wide
SCREEN_H = 20  # GBA screen tiles tall
PALETTE_NUM = 13  # same as firered

# Sprite placement on screen (matching firered: rows 6-17, cols 18-29)
SPRITE_ROW = 6
SPRITE_COL = 18

# Green background threshold
GREEN_THRESHOLD = 30  # pixels with R<thresh, G>255-thresh, B<thresh = background


def load_and_identify_background(path):
    """Load source image and identify green background pixels."""
    img = Image.open(path).convert("RGB")
    pixels = np.array(img)  # (96, 96, 3)

    # Background is bright green: ~(0-5, 254-255, 0-5)
    green_mask = (
        (pixels[:, :, 0] < GREEN_THRESHOLD)
        & (pixels[:, :, 1] > (255 - GREEN_THRESHOLD))
        & (pixels[:, :, 2] < GREEN_THRESHOLD)
    )

    return pixels, green_mask


def rgb_to_gba(r, g, b):
    """Convert 8-bit RGB to GBA RGB555 and back to 8-bit."""
    # GBA uses 5-bit per channel: value = (channel >> 3) << 3
    return ((r >> 3) << 3, (g >> 3) << 3, (b >> 3) << 3)


def quantize_to_15_colors(pixels, green_mask):
    """Reduce non-background pixels to 15 colors in GBA color space."""
    h, w, _ = pixels.shape

    # Round all pixels to GBA RGB555 color space first
    gba_pixels = pixels.copy()
    gba_pixels = (gba_pixels >> 3) << 3

    # Extract non-green pixel colors (in GBA space)
    non_green_mask = ~green_mask
    non_green_pixels = gba_pixels[non_green_mask]  # (N, 3)
    n_pixels = len(non_green_pixels)

    if n_pixels == 0:
        return np.zeros((h, w), dtype=np.uint8), [(0, 0, 0)] * 15

    # Create temporary image from non-green pixels for quantization
    side = int(np.ceil(np.sqrt(n_pixels)))
    padded = np.zeros((side * side, 3), dtype=np.uint8)
    padded[:n_pixels] = non_green_pixels
    temp_img = Image.fromarray(padded.reshape(side, side, 3))

    # Quantize to 15 colors
    quantized = temp_img.quantize(colors=15, method=Image.Quantize.MEDIANCUT)
    q_palette = quantized.getpalette()[:15 * 3]
    q_pixels = np.array(quantized).flatten()[:n_pixels]

    # Snap palette colors to GBA RGB555
    palette_colors = []
    for i in range(15):
        r, g, b = q_palette[i * 3], q_palette[i * 3 + 1], q_palette[i * 3 + 2]
        palette_colors.append(rgb_to_gba(r, g, b))

    # Deduplicate palette colors that became identical after GBA snapping
    seen = {}
    remap = {}
    unique_palette = []
    for i, c in enumerate(palette_colors):
        if c in seen:
            remap[i] = seen[c]
        else:
            new_idx = len(unique_palette)
            seen[c] = new_idx
            unique_palette.append(c)
            remap[i] = new_idx

    # Pad to exactly 15 if needed
    while len(unique_palette) < 15:
        unique_palette.append((0, 0, 0))

    palette_colors = unique_palette[:15]
    print(f"  Distinct GBA palette colors: {len(seen)}")

    # Build indexed image: 0 = transparent, 1-15 = content
    indexed = np.zeros((h, w), dtype=np.uint8)
    flat_idx = 0
    for y in range(h):
        for x in range(w):
            if non_green_mask[y, x]:
                old_idx = q_pixels[flat_idx]
                new_idx = remap[old_idx]
                indexed[y, x] = new_idx + 1  # shift to 1-15
                flat_idx += 1

    return indexed, palette_colors


def extract_tiles(indexed):
    """Break 96x96 indexed image into 12x12 grid of 8x8 tiles."""
    tiles = []
    for ty in range(TILES_Y):
        for tx in range(TILES_X):
            tile = indexed[ty * TILE_SIZE:(ty + 1) * TILE_SIZE,
                           tx * TILE_SIZE:(tx + 1) * TILE_SIZE].copy()
            tiles.append(tile)
    return tiles


def deduplicate_tiles(tiles):
    """Deduplicate tiles. Tile 0 is always blank (all zeros)."""
    blank = np.zeros((TILE_SIZE, TILE_SIZE), dtype=np.uint8)
    unique_tiles = [blank]  # tile 0 = blank
    tile_indices = []  # maps grid position -> unique tile index

    for tile in tiles:
        if np.all(tile == 0):
            tile_indices.append(0)
            continue

        found = False
        for i, ut in enumerate(unique_tiles):
            if np.array_equal(tile, ut):
                tile_indices.append(i)
                found = True
                break

        if not found:
            tile_indices.append(len(unique_tiles))
            unique_tiles.append(tile)

    return unique_tiles, tile_indices


def build_tile_sheet(unique_tiles):
    """Pack unique tiles into a tile sheet PNG."""
    num_tiles = len(unique_tiles)
    num_rows = (num_tiles + TILES_PER_ROW - 1) // TILES_PER_ROW
    sheet_w = TILES_PER_ROW * TILE_SIZE  # 96
    sheet_h = num_rows * TILE_SIZE

    sheet = np.zeros((sheet_h, sheet_w), dtype=np.uint8)
    for i, tile in enumerate(unique_tiles):
        row = i // TILES_PER_ROW
        col = i % TILES_PER_ROW
        sheet[row * TILE_SIZE:(row + 1) * TILE_SIZE,
              col * TILE_SIZE:(col + 1) * TILE_SIZE] = tile

    return sheet, sheet_w, sheet_h


def save_png(sheet, palette_colors, path):
    """Save tile sheet as indexed PNG with 16-color palette."""
    img = Image.fromarray(sheet, mode="P")

    # Build palette: index 0 = (0,0,255) key, indices 1-15 = content
    pal = [0, 0, 255]  # transparent key color
    for r, g, b in palette_colors:
        pal.extend([r, g, b])
    # Pad remaining entries to 256
    while len(pal) < 256 * 3:
        pal.extend([0, 0, 0])

    img.putpalette(pal)
    img.save(path)
    print(f"Saved tile sheet: {path} ({img.size[0]}x{img.size[1]})")


def save_pal(palette_colors, path):
    """Save JASC-PAL file with 16 entries."""
    lines = ["JASC-PAL", "0100", "16"]
    # Entry 0: transparent key
    lines.append("0 0 255")
    for r, g, b in palette_colors:
        lines.append(f"{r} {g} {b}")
    with open(path, "w") as f:
        f.write("\n".join(lines) + "\n")
    print(f"Saved palette: {path}")


def save_tilemap(tile_indices, path):
    """Save 32x20 GBA tilemap .bin file."""
    # Build 32x20 screen map
    # All entries default to tile 0 with palette PALETTE_NUM
    base_entry = PALETTE_NUM << 12  # palette in bits 12-15

    data = bytearray()
    for row in range(SCREEN_H):
        for col in range(SCREEN_W):
            # Check if this screen position is within the sprite area
            sprite_row = row - SPRITE_ROW
            sprite_col = col - SPRITE_COL
            if (0 <= sprite_row < TILES_Y) and (0 <= sprite_col < TILES_X):
                grid_idx = sprite_row * TILES_X + sprite_col
                tile_idx = tile_indices[grid_idx]
            else:
                tile_idx = 0

            entry = base_entry | tile_idx
            data.extend(struct.pack("<H", entry))

    with open(path, "wb") as f:
        f.write(data)
    print(f"Saved tilemap: {path} ({len(data)} bytes)")


def main():
    print("Loading source image...")
    pixels, green_mask = load_and_identify_background(SRC_IMAGE)
    bg_count = np.sum(green_mask)
    total = pixels.shape[0] * pixels.shape[1]
    print(f"  Background pixels: {bg_count}/{total} ({bg_count * 100 // total}%)")

    print("Quantizing to 15 colors...")
    indexed, palette_colors = quantize_to_15_colors(pixels, green_mask)
    used_indices = set(indexed.flatten())
    print(f"  Used indices: {sorted(used_indices)}")

    print("Extracting and deduplicating tiles...")
    tiles = extract_tiles(indexed)
    unique_tiles, tile_indices = deduplicate_tiles(tiles)
    num_unique = len(unique_tiles)
    print(f"  Total grid tiles: {len(tiles)}")
    print(f"  Unique tiles: {num_unique} (including blank tile 0)")
    print(f"  Tile indices used: {sorted(set(tile_indices))[:20]}...")

    print("Building tile sheet...")
    sheet, sheet_w, sheet_h = build_tile_sheet(unique_tiles)

    print("Saving assets...")
    save_png(sheet, palette_colors, OUT_PNG)
    save_pal(palette_colors, OUT_PAL)
    save_tilemap(tile_indices, OUT_BIN)

    print(f"\nDone! {num_unique} unique tiles generated.")
    print(f"Update graphics_file_rules.mk: -num_tiles {num_unique}")


if __name__ == "__main__":
    main()
