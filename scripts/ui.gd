extends Control


@onready var label_puntuacion = $Panel/LabelPuntuacion
@onready var progress_bar_vida = $Panel/ProgressBar

var puntuacion = 0
var vida = 100

# Actualizar la puntuación en la UI
func actualizar_puntuacion(nueva_puntuacion):
	puntuacion = nueva_puntuacion
	label_puntuacion.text = "Puntuación: %s" % puntuacion

# Actualizar la barra de vida en la UI
func actualizar_vida(nueva_vida):
	vida = nueva_vida
	progress_bar_vida.value = vida

# Función para manejar un botón presionado (conectado desde el editor)
func _on_BotonReiniciar_pressed():
	get_tree().reload_current_scene()
