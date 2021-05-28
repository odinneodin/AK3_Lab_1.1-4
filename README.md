# AK3_Lab_1.1-4
Lab1.1
export PATH=$PATH:~/opt/xPacks/qemu-arm/2.8.0-7/bin/
make
make qemu
gdb-multiarch firmware.elf
(gdb) target extended-remote:1234
(gdb) step

Lab1.2
export PATH=$PATH:~/opt/xPacks/qemu-arm/2.8.0-7/bin/
make
make qemu
gdb-multiarch firmware.elf
(gdb) target extended-remote:1234
(gdb) layout regs

Lab1.3
export PATH=$PATH:~/opt/xPacks/qemu-arm/2.8.0-7/bin/
make
make qemu
gdb-multiarch firmware.elf
(gdb) target extended-remote:1234
(gdb) step
(gdb) continue 

Lab1.4
export PATH=$PATH:~/opt/xPacks/qemu-arm/2.8.0-7/bin/
make
make qemu
gdb-multiarch firmware.elf
(gdb) target extended-remote:1234
(gdb) layout regs
(gdb) step
