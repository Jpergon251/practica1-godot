extends CharacterBody2D
@onready var shooting_point: Node2D = $ShootingPoint

@onready var shoot_cool_down: Timer = $ShootCoolDown
@onready var r_key_sprite: Sprite2D = $RKeySprite
@onready var ui: Control = $CanvasLayer/UI

@onready var animated_sprite_2d = $AnimatedSprite2D
const BULLET_RIGID_BODY_ = preload("res://scenes/bullet(RigidBody).tscn")
const BULLET_AREA_2D_ = preload("res://scenes/bullet(Area2D).tscn")

const SPEED = 130.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var can_shoot = true
func _ready() -> void:
	print(position)
	if GameManager:
		GameManager.ui = ui  # Pasa la referencia de la UI al GameManager

func _physics_process(delta):
		
	if GameManager.player_ammo == 0:		r_key_sprite.visible = true
	else:
		r_key_sprite.visible = false
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
		shoot_raycast()
	if Input.is_action_just_pressed("attack2"):
		shoot_impulse()

	if Input.is_action_just_pressed("reload"):
		reload()

	move_and_slide()
	
func shoot_impulse():
	if not can_shoot:
		print("CoolDown: %.2f" % shoot_cool_down.time_left)
	if GameManager.player_ammo == 0:
		print("No Ammo")
	
	
	if GameManager.player_ammo > 0 and can_shoot:
		# Instanciar el proyectil como un RigidBody2D
		var bullet = BULLET_RIGID_BODY_.instantiate()
		GameManager.player_ammo -= 1
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
		
		shoot_cool_down.start()
		can_shoot = false
		
func shoot_raycast():
	if not can_shoot:
		print("CoolDown: %.2f" % shoot_cool_down.time_left)
	if GameManager.player_ammo == 0:
		print("No Ammo")
	
	
	if GameManager.player_ammo > 0 and can_shoot:
		var bullet_temp = BULLET_AREA_2D_.instantiate()
		GameManager.player_ammo -= 1
		# Configurar la posición del proyectil en el punto de disparo
		bullet_temp.position = shooting_point.global_position
		
		# Configurar la dirección según la orientación del personaje
		var bullet_direction: Vector2
		if animated_sprite_2d.flip_h:
			bullet_direction = Vector2(-1, 0)  # Disparar hacia la izquierda
		else:
			bullet_direction = Vector2(1, 0)  # Disparar hacia la derecha
		
		# Asignar la dirección al proyectil (asumiendo que tiene un método para configurarlo)
		bullet_temp.set_direction(bullet_direction)
		
		# Añadir el proyectil a la escena
		get_parent().add_child(bullet_temp)
		shoot_cool_down.start()
		can_shoot = false
func reload():
	if GameManager.player_ammo == 0:
		print("Realoading")
		
		GameManager.player_ammo = 5
		


func _on_shoot_cool_down_timeout() -> void:
	can_shoot = true
