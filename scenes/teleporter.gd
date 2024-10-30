extends Area2D
const PLAYER = preload("res://scenes/player.tscn")
@export var scene_name: String
@onready var portal_2: Area2D = $"."


func _on_body_entered(body: Node2D) -> void:
	
	if body.name == "Player":
		
		
		get_tree().change_scene_to_file("res://scenes/"+ scene_name+".tscn")
		
		var player_temp = PLAYER.instantiate()
		
		print(portal_2)
		
		print("Ha entrao")
