addi $s0 $0 14 # a is the value we operate on
addi $s1 $0 1 # used to check equal to one and check odd
addi $s3 $0 3 # used to multiply by 3
addi $s4 $0 500
print:
move $a0, $s0
li $v0, 36
syscall
li $v0, 11
li $a0, 10       # print newline
syscall
beq $s0 $s1 end # check equal one
addi $s4 $s4 -1
beq $s4 $0 end # check 500 loops
#check even or odd
andi $9 $s0 1 # extract last bit
beq $9 $s1 odd
#even
srl $s0 $s0 1 #div 2
b print
odd:
sll $9 $s0 1
add $s0 $9 $s0 #shift left (*2) and adding it again achieves *3
addi $s0 $s0 0x1 # add one
b print
end:
li $v0, 10
syscall