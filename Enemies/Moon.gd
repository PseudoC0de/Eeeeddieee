extends Path2D

var tween

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if globals.intro_finished:
		tween = Tween.new()
		var follow = $PathFollow2D
		tween.interpolate_property(follow, "unit_offset", 0, 1, 6, tween.TRANS_LINEAR, tween.EASE_IN_OUT)
		tween.set_repeat(true)
		add_child(tween)
		tween.start()
		start_timer()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

func stop():
	if tween != null:
		tween.stop_all()


func _on_Timer_timeout() -> void:
	var bullet = load('res://Enemies/EnemyBullet.tscn')
	var b = bullet.instance()
	b.position = $PathFollow2D.position
	add_child(b)
	start_timer()
	
func start_timer():
	$PathFollow2D/Sprite/Timer.start()
	
func stop_timer():
	$PathFollow2D/Sprite/Timer.stop()
