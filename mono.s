.global mono #expose symbol
.data
t1:
        .word   1 #test case 1
        .word   2
        .word   2
        .word   4
        .word   5
t2:
        .word   5 #test case 2
        .word   4
        .word   3
        .word   3
        .word   1
t3:
        .word   1 #test case 3
        .word   2
        .word   3
        .word   1
        .word   0
t4:
        .word   255 #test case 4
        .word   255
        .word   255
        .word   255
        .word   255
t5:
        .word   1245 #test case 5
        .word   1333
        .word   1453
        .word   2008
        .word   -1
.text
main:
        la a0,t1 #argument 0 to mono
        li a1,5 #argument 1 to mono
        call mono
        mv a0,s0
        call print
        la a0,t2 #argument 0 to mono
        li a1,5 #argument 1 to mono
        call mono
        mv a0,s0
        call print
        la a0,t3 #argument 0 to mono
        li a1,5 #argument 1 to mono
        call mono
        mv a0,s0
        call print
        la a0,t4 #argument 0 to mono
        li a1,5 #argument 1 to mono
        call mono
        mv a0,s0
        call print
        la a0,t5 #argument 0 to mono
        li a1,5 #argument 1 to mono
        call mono
        mv a0,s0
        call print
        j end
mono:
        li t0,0 #a
        li t1,0 #d
        li t2,0 #eq
        li t3,0 #i
        mv t4,a1
        addi t4,t4,-1 #numsize-1
loop:
        bge t3,t4,ret #check i<numSize-1
        slli s0,t3,2 #array index nums[i]
        addi s1,s0,4 #array index nums[i+1]
        add t6,s0,a0 #ptr to nums[i]
        lw s2,0(t6) #nums[i]
        add t6,s1,a0 #ptr to nums[i+1]
        lw s3,0(t6) #nums[i+1]
        bnez t0,sk1 #skip if set
        slt t0,s2,s3 #if(nums[i]<nums[i+1])a=true
sk1:
        bnez t1,sk2 #skip if set
        slt t1,s3,s2 #if(nums[i]>nums[i+1])d=true
sk2:
        addi t3,t3,1 #++i
        bne s2,s3,loop #if(nums[i]!=nums[i+1])loop
        addi t2,t2,1 #eq++
        j loop
ret:
        xor s0,t0,t1 #s0<=a^d
        xor t2,t2,t4 #use xor to check (eq==numSize-1)
        seqz t2,t2 #t2<=(eq==numsSize-1)
        or s0,s0,t2 #s0<=s0|(eq==numsSize-1)
        jr ra
print:
true:
        beqz a0,false
        la a0, true_str # load address of string
        li a7, 4   # 4 means print string
        ecall
        jr ra
false:
        la a0, false_str # load address of string
        li a7, 4   # 4 means print string
        ecall
        jr ra
end:
        addi zero, zero, 0 #nop
true_str:
        .string "true\n"
false_str:
        .string "false\n"