extends Node2D

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_local_x(delta * 800 * -1)


func _on_Area2D_area_entered(area: Area2D) -> void:
	#If hits player
	if area.get_collision_layer_bit(11):
		area.get_parent().get_parent().get_parent().on_death()
	#When hits a wall
	if(area.get_collision_layer_bit(2)):
		queue_free()
