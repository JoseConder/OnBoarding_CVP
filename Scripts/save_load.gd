extends Node

const SAVE_FILE = "user://savefile.save"
var highest_record = 0

func _ready() -> void:
	load_score()

func save_score():
	var file = FileAccess.open(SAVE_FILE, FileAccess.WRITE_READ)
	file.store_32(highest_record)
	file.close()
	
func load_score():
	if FileAccess.file_exists(SAVE_FILE):
		var file = FileAccess.open(SAVE_FILE, FileAccess.READ)
		highest_record = file.get_32()
		file.close()
	else:
		print("Archivo de puntaje no encontrado, usando puntaje predeterminado.")
		
