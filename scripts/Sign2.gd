extends Area2D

@onready var enemy_sign_text = $"../WorldLabels/EnemySignText"


func _on_body_entered(body: Node2D) -> void:
	print("Entro en el cartel")
	enemy_sign_text.visible = true


func _on_body_exited(body):
	enemy_sign_text.visible = false
