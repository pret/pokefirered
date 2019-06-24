CC := gcc
CFLAGS := -O3

all: br_ips ips_patch

clean:
	rm -f br_ips ips_patch br_ips.exe ips_patch.exe

br_ips: br_ips.c
	$(CC) $(CFLAGS) -o $@ $^

ips_patch: ips_patch.c
	$(CC) $(CFLAGS) -o $@ $^
