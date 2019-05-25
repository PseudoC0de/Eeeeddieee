extends Node2D

var games_list = load('res://globals.gd')
var g
var defeated_moon = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	g = games_list
	$AnimationPlayer.play("enter_moon")
#	var first_item = g.GAMES_LIST[randi() % g.GAMES_LIST.size()]
#	$HUD.get_child(0).get_child(0).text = first_item
#	g.GAMES_LIST.erase(first_item)
#	var second_item = g.GAMES_LIST[randi() % g.GAMES_LIST.size()]
#	$HUD.get_child(1).get_child(0).text = second_item
#	g.GAMES_LIST.erase(second_item)
#	var third_item = g.GAMES_LIST[randi() % g.GAMES_LIST.size()]
#	$HUD.get_child(2).get_child(0).text = third_item
#	g.GAMES_LIST.erase(third_item)
#	var fourth_item = g.GAMES_LIST[randi() % g.GAMES_LIST.size()]
#	$HUD.get_child(3).get_child(0).text = fourth_item
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_Exit_body_entered(body: PhysicsBody2D) -> void:
	if body.name == "TC" && defeated_moon:
		get_tree().change_scene("res://Levels/Entrance.tscn")


func _on_Moon_tree_exited() -> void:
	defeated_moon = true
