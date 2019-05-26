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
		move_local_x(delta * 800 * direction)
		


func _on_Area2D_area_entered(area: Area2D) -> void:
	#free fire when hits wall
	if(area.get_collision_layer_bit(2)):
		queue_free()
	#when hitting moon
	if(area.get_collision_layer_bit(1)):
#		area.get_parent().get_parent().get_parent().queue_free() #frees moon
		queue_free()
	#When hitting an option
	if(area.get_collision_layer_bit(15)):
		var game = area.get_child(0).get_child(0).get_text()
		var correct_game = globals.correct_game
		if area.get_parent().get_parent().get_node('Moon') != null:
			if game == correct_game:
				area.get_parent().get_parent().get_node('Moon').queue_free()
				area.get_parent().queue_free()
			else:
				get_parent().on_death()