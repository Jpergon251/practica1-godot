extends Area2D
const PLAYER = preload("res://scenes/player.tscn")
@export var scene_name: String
@onready var game_manager: Node = %GameManager


func _on_body_entered(body: Node2D) -> void:
	
	if body.name == "Player":
		print("Ha entrado el jugador")
		
		game_manager.change_scene_teleport(scene_name)
		
