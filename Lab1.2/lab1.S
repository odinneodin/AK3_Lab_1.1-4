.global lab1
.syntax unified
#define A #10
#define B #5
#define C #3
lab1:
    push {lr}
    // (A-B)
    mov r0, A
    mov r1, B
    SUB r0, r0, r1
    // (A-B)*3
    mov r1, #3
    MUL r0, r0, r1
    // 2^C
    mov r1, C
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
	add r0, r0, r2

pop {pc}
