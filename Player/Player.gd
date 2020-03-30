extends KinematicBody2D

var motion = Vector2(0,0)

const SPEED = 100
const GRAVITY = 5
const UP_DIRECTION = Vector2(0,-1)

func _physics_process(delta):
    apply_gravity()
    if Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
        motion.x = SPEED
    elif Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
        motion.x = -SPEED
    else:
        motion.x = 0
        
    move_and_slide(motion, UP_DIRECTION)
    
func apply_gravity():
    if is_on_floor():
        motion.y = 0
    else:
        if motion.y <= 100*GRAVITY:
            motion.y += GRAVITY
        else:
            motion.y = 100*GRAVITY
