extends Path2D

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if globals.intro_finished:
		var tween = Tween.new()
		var follow = $PathFollow2D
		tween.interpolate_property(follow, "unit_offset", 0, 1, 6, tween.TRANS_LINEAR, tween.EASE_IN_OUT)
		tween.set_repeat(true)
		add_child(tween)
		tween.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
