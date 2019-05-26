extends Node2D


var defeated_moon = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("enter_moon")
	pass


func _on_Exit_body_entered(body: PhysicsBody2D) -> void:
	if body.name == "TC" && defeated_moon:
		get_tree().change_scene("res://Levels/Entrance.tscn")
		globals.intro_finished = false


func _on_Moon_tree_exited() -> void:
	defeated_moon = true #TODO defete only on correct answer fired


func intro_finished():
	globals.intro_finished = true
	
	
func play_correct_game_audio():
	var c = globals.correct_game
	
	if globals.intro_finished:
		if c == "I Wanna Be The Boshy":
			$Boshy.play()
		elif c == "Getting Over It":
			$GettingOverIt.play()
		elif c == "Overwatch":
			$Overwatch.play()
		elif c == "Mario Maker":
			$MarioMaker.play()
		elif c == "Baldi's Basics in Education and Learning":
			$Baldi.play()
