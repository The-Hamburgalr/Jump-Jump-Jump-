extends Control
var Health = 100
@onready var health_bar: ProgressBar = $"Health bar"

func _ready() -> void:
	health_bar.value = Health

func Health_calc(Health, damage):
	Health = Health - damage
	health_bar.value = Health

func _process(delta: float) -> void:
	if DudeEnemy.hurt == true:
		Health_calc(Health, 15)
		DudeEnemy.damage = false
	
