extends Control
var Health = 100
@onready var health_bar: ProgressBar = $"Health bar"
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"




func _ready() -> void:
	health_bar.value = Health
	

func Health_calc(damage):
	Health -= damage
	if Health <= 0:
		get_tree().change_scene_to_file("res://Scense/death_menu.tscn")
	Globals.hurt_animation = true
	health_bar.value = Health

func _process(delta: float) -> void:
	if Globals.hurt_dude_enemy == true:
		Health_calc(15)
		Globals.hurt_dude_enemy = false
	
