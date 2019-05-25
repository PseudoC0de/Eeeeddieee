extends Node2D

var player
var direction

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = $'../TC'
	
	if player.get_child(0).flip_h == true:
		direction = 1
	else:
		direction = -1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		move_local_x(delta * 600 * direction)
		

#free fire when hits wall
func _on_Area2D_area_entered(area: Area2D) -> void:
	if(area.get_collision_layer_bit(2)):
		queue_free()
	if(area.get_collision_layer_bit(1)):
		area.get_parent().queue_free()