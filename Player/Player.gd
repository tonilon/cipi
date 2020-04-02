extends KinematicBody2D

var motion = Vector2(0,0)
var scalePercentage = Vector2(8,8)

onready var PlayerSprite = $AnimatedSprite
onready var PlayerCollisionShape = $CollisionShape2D

const SPEED = 100
const JUMP_SPEED = 200
const GRAVITY = 30
const UP_DIRECTION = Vector2(0,-1)

func _ready():
    PlayerSprite.set_scale(scalePercentage)
    PlayerCollisionShape.set_scale(scalePercentage)

func _physics_process(delta):
    apply_gravity()
    jump_logic()
    move_logic()
    move_and_slide(motion, UP_DIRECTION)
    
func apply_gravity():
    if is_on_floor():
        motion.y = 0
    else:
        if motion.y <= 100*GRAVITY:
            motion.y += GRAVITY
        else:
            motion.y = 100*GRAVITY
            
func move_logic():
    
    if Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
        motion.x = SPEED
        PlayerSprite.flip_h = false
        
    elif Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
        motion.x = -SPEED
        PlayerSprite.flip_h = true
        
    else:
        motion.x = 0
        
func jump_logic():
    if Input.is_action_just_pressed("jump") and is_on_floor():
        motion.y -= JUMP_SPEED
