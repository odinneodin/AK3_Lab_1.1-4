.syntax unified
.cpu cortex-m4

//.fpu softvfp
.thumb

.global vtable_kernel
.global __kernel_reset__

.type vtable_kernel, %object
.type __kernel_reset__, %function

.section .interrupt_vector
vtable_kernel:
	.word __stack_start
	.word __kernel_reset__+1
	.size vtable_kernel, .-vtable_kernel

.section .rodata
	start: .asciz "kernel start\n"
	finish: .asciz "result in reg #3: "

.section .text
__kernel_reset__:
	ldr r0, =start
	bl dbgput_line

	// calc part	
	  // (A-B)
    mov r0, #10 
	// ^ r0 = A = 10
    mov r1, #5
	// ^ r1 = B = 5
    SUB r0, r0, r1
    // (A-B)*3
    mov r1, #3
    MUL r0, r0, r1
    // 2^C
    mov r1, #3
	// ^ r1 = C = 3
    mov r2, #1
    mov r3, #2
Start:
	cmp r1, #0
	ble End

	mul r2, r2, r3
	sub r1, r1, #1
	
	b Start
End:
	// (A-B)*3+2^C
	add r3, r0, r2

    ldr r0, =finish
    bl dbgput

    mov r0, r3      // Move result to r0
    bl dbgput_num
    
end:
b end

