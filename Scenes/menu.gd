extends Control

var bubble = preload("res://Scenes/bubble.tscn")
var turtle = preload("res://Scenes/escuero.tscn")
var highscore = SaveLoad.highest_record

func _ready() -> void:
	var menubutton = $MarginContainer/HBoxContainer/VBoxContainer2/Scores/scores_button
	var popup = menubutton.get_popup() 
	popup.clear()
	var highscore = SaveLoad.highest_record 
	popup.add_item("Highscore: %d" % highscore)
	spawn(10, bubble)
	spawn(5, turtle)

func spawn(amount: int, scene: PackedScene) -> void:
	for i in range(amount):
		var instance = scene.instantiate()
		# Asumimos que las burbujas están en 2D, por lo que posicionamos aleatoriamente dentro del tamaño del menú
		var random_position = Vector2(
			randf() * size.x  + 200,  # Posición x aleatoria dentro del ancho del Control
			randf() * size.y   # Posición y aleatoria dentro del alto del Control
		)

		instance.position = random_position  # Posicionamos la burbuja en el menú
		add_child(instance)  # Añadimos la burbuja al nodo de menú
		


func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_close_button_pressed() -> void:
	get_tree().quit()
