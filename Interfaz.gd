extends CanvasLayer

signal iniciar_juego

func mostar_mensaje(texto):
	$Mensaje.text = texto
	$Mensaje.show()
	$MensajeTimer.start()

func game_over():
	mostar_mensaje("Game Over")
	#Cualquier cosa que vaya pasa hasta que la señal
	#Se emita
	yield($MensajeTimer,"timeout")
	$BotonPlay.show()
	$Mensaje.text="HOPE"
	$Mensaje.show()

func update_score(Puntos):
	$Score.text = str(Puntos)

func _on_MensajeTimer_timeout():
	$Mensaje.hide()

func _on_BotonPlay_pressed():
	$BotonPlay.hide()
	emit_signal("iniciar_juego")
