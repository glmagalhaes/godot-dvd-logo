extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const WALLS = ["Top", "Bottom", "Left",  "Right"]
var vector

func _ready() -> void:
	var rng = RandomNumberGenerator.new()
	vector = rng.randf_range(0.0, 360.0)


func _physics_process(delta: float) -> void:
	# Calcula o vetor de direção a partir do ângulo
	var direction = Vector2(cos(deg_to_rad(vector)), sin(deg_to_rad(vector)))
	velocity = direction * SPEED
	var collision = move_and_collide(velocity * delta)

	if collision && collision.get_collider().name in WALLS:
		print("Collided with:", collision.get_collider())
		vector = vector + 90.0
		print("Vector: ", vector)
		if vector > 360:
			vector = vector - 360
	# Aplica a velocidade na direção desejada

func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		print("ME CLICOU!", event)
