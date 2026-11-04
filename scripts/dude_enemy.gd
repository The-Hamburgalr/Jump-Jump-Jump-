extends Area2D
var damage = 15
const SPEED = 100
var direction = -1.0
@onready var dude_enemy: Area2D = $"."
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var timer: Timer = $Timer



func _ready() -> void:
	pass

func _process(delta: float) -> void:
	position.x += direction * SPEED * delta

func _on_timer_timeout() -> void:
	direction *= -1
	sprite_2d.flip_h = !sprite_2d.flip_h

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout

func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		Globals.hurt_dude_enemy = true
		await wait(3)
