.global lab4
.syntax unified

#define X1 #-9
#define X2 #10
#define X3 #31
#define X4 #-21

lab4:
	push {lr}
	bl task1
	bl task2
	pop {pc}

task1:
	push {lr}
	mov r0, X1  // значение X1
	mov r1, #0xFFFFFFFF

	mov r2, X2  // значение X2
	mov r3, #0

	mov r4, X3 // значение X3
	mov r5, #0 

	mov r6, X4  // значение X4
	mov r7, #0xFFFFFFFF

	// Calculation
	adds r0, #1      // x1 + 1
	adc r1, #0

	subs r0, r2      // (x1 + 1) - x2
	sbc r1, r3
	
    mov r8, #0
    lsr r0, #1
    asrs r1, #1
    adc r8, #0
    lsl r8, #31
    orr r0, r8
	      // ( (x1 + 1) - x2 )  / 2


    mov r8, #0
    lsr r0, #1
    asrs r1, #1 
    adc r8, #0
    lsl r8, #31
    orr r0, r8 
	     // (( (x1 + 1) - x2 )  / 2  )  / 2
	    

	and r4, r6     // X3 & X4 
	and r5, r7     
	
	neg r4, r4      // not (X3 & X4)
    add r5, #1
	neg r5, r5     

    lsl r5, #1
	lsls r4, #1      // (not (X3 & X4))*2
    adcs r5, #0
   
    lsl r5, #1

	lsls r4, #1      // (not (X3 & X4))*2*2
    adcs r5, #0

	and r0, r4         
	and r1, r5

    subs r0, #1
    sbc r1, #0
	
	bl step1
	pop {pc}
	


// Result correction
step1:
	push {lr}
	bvc step2

    mov r8, 0
    lsrs r1, #1
    adc r8, 0
    lsl r8, 31
    lsr r0, #1
    orr r0, r8
step2:
	orr r0, #0 //перевірка на рівність нулю
	bne step4 // якщо ні, перейти на крок 4
step3:
	mov r1, #0b10000001110111
step4:
    mov r8, #0b10000001110111
	add r0, r8 
step5:
	and r3, r1, #0b10000000000000000000000000000000
    and r4, r1, #0b01000000000000000000000000000000
    lsl r4, #1
    cmp r3, r4
	beq step7
step6:
    mov r8, 0
    lsrs r1, #1
    adc r8, 0
    lsl r8, 31
    lsr r0, #1
    orr r0, r8
step7:
	bvs end_check_result
	push {r0}
	push {r1}
	pop {r1}
	pop {r0}

end_check_result:
	pop {pc}

task2:
	push {lr}

	mov r0, #0
	mov r1, #1
	mov r2, #2
    mov r3, #3
    mov r4, #4


program1:
	orr r2, r4 // 1
	add r2, #8 // 2
while:
    lsrs r2, #1 // 3
    bcs branch2  //  4
branch1:
	and r2, #0 // 5
    add r2, #1 // 7
    bl program2 // перехід після IV
    b skip
branch2:
    adds r0, 10 // 6
    bvc while // 8
    add r0, 1 // 9 
skip:
    pop {pc}
program2:
	push {lr}
while2:
    ands r0, #-6 // 10
    bpl jump // 11
    adds r0, #6 //12
jump:
    bcs while2 //13
    bl program3 // перехід XII
    add r1, #1  //14
    add r1, #2  //15
    
    pop {pc}
program3:
	push {lr}
	mov r0, #0
	add r0, #2048
	pop {pc}

