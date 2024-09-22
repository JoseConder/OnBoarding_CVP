extends Node2D

var speed = -150.0

func _physics_process(delta: float) -> void:
	global_position.y += speed * delta 
	if global_position.y < -1000:
		queue_free()
