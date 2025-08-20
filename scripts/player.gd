extends CharacterBody2D

@export var speed = 300
@export var gravity = 1500
@export var jump_force = 100

var jump_velocity: float = 0.0
var jump_timer: float

func jump(delta):
	if !is_on_floor():
		velocity.y += gravity * delta
		if velocity.y > 1000:
			velocity.y = 1000
	elif !Input.is_action_pressed("jump"):
		jump_velocity = 0
		jump_timer = 0
		
			
	if Input.is_action_just_pressed("jump"):# && is_on_floor():
		jump_velocity = -jump_force
		velocity.y = jump_velocity
		
	if Input.is_action_pressed("jump") && jump_timer < 0.25:
		velocity.y = jump_velocity
		jump_timer += delta

func _physics_process(delta: float) -> void:
	jump(delta)
	
	var horiz_direction = Input.get_axis("move_left","move_right") 
	velocity.x += speed * horiz_direction
	velocity.x *= 0.65
	move_and_slide()
	
	print(velocity)
