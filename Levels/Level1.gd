extends Node2D


var defeated_moon = false
#var death_sounds

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("enter_moon")
#	death_sounds = ["death", "death2"]
	pass


func _on_Exit_body_entered(body: PhysicsBody2D) -> void:
	if body.name == "TC" && defeated_moon:
		on_win()


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

func on_death():
	randomize()
#	var x = str(death_sounds[randi() % death_sounds.size()])
#	print(x)
	$AnimationPlayer.play("death")
	globals.intro_finished = false
	
func back_to_entrance():
	get_tree().change_scene("res://Levels/Entrance.tscn")
	
func on_win():
	get_tree().change_scene("res://Levels/BossRoom.tscn")