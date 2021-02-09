extends KinematicBody2D

signal animate

var motion = Vector2()

const SPEED = 1200
const GRAVITY = 250
const UP = Vector2.UP
const JUMP_SPEED = -3500
const WORL_LIMIT = 3500
const BOOST = JUMP_SPEED * 1.5


func _physics_process(delta):
	apply_gravity()
	jump()
	move()
	animate()
	move_and_slide(motion, UP)
	
	
func apply_gravity():
	if position.y > WORL_LIMIT:
		get_tree().call_group("Gamestate", "end_game")
	elif is_on_floor() and motion.y > 0:
		motion.y = 0
	elif is_on_ceiling():
		motion.y = 1
	else:
		motion.y += GRAVITY
		
		
func move():
	if Input.is_action_pressed("move_left") and not Input.is_action_pressed("move_right"):
		motion.x = -SPEED
	elif Input.is_action_pressed("move_right") and not Input.is_action_pressed("move_left"):
		motion.x = SPEED
	else:
		motion.x = 0
		

func jump():
	if Input.is_action_pressed("jump") and is_on_floor():
		motion.y = JUMP_SPEED
		$JumpSFX.play()
		
		
func animate():
	emit_signal("animate", motion)
	
	
func hurt():
	position.y -= 1
	yield(get_tree(), "idle_frame")
	motion.y = JUMP_SPEED
	$PainSFX.play()
		
		
func boost():
	position.y -= 1
	yield(get_tree(), "idle_frame")
	motion.y = BOOST