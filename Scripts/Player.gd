extends CharacterBody2D

@export var speed = 100

func get_input():
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_dir * speed

func animate_sprite():
	if Input.is_action_pressed("move_right"):
		$AnimatedSprite2D.play("right")
	elif Input.is_action_pressed("move_left"):
		$AnimatedSprite2D.play("left")
	elif Input.is_action_pressed("move_down"):
		$AnimatedSprite2D.play("down")
	elif Input.is_action_pressed("move_up"):
		$AnimatedSprite2D.play("up")
	else:
		$AnimatedSprite2D.stop()	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	animate_sprite()
	get_input()
	var collision = move_and_collide(velocity * delta)
	if collision:
		var collider = collision.get_collider()
		if collider.name.begins_with("Enemy"):
			$AnimatedSprite2D.play("hurted_ogre")
