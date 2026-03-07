# Chase UX Manual QA Checklist (Player Feel)

Use this checklist during manual playtests to validate that chase behavior feels intuitive, fair, and readable to players.

## Test setup

- Build and run the latest branch with chase-related changes.
- Use at least one test profile for a **new player** (no prior explanation) and one for an **experienced player**.
- Record observations with short clips or notes when possible.
- For each checklist item, capture:
  - Pass/Fail
  - Severity (Low / Medium / High)
  - Repro steps
  - Suggested fix

---

## 1) First Chase Comprehension Test (New Player)

**Goal:** Verify a first-time player quickly understands they are being chased and what to do.

### Steps

1. Start from a save/state where the player is about to trigger their first chase.
2. Hand controls to a new player with no mechanics briefing.
3. Observe silently during first trigger, initial reaction, and first ~30 seconds.
4. Ask the player to explain what they think is happening and what they should do.

### Pass criteria

- Player recognizes a chase has started within a few seconds.
- Player identifies the intended response (escape, avoid, outrun, or reach safety) without coaching.
- Player can describe at least one clear cue that indicated chase state.

### Failure signals

- Player interprets behavior as random/buggy instead of intentional chase.
- Player hesitates due to unclear objective.
- Player repeatedly asks what triggered the state change.

---

## 2) Fairness Test for Spawn/Reposition Near Obstacles

**Goal:** Ensure chase entities spawning/repositioning near walls, corners, and narrow paths do not feel unfair.

### Steps

1. Trigger chase in maps with:
   - Tight corridors
   - Dense obstacle clusters
   - Doorways/one-tile chokepoints
2. Force multiple spawn/reposition events near collision boundaries.
3. Repeat while entering/exiting constrained spaces at different movement timings.

### Pass criteria

- Spawns/repositions leave reasonable reaction time.
- Entity placement does not trap the player with no readable escape option.
- Collision outcomes appear consistent with map geometry and player expectations.

### Failure signals

- Apparent "telefrag" moments (instant unavoidable capture/hit).
- Reposition appears to bypass line-of-sight or obstacle rules unexpectedly.
- Player path is blocked in a way that feels unavoidable rather than skill-based.

---

## 3) Clarity Test for Start/End/Transition Feedback

**Goal:** Confirm feedback clearly communicates chase state changes.

### Steps

1. Trigger chase start under normal conditions.
2. End chase through intended success/timeout/escape conditions.
3. Re-trigger chase and test any transitional states (pause/resume, area handoff, scripted interruption).
4. Validate visual, audio, and control feedback at each boundary.

### Pass criteria

- Start of chase is immediately noticeable.
- End of chase is unmistakable and does not leave player uncertain about current risk.
- Transition moments are readable and preserve state continuity.

### Failure signals

- Start cue is subtle enough to be missed during active movement.
- End cue fails to resolve tension (player still behaves as if chased).
- Transition causes ambiguous state (player cannot tell if chase is active).

---

## 4) Stress Test with Repeated Map Transitions and Dense Terrain

**Goal:** Detect breakdowns in feel under prolonged high-load or edge-case navigation patterns.

### Steps

1. Execute 15-30 consecutive map transitions while chase state is repeatedly entered/exited.
2. Prioritize maps with dense collision tiles and complex routes.
3. Intentionally vary pace:
   - Rapid transitions
   - Slow methodical movement
   - Frequent turns near corners
4. Note any degradation in responsiveness, consistency, or readability over time.

### Pass criteria

- Chase behavior remains consistent across repeated transitions.
- No increasing desync between cues and actual chase logic.
- Player control feel remains stable in dense terrain.

### Failure signals

- Inconsistent trigger timing after many transitions.
- Noticeable hitching or delayed state changes that affect decision-making.
- Increased frequency of unfair-feeling catches in dense collision areas.

---

## 5) Accessibility Test with Reduced-Intensity Settings

**Goal:** Validate chase remains understandable and fair when intensity-reduction options are enabled.

### Steps

1. Enable available reduced-intensity options (e.g., reduced flashing, lower audio intensity, calmer camera effects).
2. Run at least one full chase loop (start -> active -> end) with those settings.
3. Compare readability and fairness against default settings.
4. Gather feedback from tester on comfort and clarity.

### Pass criteria

- Core chase cues remain legible with reduced-intensity settings.
- Reduced effects lower sensory load without removing required gameplay information.
- Players can still detect start/end/transition moments reliably.

### Failure signals

- Important cues disappear when intensity is lowered.
- Accessibility mode alters timing/feel in ways that change difficulty unfairly.
- Testers report discomfort despite reduced-intensity settings.

---

## Suggested reporting template

- **Checklist item:**
- **Result:** Pass / Fail
- **Severity:** Low / Medium / High
- **Build/commit:**
- **Map/scene:**
- **Repro steps:**
- **Expected:**
- **Observed:**
- **Evidence (video/screenshot):**
- **Notes / follow-ups:**
