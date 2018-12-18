Run the following commands (first, see [this](#macos) if you are on **macOS** or [this](#old-windows) if you are on **old Windows**):

	git clone https://github.com/pret/pokefirered
	git clone https://github.com/pikalaxalt/agbcc -b new_layout_with_libs

	cd agbcc
	make
	make install prefix=../pokefirered

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

Install the [Windows Subsystem for Linux](https://docs.microsoft.com/windows/wsl/install-win10), and run the commands.

## Important note for all users

Until further notice, this repository is dependent on `baserom.gba`, which is a copy of Pokémon FireRed (U)(1.0) bearing the SHA1 sum `41cb23d8dccc8ebd7c649cd8fbb58eeace6e2fdc`.  If you attempt to build and get the following error or similar, it's because `baserom.gba` is missing.

    No rule to make target 'build/firered/data/librfu_rodata.o', needed by 'pokefirered.elf'. Stop.
