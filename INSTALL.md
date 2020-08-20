## Prerequisites

You will need to install [Visual Studio Code](https://code.visualstudio.com/) and [Docker](https://www.docker.com/get-started).




## Installation

After installing Visual Studio Code, you will need to install the extension [ms-vscode-remote.remote-containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers).

Then click on the green button in the lower left corner of vscode

![first step](https://code.visualstudio.com/assets/docs/remote/common/remote-dev-status-bar.png)

Then on the menu that pops up at the top of the vscode editor, click `Remote-Containers: Reopen in Container`

## Compiling Your ROM

You can open and close the termainl window in vscode by pressing ``CTRL+` `` (Control and Tilde). It will appear at the bottom of the window.

Then you can compile by running command `make` or `make -jN` where N is the number of threads to use.
