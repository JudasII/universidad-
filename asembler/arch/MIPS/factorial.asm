.data

base: 5
inical: 1
final : 1
.text
lw $t1,base
lw $t3,base
lw $t4,inical
lw $t2,final

repita: 
	mul $t4,$t4,$t3
	sub $t3,$t3,1
	beq $t3,$t2,salida
	j repita
salida:
    li  $v0, 1           # service 1 is print integer
    add $a0, $t3, $zero  # load desired value into argument register $a0, using pseudo-op
    syscall