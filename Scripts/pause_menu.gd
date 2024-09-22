extends MarginContainer

func _ready() -> void:
	$AnimationPlayer.play("RESET")
	
func pause():
	get_tree().paused = true
	$AnimationPlayer.play("loop")
	
func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("loop")
	hide()
	


func _on_reanudar_pressed() -> void:
	resume()


func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")


func _on_salir_pressed() -> void:
	get_tree().quit()
