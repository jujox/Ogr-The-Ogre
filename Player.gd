extends Area2D

@export var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		$AnimatedSprite2D.play("right")
		velocity.x += 1
	elif Input.is_action_pressed("move_left"):
		$AnimatedSprite2D.play("left")
		velocity.x -= 1
	elif Input.is_action_pressed("move_down"):
		$AnimatedSprite2D.play("down")
		velocity.y += 1
	elif Input.is_action_pressed("move_up"):
		$AnimatedSprite2D.play("up")
		velocity.y -= 1
	else:
		$AnimatedSprite2D.stop()
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed

	position += velocity * delta
