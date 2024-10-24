extends Node  # Asegúrate de que tu GameManager herede de Node

const UI_SCENE = preload("res://scenes/UI.tscn")  # Carga la escena de UI

@onready var coins = $"../Coins"  # Ruta hacia el nodo Coins
@onready var score_label = $ScoreLabel  # Ruta hacia el Label que muestra el puntaje

var total_coins 
var score = 0

func _ready():
	# Instanciar la escena de UI
	var ui = UI_SCENE.instantiate()  
	add_child(ui)  # Añadir la UI a la escena principal

	total_coins = coins.get_child_count()  # Contar las monedas al inicio
	update_score_label()  # Actualiza el label al inicio

# Función para actualizar el texto del puntaje en el label
func update_score_label():
	score_label.text = "You collected " + str(score) + " coins from " + str(total_coins)
	print(score_label.text)

# Función para sumar un punto cuando se recoge una moneda
func add_point():
	score += 1  # Incrementar la puntuación
	update_score_label()  # Actualizar el label
