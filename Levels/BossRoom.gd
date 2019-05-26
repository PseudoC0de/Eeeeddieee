extends Node2D

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

func on_death():
	$Animations/AnimationPlayer.play("boss_room_death")
	
func back_to_entrance():
	get_tree().change_scene("res://Levels/Entrance.tscn")
	
func won():
	$Animations/AnimationPlayer.play("won")
	