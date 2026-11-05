extends Area2D
var damage = 15
const SPEED = 100
var direction = -1.0
@export var health: float = 45.0
@onready var dude_enemy: Area2D = $"."
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var timer: Timer = $Timer



func _ready() -> void:
	dude_enemy.show()

func _process(delta: float) -> void:
	if Globals.player_hurt_dude_enemy == true:
		health_calc()
			
	position.x += direction * SPEED * delta
	Globals.dude_enemy_x = position.x

func health_calc():
	health -= 15
	if health <= 0.0:
		print('dead')
		dude_enemy.hide()
		dude_enemy.monitoring = false
	else:
		Globals.player_hurt_dude_enemy = false
	

func _on_timer_timeout() -> void:
	direction *= -1
	sprite_2d.flip_h = !sprite_2d.flip_h


func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		Globals.hurt_dude_enemy = true
		await Globals.wait(3)
