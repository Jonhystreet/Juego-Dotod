extends Node
export (PackedScene) var Enemi

var score

func _ready():
	randomize()

func nuevo_juego():
	#Cada nuevo juego el score es de cero
	score = 0
	#A el npdp de player llamamos la funcion inicio
	#y le asignamos el valor del nodo posicion de inicio
	$Player.inicio($PosicionDeInicion.position)
	#Iniciamos el timer cuando inicie osea 
	#cuando jugemos se incia un conteo 2,1,0
	#al Llegar se activa lafuncion timer_timeout
	#lo que pasa es que ahora inicia todo  
	$Inicio_timer.start()
	$Interfaz.mostar_mensaje("Listo!!")
	$Interfaz.update_score(score)
	

func game_over():
	#Detienes el tiempo del timer cuando pierdes
	$Enemi_timer.stop()
	$Score_timer.stop()
	$Interfaz.game_over()

func _on_Inicio_timer_timeout():
	#cuando termina el inicio timer
	#reactiva el score y el enemi timer
	$Score_timer.start()
	$Enemi_timer.start()

#Timer de los puntos
func _on_Score_timer_timeout():
	score +=1
	$Interfaz.update_score(score )
	
#Timer de la roca cuando acaba
func _on_Enemi_timer_timeout():
	#usa el camino y  agarra una posicion
	#random para disparar una navesita
	#lugar aleatorio en el camino
	$Camino/NaveSigue.set_offset(randi())
	
	var nave = Enemi.instance()
	add_child(nave)
	
	#Seleccionar una direccion
	var camino = $Camino/NaveSigue.rotation +  PI/2
	
	nave.position = $Camino/NaveSigue.position
	
	camino += rand_range(-PI /4, PI/4)
	nave.rotation = camino
	
	nave.set_linear_velocity(Vector2(rand_range(nave.velocidad_min, nave.velocidad_max), 0).rotated(camino))
	



