6348ca9586:6348ca9586.o
	gcc -o 6348ca9586 6348ca9586.o
6348ca9586.0:6348ca9586.c
	gcc -c 6348ca9586.c
clean:
	rm 6348ca9586 6348ca9586.o

# There are several bugs in the Makefile
# Please fix this and
# change the output target name to the (output of the binary)+(first commit hash 5 digits)
# e.g: output is c92ab
# commit: 4c10a3dc5ef5168eead13691b4a0eeb33552d9a0
# Then the target is c92ab4c10a

