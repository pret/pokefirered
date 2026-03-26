# Pokémon FireRed — Trainer Type Levels

A fork of [pret/pokefirered](https://github.com/pret/pokefirered) that adds a **Trainer Type Level** system. As you battle and catch Pokémon, you build expertise in each of the 18 types, which affects accuracy, crit rate, catch rate, obedience, and more. The game also adds new wild encounters, in-game trades, and a day/night cycle.

**New to this version?** Read the [New Player Guide](docs/new_player_guide.md) for a gameplay overview, or the [Pokémon Location Guide](docs/pokemon_locations.md) to plan your team.

## Documentation

| Document | Description |
|---|---|
| [New Player Guide](docs/new_player_guide.md) | What's different, tips for new players |
| [Pokémon Location Guide](docs/pokemon_locations.md) | Where to find every Pokémon, by area |
| [Trainer Type Level Spec](TRAINER_TYPE_LEVEL_SPEC.md) | Full system specification |
| [Obedience System](TRAINER_OBEDIENCE_SYSTEM.md) | How obedience works with type levels |
| [Boss Encounters](docs/boss_encounters.md) | Gym leaders, Elite Four, and rival battles |
| [NPC Trainer Reference](docs/trainer_type_level_reference.md) | Route-by-route NPC trainer data |

## Building

To set up the repository, see [INSTALL.md](INSTALL.md).

For a clean, one-command rebuild, see `rebuild.ps1` or the
**Clean rebuild with PowerShell Core** section in [INSTALL.md](INSTALL.md#clean-rebuild-with-powershell-core).

## Base ROM

This project builds from the following base ROMs:

* [**pokefirered.gba**](https://datomatic.no-intro.org/?page=show_record&s=23&n=1616) `sha1: 41cb23d8dccc8ebd7c649cd8fbb58eeace6e2fdc`
* [**pokeleafgreen.gba**](https://datomatic.no-intro.org/?page=show_record&s=23&n=1617) `sha1: 574fa542ffebb14be69902d1d36f1ec0a4afd71e`
* [**pokefirered_rev1.gba**](https://datomatic.no-intro.org/?page=show_record&s=23&n=1672) `sha1: dd5945db9b930750cb39d00c84da8571feebf417`
* [**pokeleafgreen_rev1.gba**](https://datomatic.no-intro.org/index.php?page=show_record&s=23&n=1668) `sha1: 7862c67bdecbe21d1d69ce082ce34327e1c6ed5e`

For contacts and other pret projects, see [pret.github.io](https://pret.github.io/).
