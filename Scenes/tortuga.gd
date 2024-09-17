extends Node2D

var speed = 0

func _physics_process(delta: float) -> void:
	change_speed()
	global_position.x += speed * delta 
	if global_position.x < -1000:
		queue_free()

func change_speed():
	speed =- randf_range(100, 600)
