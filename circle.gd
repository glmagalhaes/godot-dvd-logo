extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _draw() -> void:
	if Global.selected != null:
		draw_circle(Global.selected.position, 100, Color.WHITE, false, 3, true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	queue_redraw()
