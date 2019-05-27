extends CanvasLayer


func _on_Button2_button_down() -> void:
	OS.window_fullscreen = !OS.window_fullscreen
