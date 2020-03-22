/*
 * memory map
 * url: https://github.com/kendryte/kendryte-doc-datasheet/blob/master/en/003.md
 */

OUTPUT_ARCH("riscv")
ENTRY(_entry)

MEMORY
{
	/* General-purpose SRAM with cache */
	RAM (rwx)	: ORIGIN = 0x80000000, LENGTH = 0x600000
	/* AI SRAM with cache */
	RAM_AI (rw)	: ORIGIN = 0x80600000, LENGTH = 0x200000

	/* General-purpose SRAM without cache */
	RAM_nocache (rwx)	: ORIGIN = 0x40000000, LENGTH = 0x600000
	/* AI SRAM without cache */
	RAM_AI_nocache (rw)	: ORIGIN = 0x40600000, LENGTH = 0x200000
}

SECTIONS
{
	.text : ALIGN(8)
	{
		KEEP(*(.text.entry))
		*(.text .text.*)
	} > RAM AT> RAM

	.rodata : ALIGN(8)
	{
		*(.rodata .rodata.*)
	} > RAM AT> RAM

	.data : ALIGN(8)
	{
		*(.data .data.*)
	} > RAM AT> RAM

	.bss : ALIGN(8)
	{
		*(.bss .bss.*)
	} > RAM AT> RAM
}
