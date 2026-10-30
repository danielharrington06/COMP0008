addi $8 $0 7 # a is the value we operate on
addi $1 $0 1 # used to check equal to one and check odd
addi $3 $0 3 # used to multiply by 3
print:
move $a0, $8
li $v0, 36
syscall
li $v0, 11
li $a0, 10       # print newline
syscall
beq $8 $1 end # check equal one
#check even or odd
andi $9 $8 1 # extract last bit
beq $9 $1 odd
#even
srl $8 $8 1 #div 2
b print
odd:
sll $9 $8 1
add $8 $9 $8 #shift left (*2) and adding it again achieves *3
addi $8 $8 0x1 # add one
b print
end:
li $v0, 10
syscall