addi $t1 $zero 8
addi $t2 $zero 7

sltu $t0 $t1 $t2
#$t3 is 1 if t1 < t2, 0 otherwise

mult $t1 $t0
mflo $t1

xori $t0, $t0, 1

mult $t2 $t0
mflo $t2

add $t0 $t1 $t2

move $a0, $t0
li $v0, 36
syscall

li $v0, 10
syscall