extends Area2D

#Variable en el codigo
#var velocidad = 400

#variable que se va al objeto
export (int) var velocidad

#Aqui declaramos un vector(X,Y)
var movimiento = Vector2()
var limite
#Recibe señal de golpe es como eventos
signal golpe

func _ready():
#Pass significa que pasa ala siguiente linea
	#pass
	#Esconder el personaje
	hide()
	#Toma el tamaño de la pantalla el get view
	limite = get_viewport_rect().size #
	


func _process(delta):
	#Se reinicia la variable es decir se actualiza
	
	movimiento = Vector2()
#	Las entradas o inputs
#	Presion de tecla o mouse
#	Verificamos si una tecla derecha es presionada
	if Input.is_action_pressed("ui_right"): #Derecha
		movimiento.x += 1
	if Input.is_action_pressed("ui_left"): #Izquierda
		movimiento.x -= 1
	if Input.is_action_pressed("ui_down"): #Abajo
		movimiento.y += 1
	if Input.is_action_pressed("ui_up"): #Arriba
		movimiento.y -= 1
	if movimiento.length() > 0: #verificar si se esta moviendo
		
		#Normalizamos la velocidad es decir si se aprietan dos teclas
		#Se moveria mas rapido en diagonal pero al normalizar 
		#Avanza de manera correcta
		movimiento = movimiento.normalized() * velocidad
		
		#Velocidad que el juego intenta llevar
		#independiente mente de la computadora
		position += movimiento * delta
		
		#Clamp es como atrapar
		#Aqui la posicon es el primer valor
		#Luego sigue el pixel donde minimo, y luego
		#el maximo que es tocable es decir (0 ,250)
		#Basicamente es limitar para no salirte
		position.x = clamp(position.x,0,limite.x)
		position.y = clamp(position.y,0,limite.y)
	#Esto es para cambiar animacion
	#Aun no lo ocupo
	#
	#if movimiento.x !=0:
	#  Simbolo de dinero nos ayuda a buscar un nodo
	# $Sprite_player.animation = "nombredetuanimacion"
	# $Sprite_player.flip_h = movimiento.x < 0 #voltear o invertir
	#elif movimiento.y !=0:
	# $Sprite_player.animation = "nombredetuanimacion"
	# $Sprite_player.flip_h = movimiento.y < 0 #voltear o invertir
	# else
	# $Sprite_player.animation = "animacion"
	
	
func _on_Player_body_entered(body): #cuando exista colicion con un cuerpo
	hide() #escondemos al personaje
	emit_signal("golpe") #enviamos la señal de golpe
	$CollisionShape2D.disabled = true #desactivamos la colicion

func inicio(pos):
	position = pos # Iniciamos y damos la posicion
	show() #Mostramos de nmuevo al objeto
	$CollisionShape2D.disabled = false #vuelve a tener colicion
		
	
	



