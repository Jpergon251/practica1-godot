extends Area2D
@onready var timer: Timer = $Timer

# Velocidad del proyectil
var speed = 300

var direction = Vector2(1, 0)

func _ready() -> void:
	timer.start()

# Función para inicializar la dirección del proyectil
func set_direction(new_direction: Vector2) -> void:
	direction = new_direction.normalized()

# Lógica de movimiento en cada frame
func _process(delta: float) -> void:
	position += direction * speed * delta

func _on_timer_timeout() -> void:
	queue_free() # Replace with function body.
