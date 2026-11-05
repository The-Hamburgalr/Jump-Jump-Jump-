extends Node
var hurt_dude_enemy: bool = false
var player_hurt_dude_enemy: bool = false
var hurt_animation: bool = false
var dude_enemy_x: float

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
