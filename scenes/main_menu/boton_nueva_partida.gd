extends Button

func _on_mouse_entered() -> void:
	modulate = Color(0.0, 1.0, 0.0, 1.0)


func _on_mouse_exited() -> void:
	modulate = Color(1.0,1.0,1.0,1.0)
