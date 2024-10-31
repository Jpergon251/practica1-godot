extends Node2D

@onready var game_manager: Node = %GameManager
@onready var spawn_point_2: Node2D = $Portal2/SpawnPoint2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(game_manager.player_ammo)
	
