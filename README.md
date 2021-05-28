export PATH=$PATH:~/opt/xPacks/qemu-arm/2.8.0-7/bin/
make
make qemu
gdb-multiarch firmware.elf
(gdb) target extended-remote:1234
(gdb) step
