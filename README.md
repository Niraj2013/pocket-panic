# PocketPanic

PocketPanic is a fast, arcade-style Godot game built around short challenges and a ticking clock. Start with five lives, clear two minigames, and keep your nerve when every second counts.

## How to Play

1. Start a run from the title screen.
2. Wait through the short level countdown.
3. Complete each minigame before its timer expires.
4. Clear both minigames to win.
5. Miss a challenge and lose a life. Lose all five lives and the run ends.

### Minigames

- **Heart Hunt:** Collect at least four hearts before the 10-second timer runs out.
- **Button Blitz:** Find and press four buttons before the 7-second timer runs out. Pressed buttons disappear, so keep searching.

## Controls

- **Left / Right Arrow:** Move
- **Space:** Jump
- **Mouse:** Press minigame buttons and menu buttons

## Running the Game

### From the Godot editor

1. Install [Godot](https://godotengine.org/) 4.7 or a compatible Godot 4 version.
2. Import this folder as a Godot project.
3. Open the project and press **Play** (or `F6`/`F5`, depending on whether you want to run the current scene or the project).

The project entry point is configured in `project.godot`.

### Web build

The repository also contains a browser export in the `exports/` directory. To create a fresh export, open **Project > Export** in Godot, configure a Web preset, and export the project there.

## Project Structure

```text
Scenes/       Gameplay scenes, minigames, menus, and player logic
Global.gd     Shared lives and progression state
addons/       Enabled Godot editor plugins
exports/      Existing web export files
```

## Built With

- [Godot Engine](https://godotengine.org/) 4.7
- GDScript

## Status

PocketPanic is a playable prototype. The core run loop, lives system, timed minigames, win screen, and game-over screen are included.