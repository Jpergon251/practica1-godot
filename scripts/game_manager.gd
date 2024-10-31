extends Node  # Asegúrate de que tu GameManager herede de Node


@onready var coins = $"../Coins"  # Ruta hacia el nodo Coins
const PLAYER = preload("res://scenes/player.tscn")


var player = null  # Variable para almacenar la referencia del jugador

var ui = null  # Referencia de la UI

var total_coins 
var score = 0

var player_ammo = 5

func _ready():
	
	if coins == null:
		total_coins = 0
	else:
		total_coins = coins.get_child_count()  # Contar las monedas al inicio
	update_score_label()  # Actualiza el label al inicio
	update_ammo_label()
	

func _physics_process(delta: float) -> void:
	update_score_label()
	update_ammo_label()

# Función para actualizar el texto del puntaje en el label
func update_score_label():
	if ui != null:
		ui.actualizar_puntuacion(score, total_coins)
	
func update_ammo_label():
	if ui != null:
		ui.update_ammo(player_ammo)

# Función para sumar un punto cuando se recoge una moneda
func add_point():
	score += 1  # Incrementar la puntuación
	update_score_label()  # Actualizar el label

# Método para cambiar de escena
#func change_scene_teleport(scene_name: String, spawn_point):
	#print("Cambiando escena a: " + scene_name)
	#get_tree().change_scene_to_file.bind("res://scenes/" + scene_name + ".tscn").call_deferred()
	#
	#if player == null:
		#player = PLAYER.instantiate()
		#player.position = spawn_point
		#get_tree().root.add_child(player)
		#
		  ## Agregar el jugador a la escena actual
	#else:
		#print("El jugador ya está instanciado en la escena.")
	

	
func reload_scene():
	get_tree().reload_current_scene()
