# New Player Guide

Welcome to **Poketrainer Levels**, a Pokemon FireRed romhack that adds a persistent **Trainer Type Level** system on top of the original game. Everything from vanilla FireRed still works — this guide covers what's new and different.

---

## What Are Trainer Levels?

As you play, you earn experience in each of the 18 Pokemon types. Each type has its own XP total and level (1–100). The more you battle with and catch Pokemon of a given type, the higher your trainer level in that type becomes.

Your trainer levels affect several things during gameplay:

| Mechanic | Effect |
|---|---|
| **Accuracy bonus** | +1% per 10 levels in the move's type (up to +10%) |
| **Critical hit bonus** | +1% per 10 levels in the move's type (up to +10%) |
| **Catch rate bonus** | +3 per level in the Pokemon's primary type, +1.5 per level in its secondary type (cap 60) |
| **STAB damage** | Reduced to 1.2x (from the usual 1.5x), making trainer levels matter more |
| **Secondary move effects** | ±20 modifier to secondary effect chance based on type level difference |
| **Obedience** | Traded Pokemon obey based on your trainer levels instead of just badges |

---

## How You Earn Type XP

| Action | XP Earned |
|---|---|
| **Seeing a new species** | +5 XP to each of the Pokemon's type slots |
| **Catching a new species** | +15 XP to each of the Pokemon's type slots |
| **Using a move in battle** | +0.5 XP to each of your Pokemon's species type slots; +0.5 XP to the move's type on hit (+0.25 on miss) |
| **Landing a critical hit or one-hit KO** | +1 bonus XP to species types and move type |
| **Defeating an NPC trainer's Pokemon** | +2 XP to each type of the defeated Pokemon |
| **Encountering a shiny** | +15 XP to each of its types |

XP applies per type slot. Dual-type Pokemon grant both types; pure-type Pokemon use both slots and get double credit for that one type.

---

## Growth Tiers

Not all types level at the same rate. Types are placed into four growth tiers:

| Tier | Types | Max XP to 100 |
|---|---|---|
| **Fast** | Bug | 7,500 |
| **Medium** | Normal, Fighting, Flying, Poison, Ground, Rock, Ghost, Steel, Dark | 15,000 |
| **Medium-Slow** | Fire, Water, Grass, Electric, Ice | 24,000 |
| **Slow** | Psychic, Dragon | 36,000 |

This means Bug types level up fastest through play, while Dragon and Psychic take the most dedication.

---

## Checking Your Levels

- **Start Menu → TYPE LEVELS**: A full-screen display of all 18 type levels and XP.
- **Trainer Card**: Shows small type badge icons for your types.
- **In-battle feedback**: Occasionally during battle you'll see short messages like *"Your Fire sense is growing!"* as your levels cross thresholds (levels 10, 20, 40, 60).

---

## Obedience

In vanilla FireRed, gym badges unlock obedience thresholds. In this version:

- Each gym badge still gives **+5** to your effective trainer level for obedience checks.
- **Traded Pokemon** obey if your trainer level in their type >= half their level.
- **Your own Pokemon** obey if your trainer level >= one-third their level.
- **NPC trainers** are also subject to trainer-level obedience checks in trainer battles.
- **Frustration** has special obedience behavior: low friendship can help obedience for that move, and disobedient battlers may prefer or be forced into Frustration in some branches.

In practice: keep training the types you use and collect gym badges. High-level traded Pokemon can still disobey until your trainer levels catch up, and NPC teams can show obedience flavor too (notably some Rocket teams using Frustration).

---

## Day/Night Cycle

The game has a day/night system based on your play-time clock. **Odd play-time hours** (1, 3, 5, ...) are night; **even hours** (0, 2, 4, ...) are day. The cycle repeats every 2 hours of play time.

> **Note:** Night has a visual cue: the field palette is darkened/blued at night. Indoor and scripted fade transitions can still briefly show transition artifacts while weather/tint palettes settle.

At night, many encounter tables change:
- New Gen 2/3 species appear (Shroomish in Viridian Forest, Wurmple on Route 1, Seedot on Route 2, Poochyena on Route 3, Aron in Rock Tunnel, Houndour in Pokemon Tower, and many more)
- Some day-only species like Oddish, Ekans, Growlithe, and Murkrow are replaced
- Night fishing adds species like Barboach, Corphish, Carvanha, Clamperl, and Staryu
- Water encounters shift — Psyduck/Golduck are often replaced by Slowpoke and Chinchou

Check the [Pokemon Locations](pokemon_locations.md) guide for full details on what appears where at night.

---

## New Pokemon Encounters

This version adds many Gen 2 and Gen 3 species to wild encounter tables throughout Kanto and the Sevii Islands. You'll find Pokemon like Swinub in Mt. Moon, Sableye in Rock Tunnel, Beldum in the Power Plant, Larvitar in Sevault Canyon, and many more. Over 50 new species have been added to wild encounters compared to vanilla FireRed.

---

## In-Game Trades

Beyond the original 9 in-game trades, this version adds 26 more NPC trades throughout the game:

**Johto & Hoenn Starters** (trade your Kanto starter):
- Pewter City: Chikorita for Bulbasaur
- Vermilion City: Cyndaquil for Charmander
- Cerulean City: Totodile for Squirtle
- Celadon City: Treecko for Oddish
- Lavender Town: Torchic for Growlithe
- Fuchsia City: Mudkip for Psyduck

**Rare Species:**
- Saffron City: Castform for Clefairy (holds Mystic Water)
- Cinnabar Island: Kecleon for Ditto
- Viridian City: Duskull for Rattata (holds Spell Tag)
- Route 10: Murkrow for Spearow
- Two Island: Bagon for Geodude (holds Dragon Fang)

**Legendary Trades** (post-game):
- One Island: Raikou for Zapdos
- Three Island: Entei for Moltres
- Four Island: Suicune for Articuno
- Indigo Plateau: Ho-Oh for Mewtwo (holds Sacred Ash)

**Mewtwo Scientist Trades** (after catching Mewtwo):
After you catch Mewtwo in Cerulean Cave, 11 scientists appear in Prof. Oak's Lab. Each offers a different rare species for your Mewtwo. Since only one Mewtwo exists, you can complete only one of these trades per playthrough:
- Mew, Celebi, Jirachi
- Regirock, Regice, Registeel
- Kyogre, Groudon, Rayquaza
- Latias, Latios

---

## Tips for New Players

1. **Use a variety of move types.** Every move you use in battle gives XP toward that move's type, even if you miss. Diverse movesets mean faster leveling across types.

2. **Catch everything.** Each new Pokedex entry gives +1 XP to the species' types. Catching a dual-type Pokemon credits both types.

3. **Defeat trainers thoroughly.** Knocking out an NPC trainer's Pokemon gives +2 XP per type. Don't run from trainer battles.

4. **Check your Type Levels screen.** Open the Start Menu and select TYPE LEVELS to see where you stand. This helps plan which types need work before taking on a gym or tough trade.

5. **Bug types level fastest.** If you want to see the system in action early, use some Bug-type Pokemon or Bug moves in Viridian Forest — you'll notice that level climbing quickly.

6. **Don't worry about traded Pokemon disobedience.** The +5 per badge bonus and your natural leveling through play are usually enough. The system is tuned so normal play keeps you ahead of the curve.

7. **Fish everywhere.** Many new Water-type species have been added to fishing encounters across Kanto. Explore surf and fishing spots that were less interesting in vanilla FireRed.

8. **Explore the Sevii Islands.** Locations like Icefall Cave (Swinub, Delibird, Lapras), Sevault Canyon (Larvitar, Skarmory, Phanpy), Pattern Bush (Heracross, Spinarak, Ledyba), and Lost Cave (Murkrow, Misdreavus) have many new species to find.
