extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -400.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if velocity.x > 0 or velocity.x <0:
		animated_sprite_2d.animation = "Walking"
	elif Input.is_action_just_pressed("jump"):
		animated_sprite_2d.animation = "Jump"
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
