extends CharacterBody2D

@export var movespeed: int = 35
@onready var animations = $AnimationPlayer

func handleInput():
	var moveDirection = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	velocity = moveDirection * movespeed
	move_and_slide()
	updateAnimation()

func updateAnimation():
	var direction = "Down"
	if velocity.length() == 0:
		if animations.is_playing():
			animations.stop()
	else:
		if velocity.x < 0: direction = "Left"
		elif velocity.x > 0: direction = "Right"
		elif velocity.y < 0: direction = "Up"
		elif velocity.y > 0: direction = "Down"
		animations.play("walk"+direction)

func _physics_process(delta):
	handleInput()
	
