extends Area2D
var damage = 15
var hurt: bool = false
const SPEED = 100
var direction = -1.0
@onready var area_2d: Area2D = $"."
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var timer: Timer = $Timer

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	position.x += direction * SPEED * delta

func _on_timer_timeout() -> void:
	direction *= -1
	sprite_2d.flip_h = !sprite_2d.flip_h

func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	hurt = true
	await get_tree().create_timer(1.5).timeout
	hurt = false
	
	
	
