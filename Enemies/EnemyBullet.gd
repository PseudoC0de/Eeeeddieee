extends KinematicBody2D

var target = Vector2()
var velocity = Vector2()
var x
var y


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	target = globals.TC_position
	print(str(target))
	print("bullet position: " + str(position))
#	x = target
#	y = target
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	velocity = (target - get_parent().position).normalized() * 800
	rotation = velocity.angle()
	move_and_slide(velocity)


func _on_Area2D_area_entered(area: Area2D) -> void:
	#If hits player
	if area.get_collision_layer_bit(11):
		area.get_parent().get_parent().get_parent().on_death()
	#When hits a wall
	if(area.get_collision_layer_bit(2) && !area.get_collision_layer_bit(13)):
		queue_free()
	#When hitting an option
	if(area.get_collision_layer_bit(15) || area.get_collision_layer_bit(11)):
		queue_free()
