extends Area2D

@export var SPEED = 200
var MOVEMENT_LIMIT = (randi() % 30) + 20
var UP_MOVEMENT_LIMIT = MOVEMENT_LIMIT
var DOWN_MOVEMENT_LIMIT = -MOVEMENT_LIMIT
var direction_y = 0
var actual_direction = Vector2.UP
var screen_size

func _ready():
	screen_size = get_parent().get_viewport_rect().size

func reset_movement_limits():
	MOVEMENT_LIMIT = (randi() % 30) + 20
	UP_MOVEMENT_LIMIT = MOVEMENT_LIMIT
	DOWN_MOVEMENT_LIMIT = -MOVEMENT_LIMIT
	
func _process(delta):
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

	position.y += actual_direction.y * SPEED * delta
	position.y = clamp(position.y, 0, screen_size.y)


func _on_body_entered(body):
	if body.name.begins_with("Player"):
		body.hurted = true



func _on_body_exited(body):
	if body.name.begins_with("Player"):
		body.hurted = false
