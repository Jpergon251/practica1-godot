extends Node  # Asegúrate de que tu GameManager herede de Node

@onready var ui: Control = $"../CanvasLayer/Ui"
@onready var canvas_layer: CanvasLayer = $"../CanvasLayer"

@onready var coins = $"../Coins"  # Ruta hacia el nodo Coins
@onready var score_label = $ScoreLabel  # Ruta hacia el Label que muestra el puntaje

var total_coins 
var score = 0

var player_ammo = 5

func _ready():
	canvas_layer.visible = true
	
	total_coins = coins.get_child_count()  # Contar las monedas al inicio
	update_score_label()  # Actualiza el label al inicio
	update_ammo_label()
	

func _physics_process(delta: float) -> void:
	update_ammo_label()

# Función para actualizar el texto del puntaje en el label
func update_score_label():
	score_label.text = "You collected " + str(score) + " coins from " + str(total_coins)
	ui.actualizar_puntuacion(score, total_coins)
	
func update_ammo_label():
	ui.update_ammo(player_ammo)

# Función para sumar un punto cuando se recoge una moneda
func add_point():
	score += 1  # Incrementar la puntuación
	update_score_label()  # Actualizar el label
