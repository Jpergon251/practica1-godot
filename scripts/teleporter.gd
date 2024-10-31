extends Area2D
const PLAYER = preload("res://scenes/player.tscn")
@export var scene_name: String
@onready var spawn_point: Node2D = $SpawnPoint


func _on_body_entered(body: Node2D) -> void:
	
	if body.name == "Player":
		print("Ha entrado el jugador")
		
		GameManager.change_scene_teleport(scene_name, spawn_point.position)
		print(get_tree())
		
