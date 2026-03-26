#!/usr/bin/env python3
"""Fix fulspec game_title_logo from RGBA original to indexed 8bpp with
spatial tile layout matching firered/leafgreen.

The original fulspec logo is an RGBA 256x64 image with dark navy blue
(16,2,106) background. This script:
1. Reads the RGBA original (game_title_logo_original.png)
2. Quantizes to 256-color indexed palette with key color at index 0
3. Maps the dark blue background to the transparent key (index 0)
4. Preserves the 256x64 spatial layout (tile index = row*32 + col)
5. Builds a spatial .bin tilemap matching firered's convention
6. Writes the .pal file
"""

import struct
from pathlib import Path
from PIL import Image
import numpy as np

TILE_W, TILE_H = 8, 8
SHEET_COLS, SHEET_ROWS = 32, 8   # tile sheet: 256x64
SCREEN_COLS, SCREEN_ROWS = 32, 20  # tilemap dimensions
KEY_COLOR = (0, 255, 41)  # GBA transparent key
BG_RGBA = (16, 2, 106, 255)  # the dark navy background in the original


def main():
    base = Path("graphics/title_screen/fulspec")
    src = base / "game_title_logo_original.png"

    img = Image.open(src).convert("RGBA")
    assert img.size == (256, 64), f"Expected 256x64, got {img.size}"
    pixels = np.array(img)  # (64, 256, 4)

    # Step 1: Collect unique RGBA colors, separating background from content
    flat = pixels.reshape(-1, 4)
    bg_mask = np.all(flat == BG_RGBA, axis=1)

    # Get unique non-background colors
    content_pixels = flat[~bg_mask]
    unique_colors = np.unique(content_pixels, axis=0)
    print(f"Unique non-background colors: {len(unique_colors)}")
    assert len(unique_colors) <= 255, "Too many colors for 8bpp palette"

    # Step 2: Build palette - index 0 = key color, rest = content colors
    palette = [KEY_COLOR]
    color_to_idx = {}
    for c in unique_colors:
        rgb = (int(c[0]), int(c[1]), int(c[2]))
        idx = len(palette)
        color_to_idx[(c[0], c[1], c[2], c[3])] = idx
        palette.append(rgb)
    print(f"Palette entries used: {len(palette)}")

    # Pad palette to 256 entries
    while len(palette) < 256:
        palette.append((0, 0, 0))

    # Step 3: Convert RGBA pixels to indexed
    indexed = np.zeros((64, 256), dtype=np.uint8)
    for y in range(64):
        for x in range(256):
            px = tuple(pixels[y, x])
            if px == BG_RGBA:
                indexed[y, x] = 0
            elif px in color_to_idx:
                indexed[y, x] = color_to_idx[px]
            else:
                # Alpha=0 or unexpected -> transparent
                indexed[y, x] = 0

    # Step 4: Save as indexed PNG (preserving 256x64 spatial layout)
    out_img = Image.fromarray(indexed, mode="P")
    pal_flat = []
    for r, g, b in palette:
        pal_flat.extend([r, g, b])
    out_img.putpalette(pal_flat)
    out_img.save(base / "game_title_logo.png")
    print(f"Wrote tile sheet: 256x64 (32x8 tiles, spatial layout)")

    # Step 5: Build spatial tilemap
    # The fulspec logo content fits entirely within the 8 sheet rows (256x64).
    # Map directly: screen(row, col) -> tile index = row*32 + col for rows 0-7.
    # Screen rows 8-19 are all blank (tile 0).
    # Tile index 0 (sheet position 0,0) is blank, so it serves as the "empty" tile.

    # Find which sheet tiles have content
    content_tiles = set()
    for tr in range(SHEET_ROWS):
        for tc in range(SHEET_COLS):
            tile = indexed[tr*8:(tr+1)*8, tc*8:(tc+1)*8]
            if not np.all(tile == 0):
                content_tiles.add((tr, tc))
    print(f"Content tiles in sheet: {len(content_tiles)}")

    full_map = [0] * (SCREEN_COLS * SCREEN_ROWS)

    for sr in range(SHEET_ROWS):
        for sc in range(SHEET_COLS):
            tile_idx = sr * 32 + sc
            if tile_idx == 0:
                continue  # tile 0 is blank
            if (sr, sc) in content_tiles:
                full_map[sr * SCREEN_COLS + sc] = tile_idx

    bin_data = struct.pack(f"<{len(full_map)}H", *full_map)
    (base / "game_title_logo.bin").write_bytes(bin_data)

    non_zero = sum(1 for e in full_map if e != 0)
    print(f"Wrote tilemap: {len(full_map)} entries, {non_zero} non-zero")

    # Step 6: Write JASC .pal file (256 entries for 8bpp)
    pal_lines = ["JASC-PAL", "0100", "256"]
    for r, g, b in palette:
        pal_lines.append(f"{r} {g} {b}")
    (base / "game_title_logo.pal").write_text("\n".join(pal_lines) + "\n")
    print(f"Wrote palette: 256 entries, key color = {KEY_COLOR}")

    # Verify
    verify_img = Image.open(base / "game_title_logo.png")
    vp = np.array(verify_img)
    print(f"\nVerification:")
    print(f"  Sheet size: {verify_img.size}")
    print(f"  Tile 0 unique values: {sorted(set(vp[0:8, 0:8].flatten()))}")
    content_count = 0
    for tr in range(8):
        row_str = ""
        for tc in range(32):
            tile = vp[tr*8:(tr+1)*8, tc*8:(tc+1)*8]
            if np.all(tile == 0):
                row_str += "."
            else:
                row_str += "#"
                content_count += 1
        print(f"  Sheet row {tr}: {row_str}")
    print(f"  Content tiles: {content_count}")
    print(f"  Sheet size: {verify_img.size}")
    print(f"  Palette[0]: ({verify_img.getpalette()[0]},{verify_img.getpalette()[1]},{verify_img.getpalette()[2]})")

if __name__ == "__main__":
    main()
