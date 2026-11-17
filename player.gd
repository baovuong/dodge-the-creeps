extends Area2D

@export var speed = 400 # How fast the player willl move (pixels/sec).
var screen_size # Size of the game window

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	
	# check for input
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	
	# Move in the given direction
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed 
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	
	# Play the appropriate animation
