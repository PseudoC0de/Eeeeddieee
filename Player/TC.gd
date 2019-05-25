extends KinematicBody2D

#var motion = Vector2()
#const UP = Vector2(0,-1)
var speed = 500

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_right"):
		move_local_x(speed * delta, true)
		$Sprite.flip_h = true
		$Sprite.play("walking")
	elif Input.is_action_pressed("ui_left"):
		move_local_x(-speed * delta)
		$Sprite.flip_h = false
		$Sprite.play("walking")
	else:
		$Sprite.play("idle")