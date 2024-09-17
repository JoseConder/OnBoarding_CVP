extends Node2D

var TurtleScene = preload("res://Scenes/escuero.tscn")
var turtle_size = 100 
var screen_size = get_viewport_rect().size
var timer: Timer
@export var score = 0

func _ready() -> void:
	$straw.position.x = 0
	$straw.position.y = 320
	%Camera2D.position.x = 0 + (960/2)
	spawn_turtles(3)
	
	timer = Timer.new()
	timer.wait_time = 5  
	timer.one_shot = false
	timer.autostart = true
	timer.connect("timeout", Callable(self, "_on_timer_timeout"))
	add_child(timer)


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("esc"):
		get_tree().quit()
	elif Input.is_action_just_pressed("recarga"):
		get_tree().reload_current_scene()
	%Camera2D.position.x += 150 * delta
	if score < 0:
		score = 0 
	print(score)

func spawn_turtles(amount: int) -> void:
	var positions = [] # Lista para almacenar las posiciones usadas
	var spawn_x = %Camera2D.position.x + screen_size.x + 1000.0
	
	for i in range(amount):
		var valid_position = false
		var spawn_y = 0.0
		var attempts = 0 # Contador de intentos para evitar ciclos infinitos

		while not valid_position and attempts < 100: # Limitar a 100 intentos para evitar crasheos
			spawn_y = randf_range(-400, 400)
			
			valid_position = true
			for position in positions:
				if abs(spawn_y - position) < turtle_size: # Comparar directamente con valores de 'y'
					valid_position = false
					break
			
			attempts += 1 # Incrementa los intentos
		
		# Si se encuentra una posición válida
		if valid_position:
			var turtle_instance = TurtleScene.instantiate()
			add_child(turtle_instance)
			turtle_instance.global_position = Vector2(spawn_x, spawn_y)
			turtle_instance.connect("enemy_out_of_screen", Callable(self, "_on_enemy_out_of_screen"))
			positions.append(spawn_y) # Guardar solo el valor de 'y'
		else:
			print("No se pudo encontrar una posición válida para la tortuga ", i)

func _on_enemy_out_of_screen() -> void:
	print("Tortuga extra")
	spawn_turtles(1)
	
func _on_timer_timeout() -> void:
	spawn_turtles(1)
	score += 5
	
	
