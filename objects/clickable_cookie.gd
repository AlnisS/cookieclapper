extends RigidBody

signal cookie_clicked

func _input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		emit_signal("cookie_clicked")
		apply_impulse(position, normal * 2)
		$AnimationPlayer.play("clap")
