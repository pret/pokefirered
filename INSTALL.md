## Prerequisites

| Linux | macOS | Windows 10 (build 18917+) | Windows 10 (1709+) | Windows Vista, 7, 8, 8.1, and 10 (1507, 1511, 1607, 1703)
| ----- | ----- | ------------------------- | ------------------ | ---------------------------------------------------------
| none | [Xcode Command Line Tools package][xcode] | [Windows Subsystem for Linux 2][wsl2] | [Windows Subsystem for Linux][wsl] | [Cygwin][cygwin]

[xcode]: https://developer.apple.com/library/archive/technotes/tn2339/_index.html#//apple_ref/doc/uid/DTS40014588-CH1-DOWNLOADING_COMMAND_LINE_TOOLS_IS_NOT_AVAILABLE_IN_XCODE_FOR_MACOS_10_9__HOW_CAN_I_INSTALL_THEM_ON_MY_MACHINE_
[wsl2]: https://docs.microsoft.com/windows/wsl/wsl2-install
[wsl]: https://docs.microsoft.com/windows/wsl/install-win10
[cygwin]: https://cygwin.com/install.html

The [prerelease version of the Linux subsystem](https://docs.microsoft.com/windows/wsl/install-legacy) available in the 1607 and 1703 releases of Windows 10 is obsolete so consider uninstalling it.

Make sure that the `build-essential`, `git`, and `libpng-dev` packages are installed. The `build-essential` package includes the `make`, `gcc-core`, and `g++` packages so they do not have to be obtained separately.

In the case of Cygwin, [include](https://cygwin.com/cygwin-ug-net/setup-net.html#setup-packages) the `make`, `git`, `gcc-core`, `gcc-g++`, and `libpng-devel` packages.


## Installation

To set up the repository:

	git clone https://github.com/pret/pokefirered
	git clone https://github.com/luckytyphlosion/agbcc -b new_layout_with_libs

	cd ./agbcc
	make
	make install prefix=../pokefirered
	make install-sdk prefix=../pokefirered

	cd ../pokefirered

To build **pokefirered.gba**:

	make -j$(nproc)

To confirm it matches the official ROM image while building, do this instead:

	make compare -j$(nproc)

If only `.c` or `.s` files were changed, turn off the dependency scanning temporarily. Changes to any other files will be ignored and the build will either fail or not reflect those changes.

	make -j$(nproc) NODEP=1

**Note (until further notice):** If this is your first time building Pokemon FireRed, an unmodified copy of Pokemon FireRed is required in the project root under the name `baserom.gba`. To generate this, you should run the following commands:

    make ips_patch -C tools/br_ips
	head -c 16777216 /dev/zero > tmp.bin
	tools/br_ips/ips_patch tmp.bin baserom.ips baserom.gba
	make compare -j$(nproc)
	cp pokefirered.gba baserom.gba

Alternatively, you can obtain an unmodified copy of Pokemon FireRed and use that as baserom.gba.  Make sure the SHA1 checksum matches with what's provided in [the README](README.md).

**Note 2:** If the build command is not recognized on Linux, including the Linux environment used within Windows, run `nproc` and replace `$(nproc)` with the returned value (e.g.: `make -j4`). Because `nproc` is not available on macOS, the alternative is `sysctl -n hw.ncpu`.
