extends AnimatedSprite


func _ready():
    pass


func _on_Player_animate(motion):
    if motion.y < 0:
        pass
    elif motion.x > 0:
        flip_h = false
    elif motion.x < 0:
        flip_h = true
    else:
        play("idle")
