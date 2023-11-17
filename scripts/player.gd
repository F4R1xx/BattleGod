extends CharacterBody2D


const SPEED = 100.0

@onready var animation := $anime as AnimatedSprite2D

func _physics_process(delta):
	# Add the gravity

	# Handle Jump.
	var direction2 = Input.get_axis("ui_up","ui_down")
	if direction2:
		velocity.y = direction2 * SPEED
		animation.play("walk_up")
	else:
		velocity.y = move_toward(velocity.x, 0, SPEED)
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		animation.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		

	move_and_slide()
