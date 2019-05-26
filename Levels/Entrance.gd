extends Node2D

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
#	$AnimationPlayer.play("game_begins")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_Exit_body_entered(body: PhysicsBody2D) -> void:
	print(body)
	if body.name == "TC":
		get_tree().change_scene("res://Levels/Level1.tscn")
