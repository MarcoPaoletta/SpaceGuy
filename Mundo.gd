extends Node
# ELEMENTOS
export (PackedScene) var Roca
var Score
# LISTO
func _ready():
	randomize()
# NUEVO JUEGO	
func nuevo_juego():
	$Interfaz/ScoreLabel.show()
	Score = 0
	$Player.inicio($PosicionDeInicio.position)
	$InicioTimer.start()
	$Interfaz.mostrar_mensaje("¡Listo!")
	$Interfaz.update_score(Score)
	$Musica.play()
# GAME OVER
func game_over():
	$ScoreTimer.stop()
	$RocaTimer.stop()
	$Interfaz/ScoreLabel.hide()
	$Interfaz.game_over()
	$AudioMuerte.play()
	$Musica.stop()
# TIMER INICIO
func _on_InicioTimer_timeout():
	$RocaTimer.start()
	$ScoreTimer.start()
# TIMER PUNTOS
func _on_ScoreTimer_timeout():
	Score += 1
	$Interfaz.update_score(Score)
# TIMER ROCA
func _on_RocaTimer_timeout():
	$camino/RocaPosicion.set_offset(randi())
	
	var R = Roca.instance()
	add_child(R)
	
	var d = $camino/RocaPosicion.rotation + PI /2
	
	R.position = $camino/RocaPosicion.position
	
	d += rand_range(-PI /4, PI /4)
	R.rotation = d 
	R.set_linear_velocity(Vector2(rand_range(R.velocidad_min, R.velocidad_max), 0).rotated(d))
	
	
	
	
	
	
	
	
	 
	
	
	
