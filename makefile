# hello.asm
# -f: The output format.
# -g: Include debug information.
# -F: The debug information format.
# -l: Generate .lst file.

# TODO: Properly setup this make file.

hello: hello.o hello2.o hello3.o
	gcc -o bin/hello hello.o -no-pie
	gcc -o bin/hello2 hello2.o -no-pie
	gcc -o bin/hello3 hello3.o -no-pie
hello.o: hello.asm
	nasm -f elf64 -g -F dwarf hello.asm -l hello.lst
hello2.o: hello2.asm
	nasm -f elf64 -g -F dwarf hello2.asm -l hello2.lst
hello3.o: hello3.asm
	nasm -f elf64 -g -F dwarf hello3.asm -l hello3.lst
