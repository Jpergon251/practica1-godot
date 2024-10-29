extends Control

@onready var coins_text: Label = $Panel/CoinsText

# Actualizar la puntuación en la UI
func actualizar_puntuacion(monedas_recogidas, monedas_totales):
	
	coins_text.text = "Monedicas: " + str(monedas_recogidas) + "/" + str(monedas_totales)
	print(coins_text.text)	
