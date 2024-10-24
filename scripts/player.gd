extends CharacterBody2D
@onready var shooting_point: Node2D = $ShootingPoint

@onready var animated_sprite_2d = $AnimatedSprite2D
const BULLET = preload("res://scenes/bullet.tscn")

const SPEED = 130.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get input direction: -1, 0, 1
	var direction = Input.get_axis("move_left", "move_right")
	
	#Flip the Sprite
	if direction > 0:
		animated_sprite_2d.flip_h = false
	if direction < 0:
		animated_sprite_2d.flip_h = true
		
	#Pay animation
	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("idle")
		else:
			animated_sprite_2d.play("run")
			
	else:
		animated_sprite_2d.play("jump")
		
	# Apply movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	
	
	if Input.is_action_just_pressed("attack"):
		shoot()

	move_and_slide()
	
func shoot():
	# Instanciar el proyectil como un RigidBody2D
	var bullet = BULLET.instantiate() as RigidBody2D

	# Configurar la posición inicial del proyectil en el punto de disparo
	bullet.position = shooting_point.global_position

	# Determinar la dirección del impulso basado en la orientación del personaje
	var impulse_direction = Vector2()  # Inicializar el vector de dirección de impulso

	# Si el personaje está mirando a la izquierda (flip_h = true), la dirección horizontal será hacia la izquierda
	if animated_sprite_2d.flip_h:
		impulse_direction = Vector2(-150, -400)  # Hacia arriba y hacia la izquierda
	else:
		impulse_direction = Vector2(150, -400)  # Hacia arriba y hacia la derecha

	# Aplicar el impulso al proyectil
	bullet.apply_impulse(impulse_direction, shooting_point.global_position)

	# Añadir el proyectil a la escena
	get_tree().root.add_child(bullet)
