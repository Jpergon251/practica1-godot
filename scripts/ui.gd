extends Control

@onready var coins_text: Label = $Panel/CoinsText
@onready var ammo_text: Label = $Panel/AmmoText

# Actualizar la puntuación en la UI
func actualizar_puntuacion(monedas_recogidas, monedas_totales):
	
	coins_text.text = "Monedicas: " + str(monedas_recogidas) + "/" + str(monedas_totales)
	print(coins_text.text)	
func update_ammo(ammo_count):
	
	ammo_text.text = "Munición: " + str(ammo_count)
