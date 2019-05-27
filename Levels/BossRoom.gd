extends Node2D

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Animations/AnimationPlayer.play("enter_boss")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if globals.phase == 1:
		if globals.boss_head_health >= 0:
			$Label.text = "Moon2BRAIN: " + str(globals.boss_head_health)
	elif globals.phase == 2:
		if globals.boss_middle_health >= 0:
			$Label.text = "Moon2Y: " + str(globals.boss_middle_health)

func on_death():
	globals.boss_head_health = globals.BOSS_HEAD_HEALTH
	globals.boss_middle_health = globals.BOSS_MIDDLE_HEALTH
	$Boss.close_hitboxes()
	$Animations/AnimationPlayer.play("boss_room_death")
	globals.intro_finished = false

	
func back_to_entrance():
	get_tree().change_scene("res://Levels/Entrance.tscn")
	
func won():
	$Animations/AnimationPlayer.play("won")
	
func phase2():
	$Animations/AnimationPlayer.play("phase_2")

func _on_Exit_area_entered(area: Area2D) -> void:
	if globals.won && area.get_parent().get_parent().name == 'TC':
		get_tree().change_scene("res://Levels/Credits.tscn")
