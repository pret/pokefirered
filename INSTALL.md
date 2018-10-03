Install [devkitARM](https://devkitpro.org/wiki/Getting_Started) (if you are on **Windows 10**, [do this instead](#windows-10)).

Run the following commands (first, see [this](#macos) if you are on **macOS** or [this](#old-windows) if you are on **old Windows**):

	export DEVKITPRO=/opt/devkitpro
	echo "export DEVKITPRO=$DEVKITPRO" >> ~/.bashrc
	export DEVKITARM=$DEVKITPRO/devkitARM
	echo "export DEVKITARM=$DEVKITARM" >> ~/.bashrc

	git clone https://github.com/pret/pokefirered
	git clone https://github.com/pret/agbcc

	cd agbcc
	./build.sh
	./install.sh ../pokefirered

	cd ../pokefirered

To build **pokefirered.gba**:

	make -j$(nproc)

If you have only changed `.c` or `.s` files, you can turn off the dependency scanning temporarily. Changes to any other files will be ignored, and the build will either fail or not reflect those changes.

	make -j$(nproc) NODEP=1


## macOS

Run `xcode-select --install` in Terminal, then proceed by executing the commands.


## Old Windows

*For Windows 8.1 and earlier*

Download and run the [Cygwin](https://www.cygwin.com/install.html) setup, leaving the default settings intact. At "Select Packages", set the view to "Full" and choose to install the following:

- `make`
- `git`
- `gcc-core`
- `gcc-g++`
- `libpng-devel`

In the Cygwin command prompt, enter the commands.

If the command for building pokefirered.gba does not work, run `nproc` and use that value instead of `$(nproc)` for `make`.


## Windows 10

Install the [Windows Subsystem for Linux](https://docs.microsoft.com/windows/wsl/install-win10), then install [devkitARM](https://devkitpro.org/wiki/Getting_Started) inside the subsystem, and run the commands.
