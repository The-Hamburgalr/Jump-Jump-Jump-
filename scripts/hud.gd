extends Control
var Health = 100

func Health_calc(Health):
	Health = Health - 15

func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	Health_calc(Health)
