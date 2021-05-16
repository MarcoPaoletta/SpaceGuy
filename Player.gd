# EXTENDS
extends Area2D

# ELEMENTOS
export (int) var Velocidad 
var Movimiento = Vector2()
var limite
signal golpe 


# OBTENER LIMITES DE LA PANTALLA
func _ready():
	hide()
	limite = get_viewport_rect().size	

	
# MOVIMIENTO
func _process(delta):
	Movimiento = Vector2()
	if Input.is_action_pressed("ui_right"):
		Movimiento.x += 1
	if Input.is_action_pressed("ui_left"):
		Movimiento.x -= 1	
	if Input.is_action_pressed("ui_down"):
		Movimiento.y += 1
	if Input.is_action_pressed("ui_up"):
		Movimiento.y -= 1
	
	if Movimiento.length() > 0:
		Movimiento = Movimiento.normalized() * Velocidad 
		
	position += Movimiento * delta
	
# LIMITES
	position.x = clamp(position.x,0,limite.x)
	position.y = clamp(position.y,0,limite.y)
	
# ANIMACIONES
	if Movimiento.x != 0:
		$Sprite_player.animation = "derecha"
		$Sprite_player.flip_h = Movimiento.x < 0 
		$Sprite_player.flip_v = false
	elif Movimiento.y != 0:
		$Sprite_player.animation = "espalda"
		$Sprite_player.flip_v = Movimiento.y > 0 
	else:
		$Sprite_player.animation = "frente"
		$Sprite_player.flip_v = false
		
  


# warning-ignore:unused_argument
func _on_Player_body_entered(body):
	hide()
	emit_signal("golpe")
	$CollisionShape2D.disabled = true
	
func inicio(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
	
 
