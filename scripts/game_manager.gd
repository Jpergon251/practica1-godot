extends Node

@onready var coins = $"../Coins"  # Ruta hacia el nodo Coins
@onready var score_label = $ScoreLabel  # Ruta hacia el Label que muestra el puntaje

var total_coins 
var score = 0

func _ready():
	total_coins = coins.get_child_count()  # Llamamos a la función que cuenta cuántas monedas hay al inicio



# Función para sumar un punto cuando se recoge una moneda
func add_point():
	score += 1
	score_label.text = "You collected " + str(score) + " coins from " + str(total_coins)
	print(score_label.text)
	
