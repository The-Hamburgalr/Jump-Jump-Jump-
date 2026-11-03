extends Area2D
var damage = 15
var hurt: bool = false


func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	hurt = true
