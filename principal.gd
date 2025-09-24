extends Node2D

@export var logo_dvd: PackedScene  = preload("res://LogoDVD.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		match event.button_index:
			MOUSE_BUTTON_LEFT:
				# criar colision shape2d
				var query = PhysicsPointQueryParameters2D.new()
				query.position = event.position
				query.collide_with_areas = true
				query.collide_with_bodies = true
				
				var result = get_world_2d().direct_space_state.intersect_point(query)
				# verificar se houve colisão
				if result.is_empty():
					var new_logo:Node2D = logo_dvd.instantiate()
					new_logo.position = event.position;
					add_child(new_logo)
					get_viewport().set_input_as_handled()
			MOUSE_BUTTON_WHEEL_UP:
				print("Scroll wheel up")
			MOUSE_BUTTON_WHEEL_DOWN:
				print("Scroll wheel down")
