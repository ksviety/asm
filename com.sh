nasm -f elf $1.asm
ld -m elf_i386 -s -o build_$1 $1.o
rm -r $1.o
./builds/$1
