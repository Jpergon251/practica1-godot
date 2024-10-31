extends Area2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

@export var scene_name: String

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		print("Ha entrado el jugador")
		body.queue_free()
		get_tree().change_scene_to_file("res://scenes/"+scene_name+".tscn")
		#collision_shape_2d.disabled
		#GameManager.change_scene_teleport(scene_name, spawn_point.global_position)
		


#func _on_body_exited(body: Node2D) -> void:
	#collision_shape_2d.disabled
