extends RigidBody2D

# dos variables
export (int) var velocidad_min
export (int) var velocidad_max
#Agregamos los tipos de enemigos
var tipo_nave = ["enemigo"]

func _ready():
	#AL inciar carcamos el sprite animado le cargamos el tipo de nave y el randi
	#es el aleatorio
	$AnimatedSprite.animation = tipo_nave[randi() % tipo_nave.size()]
	#Si hubiera una nave mas grande
	# if $AnimatedSprite.animation == "enemigo_grande":
		#Aqui aumentamos la escala de colicion si
		#existiera una nave mas grande
		# $CollisionShape2D.scale.x = 1.5
		# $CollisionShape2D.scale.y = 1.5

func _on_visibilidad_screen_exited():
	queue_free()
