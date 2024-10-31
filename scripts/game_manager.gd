extends Node  # Asegúrate de que tu GameManager herede de Node

@onready var ui: Control = $"../CanvasLayer/Ui"
@onready var canvas_layer: CanvasLayer = $"../CanvasLayer"

@onready var coins = $"../Coins"  # Ruta hacia el nodo Coins
const PLAYER = preload("res://scenes/player.tscn")

@onready var game_scene_1: Node2D = $".."
@onready var game_scene_2: Node2D = $".."


var total_coins 
var score = 0

var player_ammo = 5

func _ready():
	canvas_layer.visible = true
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
	ui.actualizar_puntuacion(score, total_coins)
	
func update_ammo_label():
	ui.update_ammo(player_ammo)

# Función para sumar un punto cuando se recoge una moneda
func add_point():
	score += 1  # Incrementar la puntuación
	update_score_label()  # Actualizar el label

# Método para cambiar de escena
func change_scene_teleport(scene_name: String):
	print("Cambiando escena a: " + scene_name)
	get_tree().change_scene_to_file("res://scenes/" + scene_name + ".tscn")
	var player = PLAYER.instantiate()
	game_scene_2.add_child(player)
