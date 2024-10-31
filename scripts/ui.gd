extends Control

@onready var coins_text: Label = $Panel/CoinsText
@onready var ammo_text: Label = $Panel/AmmoText


# Actualizar la puntuación en la UI
func actualizar_puntuacion(monedas_recogidas, monedas_totales):
	if coins_text != null:
		coins_text.text = "Monedicas: " + str(monedas_recogidas) 
func update_ammo(ammo_count):
	if ammo_text != null:
		ammo_text.text = "Munición: " + str(ammo_count)
