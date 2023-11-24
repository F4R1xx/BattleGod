extends CharacterBody2D


const SPEED = 100.0
@onready var step_sound = $step_sound as AudioStreamPlayer
@onready var animation := $anime as AnimatedSprite2D

func _physics_process(delta):

	var direction2 = Input.get_axis("ui_up","ui_down")
	if direction2:
		velocity.y = direction2 * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
		

	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if direction != 0:
		animation.play("run")
		animation.scale.x = direction
		
	elif direction2 > 0:
		animation.play("walk_down")
		
	elif direction2 < 0:
		animation.play("walk_up")
		
	elif direction > 0 and direction2 > 0:
		step_sound.play()
		animation.play("run")
		
	elif direction < 0 and direction2 < 0:
		step_sound.play()
		animation.play("run")
		
	elif direction > 0 and direction2 < 0:
		step_sound.play()
		animation.play("run")
		
	elif direction < 0 and direction2 > 0:
		step_sound.play()
		animation.play("run")

	if direction == 0 and direction2 == 0:
		step_sound.play()
		animation.play("idle")

	move_and_slide()
