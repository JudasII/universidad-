# Menu de opciones
	.data
menu:	.asciiz "Calculadora de movimientos fisicos, ingrese el movimiento que desee\n1. movimiento rectilineo uniforme\n2. movimiento parabolico\n3. movimiento circular uniforme\n4. Salir\n"
textoIn:.asciiz "Ingrese el movimiento que desea\n"
mru:	.asciiz "Movimiento rectilineo uniforme\n"
tp:	.asciiz "Movimiento parabolico\n"
mcu:	.asciiz "Movimiento circular uniforme\n"
salir:	.asciiz "Usted ha salido"

textomru: .asciiz "el movimiento rectilineo uniforme está dado por la ecuacion V=x/t,donde puede o no haber condiciones iniciales, ingrese el valor que desea conocer\n1.velocidad\n2.tiempo\n3.distancia.\n4.volver al menu\n"

mruT: .asciiz "ingrese el valor del tiempo\n"
mruX: .asciiz "ingrese el valor de la distancia\n"
mruV: .asciiz "ingrese el valor de la velocidad\n"
mruTi: .asciiz "ingrese el valor del tiempo inicial, si no desea usar este parametro, ingrese un 0\n"
mruXi: .asciiz "ingrese el valor de la distancia inicial, si no desea usar este parametro, ingrese un 0\n"
mruVi: .asciiz "ingrese el valor de la velocidad inicial, si no desea usar este parametro, ingrese un 0\n"

resultadoVel: .asciiz "la velocidad es: \n"
resultadoTime: .asciiz "el tiempo es: \n"
resultadoDist: .asciiz "la distancia recorrida fue: \n"

textotp: .asciiz "el tiro parabolico se trata de un movimiento vecorial en R2, con su respectiva componente en el eje X y Y.\n la componente X de este movimiento es un MRU mientras que la componente Y se ve afectada por una aceleracion constante, la gravedad\n elija la componente que desea calcular \n1. componente X. \n2.componente Y.\n3.volver al menu\n"
textoComponenteX: .asciiz "esta componente es un movimiento rectilineo uniforme presione\n 1. para calcular sobre este movimiento\n2. para regresar a las componentes\n"
textoComponenteY: .asciiz "esta componente es un movimiento uniformemente acelerado, la gravedad se asume como 9.8 m/s2\n ingrese el valor que desea conocer \n1.velocidad. \n2. tiempo. \n3.distancia \n4.para regresar a las componentes"

textomcu: .asciiz "el movimiento circular uniforme es el que tiene un cuerpo al moverse al rededor de un eje, con una velocidad angular  y un radio constantes, describiendo un curculo, con un vector de aceleracion centripeta que hace que se mantenga dicha trayectoria.\n"
menumcu: .asciiz "escriba el valor que desea conocer\n 1.posicion angular.\n 2.velocidad angular.\n 3.tiempo.\n 4.volver al menu\n"

vAngular: .asciiz "que parametro desea usar para conocer la velicudad angular\n 1.periodo.\n 2.frecuencia.\n 3.para regresar al menu del movimiento.\n"
mcuX: .asciiz "ingrese el valor de la posicion angular\n"
mcuXi: .asciiz "ingrese el valor de la posicion angular inicial, si no desea usar este parametro, ingrese un 0\n"
mcuV: .asciiz "ingrese el valor de la velocidad angular\n"
mcuT:.asciiz "ingrese el valor del periodo\n"
mcuF:.asciiz "ingrese el valor de la frecuencia\n"

pi: .word 3,141592
gravedad: .word 9.807
dos: 2

	.text	
imprimirMenu:

	la	$a0,menu
	li	$v0,4
	syscall
	
	la	$a0,textoIn
	li	$v0,4
	syscall
		
	li	$v0,5
	syscall
	
	move $t1,$v0
	
	beq $t1,1,opcion1
	beq $t1,2,opcion2
	beq $t1,3,opcion3
	beq $t1,4,opcionSalir
	j imprimirMenu
	
opcion1:
	la	$a0,mru
	li	$v0,4
	syscall
	
	la	$a0,textomru
	li	$v0,4
	syscall
	
	li	$v0,5
	syscall	
	move $t1,$v0
	
	beq $t1,1,calcularVelocidad
	beq $t1,2,calcularTiempo
	beq $t1,3,calcularDistancia

	beq $t1,4,imprimirMenu

calcularVelocidad:

	la $a0, mruT
	li $v0,4
	syscall
	li $v0,5
	syscall
	move $t1,$v0
	
	la $a0, mruX
	li $v0,4
	syscall
	li $v0,5
	syscall
	move $t3,$v0
		
	la $a0, mruTi
	li $v0,4
	syscall
	li $v0,5
	syscall
	move $t2,$v0
	
	la $a0, mruXi
	li $v0,4
	syscall
	li $v0,5
	syscall
	move $t4,$v0
		
	sub $t5,$t3,$t4
	sub $t6,$t1,$t2
		
	div $t0,$t5,$t6	
	la $a0, resultadoVel
	li $v0,4
	syscall
	
	move $a0,$t0
	li $v0,1
	syscall
	j opcion1
	
calcularDistancia:

	la $a0, mruT
	li $v0,4
	syscall
	li $v0,5
	syscall
	move $t1,$v0
	
	la $a0, mruV
	li $v0,4
	syscall
	li $v0,5
	syscall
	move $t3,$v0
		
	la $a0, mruTi
	li $v0,4
	syscall
	li $v0,5
	syscall
	move $t2,$v0
	
	la $a0, mruXi
	li $v0,4
	syscall
	li $v0,5
	syscall
	move $t4,$v0
		

	sub $t6,$t1,$t2
	mul $t5,$t3,$t6
		
	add $t0,$t4,$t6	
	la $a0, resultadoDist
	li $v0,4
	syscall
	
	move $a0,$t0
	li $v0,1
	syscall
	j opcion1

calcularTiempo:	
		
	la $a0, mruV
	li $v0,4
	syscall
	li $v0,5
	syscall
	move $t1,$v0
	
	la $a0, mruX
	li $v0,4
	syscall
	li $v0,5
	syscall
	move $t3,$v0
		
	la $a0, mruTi
	li $v0,4
	syscall
	li $v0,5
	syscall
	move $t2,$v0
	
	la $a0, mruXi
	li $v0,4
	syscall
	li $v0,5
	syscall
	move $t4,$v0
		
	sub $t5,$t3,$t4
	div $t6,$t5,$t1
	add $t0,$t5,$t6
	la $a0, resultadoTime
	li $v0,4
	syscall
	
	move $a0,$t0
	li $v0,1
	syscall
	j opcion1
	
opcion2:
	la	$a0,tp
	li	$v0,4
	syscall
	
	la	$a0,textotp
	li	$v0,4
	syscall
	
	li	$v0,5
	syscall	
	move $t1,$v0
	
	beq $t1,1,componenteX
	beq $t1,2,componenteY
	beq $t1,3,imprimirMenu
	
componenteX:

	la	$a0,tp
	li	$v0,4
	syscall
	
	la	$a0,textoComponenteX
	li	$v0,4
	syscall
	
	li	$v0,5
	syscall	
	move $t1,$v0
	
	beq $t1,1,opcion1
	beq $t1,2,opcion2
		
componenteY:

	la	$a0,tp
	li	$v0,4
	syscall
	
	la	$a0,textoComponenteY
	li	$v0,4
	syscall
	
	li	$v0,5
	syscall	
	move $t1,$v0
	
	beq $t1,1,calcularVelocidadY
	beq $t1,2,calcularTiempoY
	beq $t1,3,calcularDistanciaY
	beq $t1,4,opcion2
	
calcularVelocidadY:
	la $a0, mruT
	li $v0,4
	syscall
	li $v0,5
	syscall
	move $t1,$v0
		
	la $a0, mruVi
	li $v0,4
	syscall
	li $v0,5
	syscall
	move $t2,$v0

	lw $t4,gravedad
	

	mul $t5,$t1,$t4
	add $t0,$t2,$t5
	
	la $a0, resultadoVel
	li $v0,4
	syscall
	
	move $a0,$t0
	li $v0,1
	syscall
	j componenteY
	
calcularTiempoY:

	la $a0, mruV
	li $v0,4
	syscall
	li $v0,5
	syscall
	move $t1,$v0	

	la $a0, mruVi
	li $v0,4
	syscall
	li $v0,5
	syscall
	move $t2,$v0

	lw $t3,gravedad
	
	sub $t4,$t1,$t2
	div $t0,$t4,$t3
	
	la $a0, resultadoTime
	li $v0,4
	syscall
	
	move $a0,$t0
	li $v0,1
	syscall
	j componenteY

calcularDistanciaY:

	la $a0, mruV
	li $v0,4
	syscall
	li $v0,5
	syscall
	move $t1,$v0	

	la $a0, mruVi
	li $v0,4
	syscall
	li $v0,5
	syscall
	move $t2,$v0
		
	la $a0, mruT
	li $v0,4
	syscall
	li $v0,5
	syscall
	move $t3,$v0

	la $a0, mruXi
	li $v0,4
	syscall
	li $v0,5
	syscall
	move $t4,$v0
	
	lw $t5,dos
	
	add $t6,$t1,$2
	div $t7,$t6,$t5
	mul $t6,$t7,$t3
	add $t0,$t6,$t4

	la $a0, resultadoDist
	li $v0,4
	syscall
	
	move $a0,$t0
	li $v0,1
	syscall
	j componenteY

opcion3:
	la	$a0,mcu
	li	$v0,4
	syscall
	
	la	$a0,textomcu
	li	$v0,4
	syscall
	
	la	$a0, menumcu
	li	$v0,4
	syscall
	
	li	$v0,5
	syscall	
	move $t1,$v0
	
	beq $t1,1,VelocidadAngular
	beq $t1,2,calcularTiempomcu
	beq $t1,3,calcularPosicionAngular
	beq $t1,4,imprimirMenu
	
VelocidadAngular:
	la $a0, vAngular
	li $v0,4
	syscall	
	
	li	$v0,5
	syscall	
	move $t1,$v0
	
	beq $t1,1,VelocidadAngular
	beq $t1,2,calcularTiempomcu
	beq $t1,3,opcion3
	
calcularVelocidadT:
	la $a0, mcuT
	li $v0,4
	syscall
	li $v0,5
	syscall
	move $t1,$v0	
	lw $t3,pi
	lw $t4,dos
	mul $t2,$t3,$t4	
	mul $t0,$t2,$t1
	
	la $a0, resultadoVel
	li $v0,4
	syscall
	
	move $a0,$t0
	li $v0,1
	syscall
	j opcion3
	
calcularVelocudadF:
	la $a0, mcuF
	li $v0,4
	syscall
	li $v0,5
	syscall
	move $t1,$v0	
	
	lw $t3,pi
	lw $t4,dos
	mul $t2,$t3,$t4
	div $t0,$t2,$t1
	
	la $a0, resultadoVel
	li $v0,4
	syscall
	
	move $a0,$t0
	li $v0,1
	syscall
	j opcion3
calcularTiempomcu:
	la $a0, mcuX
	li $v0,4
	syscall
	li $v0,5
	syscall
	move $t1,$v0	

	la $a0, mcuXi
	li $v0,4
	syscall
	li $v0,5
	syscall
	move $t2,$v0

	la $a0, mcuV
	li $v0,4
	syscall
	li $v0,5
	syscall
	move $t3,$v0
	
	sub $t4,$t1,$t2
	div $t0,$t4,$t3
	
	la $a0, resultadoTime
	li $v0,4
	syscall
	
	move $a0,$t0
	li $v0,1
	syscall
	j opcion3

calcularPosicionAngular:
	la $a0, mruT
	li $v0,4
	syscall
	li $v0,5
	syscall
	move $t1,$v0
		
	la $a0, mcuV
	li $v0,4
	syscall
	li $v0,5
	syscall
	move $t2,$v0
	
	la $a0, mcuXi
	li $v0,4
	syscall
	li $v0,5
	syscall
	move $t3,$v0

	mul $t5,$t1,$t2
	add $t0,$t3,$t5
	
	la $a0, resultadoDist
	li $v0,4
	syscall
	
	move $a0,$t0
	li $v0,1
	syscall
	j componenteY

opcionSalir:
	la	$a0,salir
	li	$v0,4
	syscall
