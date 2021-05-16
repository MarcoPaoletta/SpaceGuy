extends CanvasLayer
signal iniciar_juego
# MENSAJE
func mostrar_mensaje(texto):
	$Mensaje.text = texto
	$Mensaje.show()
	$MensajeTimer.start()
# GAME OVER
func game_over():
	mostrar_mensaje("Game Over")
	yield($MensajeTimer, "timeout")
	$BotonPlay.show()
	$Mensaje.text = "Space Guy"
	$Mensaje.show()
# ACTUALIZAR PUNTOS
func update_score(Puntos): 
	$ScoreLabel.text = str(Puntos)
	 
# TIMER MENSAJE
func _on_MensajeTimer_timeout():
	$Mensaje.hide()
	
# BOTON PRESIONADO DE JUGAR
func _on_BotonPlay_pressed():
	$BotonPlay.hide()
	emit_signal("iniciar_juego")

	
