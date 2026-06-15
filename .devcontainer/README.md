# VSCode Dev Container Configuration

This repo has been set up with support for VSCode Dev Containers. This provides a fully working build environment complete with linting and a remote debugger.

## Initial Installation

To get started, first [install Docker Desktop](https://docs.docker.com/desktop/features/wsl/#turn-on-docker-desktop-wsl-2), and select the prompt to enable WSL 2 support during the installation. Make sure to follow the instructions to set Docker to use the WSL 2 based engine.

Next, install the [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension for VSCode.

### Creating the Dev Container

From here, if you want to get up and running quickly you can clone the repo into a container volume in VSCode by opening the command palette with `Crtl+Shift+P`, running `Dev Containers: Clone Repository in Container Volume`, and pasting the link to the repo.

This will clone the repo, and automatically configure a full build environment complete with all necessary dependencies.

### Building the ROM

First select the build target by opening the command palette and running `C/C++: Select a Configuration...`, or by selecting it in the bottom right hand corner when browsing any source file. This will set up Intellisense to give error information for that specific build, as well as make it the target.

To build the rom, open the command palette and run `Tasks: Run Build Task`, or use the shortcut `Ctrl+Shift+B`. This will build the target selected in the previous step.

If you need to clean the repo for a fresh build, you can open the command palette, run `Tasks: Run Task`, and select `Clean` or `Clean and Build`.

## Debugging with mGBA

The modern build targets support step debugging within VSCode. This allows you to set up breakpoints, view variables, and see the current call stack of the game.

To get started, [download and install mGBA](https://mgba.io/). 

**Make sure that a modern build target is selected in VSCode, or the debugger will not work correctly.**

Next, go to Run and Debug in VSCode by either selecting it in the panel on the left or the shortcut `Ctrl+Shift+D`. From here make sure `mGBA Debug Remote` is selected, and click the play icon.

This will compile the selected build for debugging, and once complete wait for the GDB server to start.

Once the build has completed, download the ROM from VSCode by right clicking on it and selecting download. Open the ROM in mGBA, then go into `Tools -> Start GDB Server` and enable the server. You can also launch mGBA with the `-g` argument to start the server automatically. It may time out before you connect, but if it does so simply click the play icon again in VSCode.

If the game starts and the bar at the bottom of VSCode changes colour, then the debugger has been successfully linked to the emulator. 

From here you can set breakpoints by clicking on the red dot to the left of any line in any source file, and when code execution gets to that point the emulator will pause and give information on the current state of the game. You can then either resume, or step over the functions line by line.

## Advanced Configuration

### Accessing Files

While cloning the repo into a Docker volume is convenient, it unfortunately makes it difficult to access and modify other files within using tools such as [Porymap](https://github.com/huderlem/porymap).

If you need direct access to the source folder, then it is possible to mount a directory directly into the Dev Container. 

In a fresh VSCode window, clone the repo and select a destination. Once the repo has been cloned and opened, you can then open the command palette with `Ctrl+Shift+P` and select `Dev Containers: Reopen in Container`. This is also easily accessible from the icon with two arrows in the bottom left of VSCode.

This will open the local folder in the container, allowing much easier access to the source files. However on Windows, this comes at a serious penalty to build speed, increasing compilation times by up to 5x.

It is possible to get the best of both worlds on Windows by cloning into and then opening the source folder from within the WSL filesystem, which can be accessed at `\\wsl.localhost\`. 

