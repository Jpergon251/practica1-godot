extends Node2D

@onready var spawn_point: Node2D = $SpawnPoint

var player = preload("res://scenes/player.tscn")

func _ready() -> void:
	var player_node = player.instantiate()
	player_node.set_global_position(spawn_point.get_global_position())
	print("New player")
	print(player_node.get_global_position())
	get_tree().root.add_child(player_node)
