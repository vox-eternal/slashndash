extends CharacterBody2D

@export var speed = 200
@export var gravity = 1500
@export var jump_force = 100

var jump_velocity: float = 0.0
var jump_timer: float

var sprite: Sprite2D

var sword: Node2D

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
		
	if Input.is_action_pressed("jump") && jump_timer < 0.35:
		velocity.y = jump_velocity
		jump_timer += delta
		
func _ready() -> void:
	sword = get_node("Sword")
	sprite = self.get_child(0)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("click"):
		#-(sprite.texture.get_width() * sprite.scale.x / 2)
		sword.position = Vector2(0, -(sprite.texture.get_height() * sprite.scale.y / 2))
		sword.visible = true
		sword.get_child(0).swing_sword()

func _physics_process(delta: float) -> void:
	jump(delta)
	
	var horiz_direction = Input.get_axis("move_left","move_right") 
	velocity.x += speed * horiz_direction
	velocity.x *= 0.65
	move_and_slide()
