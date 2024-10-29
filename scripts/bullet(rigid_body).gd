extends RigidBody2D
@onready var timer: Timer = $Timer

# Velocidad del proyectil
var speed = 300



func _ready() -> void:
	timer.start()


func _on_timer_timeout() -> void:
	queue_free() # Replace with function body.
