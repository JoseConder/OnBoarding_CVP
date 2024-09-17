extends CharacterBody2D

var speed = 300 
var movement_velocity = Vector2.ZERO 

func _process(delta: float) -> void:
	handle_input()

func handle_input() -> void:
	movement_velocity = Vector2.ZERO
	
	if Input.is_action_pressed("der"):
		movement_velocity.x += 1
	if Input.is_action_pressed("izq"):
		movement_velocity.x -= 1
	if Input.is_action_pressed("aba"):
		movement_velocity.y += 1
	if Input.is_action_pressed("arr"):
		movement_velocity.y -= 1
	
	if movement_velocity.length() > 0:
		velocity = movement_velocity.normalized() * speed
	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	print("Choque")
	var main = get_tree().root.get_node("Main")
	main.score -= 5
