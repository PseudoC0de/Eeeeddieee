extends Path2D

var tween
var stage = 1
var started = false
var dead = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var middle = $PathFollow2D/Sprite2/Middle
	middle.set_collision_layer_bit(19, false)

func start():
	tween = Tween.new()
	var follow = $PathFollow2D
	tween.interpolate_property(follow, "unit_offset", 0, 1, 11, tween.TRANS_SINE, tween.EASE_IN_OUT)
	tween.set_repeat(true)
	add_child(tween)
	tween.start()
	started = true
	globals.phase = stage

func _process(delta: float) -> void:
	##only applies to first stage
	if started && !dead:
		if stage == 1:
			var frame = $PathFollow2D/Sprite.frame
			var middle = $PathFollow2D/Sprite2/Middle
			var head1 = $PathFollow2D/Sprite/Head1
			var head2 = $PathFollow2D/Sprite/Head2
			
			var head_health = globals.boss_head_health
			var middle_health = globals.boss_middle_health
			
	#		print("head: " + str(head_health))
	#		print("middle: " + str(middle_health))
			
			if frame == 0:
				head1.set_collision_layer_bit(18, true)
				head2.set_collision_layer_bit(18, false)
		#		TL1.get_child(0).set_one_way_collision(false)
		##		print(str(TL1.get_child(0).is_one_way_collision_enabled()))
			elif frame == 1:
				head1.set_collision_layer_bit(18, false)
				head2.set_collision_layer_bit(18, true)
		#		TL1.get_child(0).set_one_way_collision(false)
		##		print(str(TL1.get_child(0).is_one_way_collision_enabled()))
			if head_health <= 0: #phase 2 start
				head1.set_collision_layer_bit(18, false)
				head2.set_collision_layer_bit(18, false)
				$PathFollow2D/Sprite.stop()
				$PathFollow2D/Sprite.visible = false
				$PathFollow2D/Sprite2.play("boss_battle")
				$PathFollow2D/Sprite2.visible = true
				middle.set_collision_layer_bit(19, true)
				stage += 1
				globals.phase = 2
				get_parent().phase2()
				
		#Only applies to second stage
		if stage == 2:
			var frame = $PathFollow2D/Sprite2.frame
			var middle_health = globals.boss_middle_health
			var head_health = globals.boss_head_health
			var middle = $PathFollow2D/Sprite2/Middle
			
	#		print("head: " + str(head_health))
	#		print("middle: " + str(middle_health))
			
			if middle_health <= 0 && !globals.won:
				globals.won = true
				$PathFollow2D/Sprite2.stop()
				$PathFollow2D/Sprite2.play("dead")
				middle.set_collision_layer_bit(19, false)
				get_parent().won()
			
			if frame == 2 || frame == 3:
				print("on")
				middle.set_collision_layer_bit(19, true)
				
			else:
				print("off")
				middle.set_collision_layer_bit(19, false)


func _on_Timer_timeout() -> void:
	if started:
		var frame = $PathFollow2D/Sprite.frame
		var bullet = load('res://Enemies/EnemyBullet.tscn')
		var b = bullet.instance()
		b.position = $PathFollow2D.position
		if stage == 1:
			add_child(b)
		elif stage == 2:
			add_child(b)
		start_timer_1()

func start_timer_1():
	$PathFollow2D/Sprite/Timer1.start()
	
func stop_timer_1():
	$PathFollow2D/Sprite/Timer1.stop()
	
func start_timer_2():
	$PathFollow2D/Sprite2/Timer2.start()
	
func stop_timer_2():
	$PathFollow2D/Sprite2/Timer2.stop()
	
	

func _on_Timer2_timeout() -> void:
	var bullet = load('res://Enemies/EnemyBullet.tscn')
	var b = bullet.instance()
	b.position = $PathFollow2D.position
	$PathFollow2D/Sprite2/Middle.add_child(b)
	start_timer_2()

func stop():
	if tween != null:
		tween.stop_all()
		
func close_hitboxes():
	var middle = $PathFollow2D/Sprite2/Middle
	var head1 = $PathFollow2D/Sprite/Head1
	var head2 = $PathFollow2D/Sprite/Head2
	middle.set_collision_layer_bit(19, false)
	head1.set_collision_layer_bit(18, false)
	head2.set_collision_layer_bit(18, false)
	dead = true