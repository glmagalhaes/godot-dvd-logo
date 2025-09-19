extends Button

@export var logo_dvd: PackedScene  = preload("res://LogoDVD.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(_button_pressed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _button_pressed():
	var new_logo = logo_dvd.instantiate()
	add_child(new_logo)
