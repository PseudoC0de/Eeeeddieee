extends KinematicBody2D

var motion = Vector2()
const FLOOR = Vector2(0,-1)
const speed = 500
const gravity = 25
const jump = -900
const MAX_GRAVITY = 50
var jump_count = 0
var fell = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
#	print(str(motion.x) + ", " + str(motion.y))
	if motion.y < 50:
		motion.y += gravity
	
	if Input.is_action_pressed("ui_right"):
		motion.x = speed
		$Sprite.flip_h = true
		$Sprite.play("walking")
	elif Input.is_action_pressed("ui_left"):
		motion.x = -speed
		$Sprite.flip_h = false
		$Sprite.play("walking")
	else:
		motion.x = 0
		$Sprite.play("idle")
	
	if jump_count < 2:
		if Input.is_action_just_pressed("ui_up"):
			motion.y = jump
			jump_count += 1
		
	if is_on_floor():
		jump_count = 0
		if Input.is_action_just_pressed("ui_up"):
			motion.y = jump
			jump_count += 1
	
	motion.y += gravity
	motion = move_and_slide(motion, FLOOR)
	
	#If falls out of map
	if position.y > 1300 && !fell:
		fell = true
		get_parent().on_death()
#			get_tree().change_scene("res://Levels/Entrance.tscn")
#			globals.intro_finished = false

func _input(event):
	if event.is_action_pressed("ui_accept"):
		var bullet = load('res://Player/Bullet.tscn')
		var b = bullet.instance()
		b.position = self.get_position()
		get_parent().add_child(b)

func _on_Area2D_area_entered(area: Area2D) -> void:
	#when hitting moon
	if(area.get_collision_layer_bit(1)):
		get_parent().on_death()
#		get_tree().change_scene("res://Levels/Entrance.tscn")
#		globals.intro_finished = false
