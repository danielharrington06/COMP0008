a:
addi $8 $0 7 # a is the value we operate on
one:
addi $1 $0 1 # used to check equal to one and check odd
two:
addi $3 $0 3 # used to multiply by 3
check:
beq $8 $1 end # check equal one
andi $9 $8 0x0001 # extract last bit
beq $9 $1 even #check odd
odd:
sra $8 $8 1 #div 2
b check
even:
mult $3 $8 #multiply by 3
mflo $8 #extract low part (as won't go over 2^31-1)
addi $8 $8 0x1 # add one
b check
end:
move $a0, $8
li $v0, 36
syscall
