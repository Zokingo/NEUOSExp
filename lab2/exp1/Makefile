AS=as --32
CC=gcc
LD=ld -m elf_i386
OBJCOPY=objcopy
QEMU=qemu-system-i386
BOCHS=bochs
STRIP=strip
_ALLWARN=-Wall -Wextra -Waddress -Wconversion
CFLAGS=-g -m32 -fno-builtin -fno-stack-protector -fomit-frame-pointer -fstrength-reduce $(_ALLWARN)

LDFLAGS	+= -Ttext 0

.PHONY=clean run all

all: bootimg

bootsect: bootsect.s ld-bootsect.ld
	@$(AS) -n -g -o bootsect.o bootsect.s
	@ ld -T ld-bootsect.ld bootsect.o -o bootsect
	@$(LD) $(LDFLAGS) -o bootsect bootsect.o
	@cp -f bootsect bootsect.sym
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary bootsect

demo: demo.s
	@$(AS) -n -g -o demo.o demo.s
	@$(LD) $(LDFLAGS) -o demo demo.o
	@cp -f demo demo.sym
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary demo

bootimg: demo bootsect
	@dd if=bootsect of=bootimg bs=512 count=1
	@dd if=demo of=bootimg bs=512 count=4 seek=1
	@echo "Build bootimg done"

run: bootimg
	$(QEMU) -boot a -fda bootimg

run_debug:
	$(QEMU) -boot a -fda bootimg -S -s

clean:
	@rm -f bootsect bootsect.o bootsect.sym	demo demo.sym bootimg a.out
