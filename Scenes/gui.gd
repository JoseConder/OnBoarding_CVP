extends Control

@onready var score_label = $HBoxContainer/VBoxContainer/Score
@onready var highscore_label = $HBoxContainer/VBoxContainer2/Highscore
@onready var health_label = $HBoxContainer/VBoxContainer3/health

func _ready() -> void:
	update_labels()

func _process(delta: float) -> void:
	update_labels()

func update_labels() -> void:
	var global = get_node("/root/SaveLoad") 
	score_label.text = "Score: " + str(get_node("/root/Main").score)
	highscore_label.text = "Highscore: " + str(global.highest_record)
	health_label.text = "Vida:" + str(get_node("/root/Main").health)
	
