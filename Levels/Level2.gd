extends Node2D

var won = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Animations/drums.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Label.text = "Health: " + str(globals.bat1_health)


func _on_Exit_area_entered(area: Area2D) -> void:
	if won && area.get_parent().get_parent().name == 'TC':
		get_tree().change_scene("res://Levels/BossRoom.tscn")
		
func bat1_dead():
	$Animations/scraw.play(.8)
	$Animations/drums.stop()
	$Enemies/Moon.queue_free()
	globals.enemies_killed += 1
	globals.bat1_health = 15
	won = true

func on_death():
	$Animations/AnimationPlayer.play("death")
	globals.intro_finished = false
	globals.bat1_health = 15
	
func back_to_entrance():
	get_tree().change_scene("res://Levels/Entrance.tscn")
	
#func bat2_dead():
#	$Animations/scraw.play()
#	$Enemies/Moon.queue_free()
#	globals.enemies_killed += 1