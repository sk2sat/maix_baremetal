// entry point
.global _entry
.extern start

.section .text.entry
_entry:
	csrw mideleg, 0
	csrw medeleg, 0
	csrw mie, 0
	csrw mip, 0
	csrr a0, mhartid	// core number
	lla sp, stack
	j start

.section .bss
.skip 1024
stack:
