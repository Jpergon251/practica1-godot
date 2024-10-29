extends Area2D

@onready var bride_sign_text = $"../WorldLabels/BrideSignText"

func _on_body_entered(body: Node2D) -> void:
	print("Entro en el cartel")
	bride_sign_text.visible = true


func _on_body_exited(body):
	bride_sign_text.visible = false
