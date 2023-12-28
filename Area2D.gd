extends Area2D

func _on_area_exited(area: Area2D) -> void:
	if area.name == "Ball":
	#oops, ball went out of game place, reset
		area.reset()
