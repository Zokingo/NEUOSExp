/* 实验2 Step 2 编写 linker script*/
OUTPUT_FORMAT(elf32-i386)
OUTPUT_ARCH(i386)

SECTIONS {
    .text 0x0000 : {
	   * (.text)
    }

    /DISCARD/ : {

    }
}
