extends CharacterBody2D

@export var SPEED = 200
var MOVEMENT_LIMIT = (randi() % 30) + 20
var UP_MOVEMENT_LIMIT = MOVEMENT_LIMIT
var DOWN_MOVEMENT_LIMIT = -MOVEMENT_LIMIT
var direction_y = 0
var actual_direction = Vector2.UP

func reset_movement_limits():
	MOVEMENT_LIMIT = (randi() % 30) + 20
	UP_MOVEMENT_LIMIT = MOVEMENT_LIMIT
	DOWN_MOVEMENT_LIMIT = -MOVEMENT_LIMIT
	
func _physics_process(delta):
	if actual_direction == Vector2.UP  and direction_y <= UP_MOVEMENT_LIMIT:
		direction_y += 1
	elif actual_direction == Vector2.UP:
		reset_movement_limits()
		actual_direction = Vector2.DOWN
		direction_y -= 1
	elif actual_direction == Vector2.DOWN  and direction_y >= DOWN_MOVEMENT_LIMIT:
		direction_y -= 1
	elif actual_direction == Vector2.DOWN:
		reset_movement_limits()
		actual_direction = Vector2.UP
		direction_y += 1

	var collision = move_and_collide(velocity * delta)
	if collision:
		var collider = collision.get_collider()
		if collider.name.begins_with("Player"):
			collider.get_node("AnimatedSprite2D").play("hurted_ogre")

	velocity = actual_direction * SPEED

