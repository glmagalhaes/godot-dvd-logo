extends CharacterBody2D


const SPEED = 400.0
const WALLS = ["Top", "Bottom", "Left",  "Right"]


func _ready() -> void:
	var rng = RandomNumberGenerator.new()

	var vector = rng.randf_range(0.0, 360.0)
	var direction = Vector2(cos(deg_to_rad(vector)), sin(deg_to_rad(vector)))
	velocity = direction * SPEED

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision && collision.get_collider().name in WALLS:
		velocity = velocity.bounce(collision.get_normal())

func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		Global.selected = self;
