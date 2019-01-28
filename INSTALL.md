## Prerequisites

Until further notice, this repository requires a **baserom.gba** file, which must be [a legitimate copy of English Pokémon FireRed v1.0](https://datomatic.no-intro.org/?page=show_record&s=23&n=1616). See [this article](https://www.howtogeek.com/67241/htg-explains-what-are-md5-sha-1-hashes-and-how-do-i-check-them/) for help on how to verify the checksum.

----

**Linux:** Proceed to [Installation](#installation).

**macOS:** Get the [Xcode command-line tools](https://developer.apple.com/library/archive/technotes/tn2339/_index.html#//apple_ref/doc/uid/DTS40014588-CH1-DOWNLOADING_COMMAND_LINE_TOOLS_IS_NOT_AVAILABLE_IN_XCODE_FOR_MACOS_10_9__HOW_CAN_I_INSTALL_THEM_ON_MY_MACHINE_).

**Windows 10 (1709+):** Get the [Windows Subsystem for Linux](https://docs.microsoft.com/windows/wsl/install-win10). For **Windows 10 (1607 & 1703)**, go [here](https://docs.microsoft.com/windows/wsl/install-legacy) instead.

**Windows Vista, 7, 8, 8.1, and 10 (1507 & 1511):** Get [Cygwin](https://cygwin.com/install.html) and [include](https://cygwin.com/cygwin-ug-net/setup-net.html#setup-packages) the `make`, `git`, `gcc-core`, `gcc-g++`, `libpng-devel` packages.


## Installation

To set up the repository:

	git clone https://github.com/pret/pokefirered
	git clone https://github.com/luckytyphlosion/agbcc -b new_layout_with_libs

	cd agbcc
	make
	make install prefix=../pokefirered

	cd ../pokefirered
	./build_tools.sh

To build **pokefirered.gba**:

	make -j$(nproc)

**Note:** If only `.c` or `.s` files were changed, turn off the dependency scanning temporarily. Changes to any other files will be ignored and the build will either fail or not reflect those changes.

	make -j$(nproc) NODEP=1

**Note 2:** If the build command is not recognized on Linux, including the Linux environment used within Windows, run `nproc` and replace `$(nproc)` with the returned value (e.g.: `make -j4`). Because `nproc` is not available on macOS, the alternative is `sysctl -n hw.ncpu`.
