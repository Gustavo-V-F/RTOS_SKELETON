	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"_delay.c"
	.text
	.align	2
	.global	_delay_us
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	_delay_us, %function
_delay_us:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	ldr	r3, .L5
	ldr	r3, [r3]
	ldr	r2, .L5+4
	cmp	r3, r2
	bcc	.L4
	ldr	r3, .L5
	ldr	r3, [r3]
	ldr	r2, .L5+8
	umull	r1, r3, r2, r3
	lsr	r3, r3, #18
	ldr	r2, [fp, #-16]
	mul	r3, r2, r3
	lsl	r3, r3, #1
	str	r3, [fp, #-8]
	ldr	r0, [fp, #-8]
	bl	_delay_loops
	b	.L1
.L4:
	nop
.L1:
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L6:
	.align	2
.L5:
	.word	SystemCoreClock
	.word	3000000
	.word	375299969
	.size	_delay_us, .-_delay_us
	.align	2
	.global	_delay_ms
	.syntax unified
	.arm
	.fpu softvfp
	.type	_delay_ms, %function
_delay_ms:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #5
	sub	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r0, r3
	bl	_delay_us
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	_delay_ms, .-_delay_ms
	.align	2
	.global	_delay_loops
	.syntax unified
	.arm
	.fpu softvfp
	.type	_delay_loops, %function
_delay_loops:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	lsr	r3, r3, #1
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	.syntax divided
@ 22 "_delay.c" 1
	0:subs r3, 1;bne 0b;
@ 0 "" 2
	.arm
	.syntax unified
	str	r3, [fp, #-8]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	_delay_loops, .-_delay_loops
	.ident	"GCC: (Arch Repository) 9.2.0"
