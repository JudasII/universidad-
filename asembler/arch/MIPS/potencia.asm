.data

base: .word 2
potencia: .word 7
inical: 1

.text
lw $t1,base
lw $t2,potencia
lw $t4,inical

repita: 
	addi $t3,$t3,1
	mul $t4,$t4,$t1
	beq $t3,$t2,salida
	j repita
salida: