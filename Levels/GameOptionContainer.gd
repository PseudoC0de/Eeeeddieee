extends Node2D

var games_list
var g
var correct_game
var option_nodes

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	option_nodes = [$Node2D/Sprite/Label, $Node2D2/Sprite/Label,
					$Node2D3/Sprite/Label, $Node2D4/Sprite/Label]
	g = globals.GAMES_LIST.duplicate(true)
	
	var first_label = option_nodes[randi() % option_nodes.size()]
	correct_game = g[randi() % g.size()]
	first_label.text = correct_game
	option_nodes.erase(first_label);
	g.erase(correct_game)
	
	var second_label = option_nodes[randi() % option_nodes.size()]
	var second_game = g[randi() % g.size()]
	second_label.text = second_game
	option_nodes.erase(second_label);
	g.erase(second_game)
	
	var third_label = option_nodes[randi() % option_nodes.size()]
	var third_game = g[randi() % g.size()]
	third_label.text = third_game
	option_nodes.erase(third_label);
	g.erase(third_game)
	
	var fourth_label = option_nodes[randi() % option_nodes.size()]
	var fourth_game = g[randi() % g.size()]
	fourth_label.text = fourth_game
	option_nodes.erase(fourth_label);
	g.erase(fourth_game)
	
	globals.correct_game = correct_game
	print(correct_game)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


#func _on_Node2D_area_entered(area: Area2D) -> void:
#	#If a bullet hits it
#	print(str(area.))
#	if(area.get_collision_layer_bit(4)):
#		print($'./Sprite/Label'.get_text())