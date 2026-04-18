extends CharacterBody2D

const MAX_SPEED := 50.0
const ACCELERATION := 200.0
const DECELERATION := 200.0


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	var direction := Input.get_axis("ui_left", "ui_right")

	if direction != 0:
		var target_speed = direction * MAX_SPEED
		velocity.x = move_toward(velocity.x, target_speed, ACCELERATION * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, DECELERATION * delta)

	move_and_slide()
