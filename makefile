# hello.asm
# -f: The output format.
# -g: Include debug information.
# -F: The debug information format.
# -l: Generate .lst file.

hello: hello.o
	gcc -o bin/hello hello.o -no-pie
hello.o: hello.asm
	nasm -f elf64 -g -F dwarf hello.asm -l hello.lst
