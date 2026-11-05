extends CharacterBody2D


const SPEED = 300
const JUMP_VELOCITY = -600.0
var distance_from_dude_enemey: float
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var jumpsound: AudioStreamPlayer2D = $Jumpsound


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("attack"):
		attack()
		await Globals.wait(2.5)
		
	if Globals.hurt_animation == true:
		animated_sprite_2d.animation = "hurt"
		
		print('hurt')
		Globals.hurt_animation = false

func attack():
	animated_sprite_2d.animation = "attack"
	distance_from_dude_enemey = position.x - Globals.dude_enemy_x
	if distance_from_dude_enemey <= 4.0:
		Globals.player_hurt_dude_enemy = true
		await Globals.wait(2.5)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if velocity.x > 0 or velocity.x <0:
		animated_sprite_2d.animation = "Walking"
	elif Input.is_action_just_pressed("jump"):
		animated_sprite_2d.animation = "Jump"
		jumpsound.play()
	elif not is_on_floor():
		animated_sprite_2d.animation = "standing"
	elif velocity.x == 0:
		animated_sprite_2d.animation = "Idle"
	# Handle jump.
	if Input.is_action_just_pressed('jump') and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if direction == 1.0:
		animated_sprite_2d.flip_h = true
	elif direction == -1.0:
		animated_sprite_2d.flip_h = false
		
	

	move_and_slide()


func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	pass # Replace with function body.
