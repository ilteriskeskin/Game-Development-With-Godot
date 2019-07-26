extends KinematicBody2D

const SPEED = 200
const FLOOR = Vector2(0, -1)

var velocity = Vector2()
var direction = 1
var is_dead = false
var start_score = 0

func _ready():
	pass

func dead():
	is_dead = true
	velocity = Vector2(0,0)
	$AnimatedSprite.play("dead")
	$CollisionShape2D.disabled = true
	$Timer.start()

func _physics_process(delta):
	if is_dead == false:
		velocity.x = SPEED * direction	
		if direction == 1:
			$AnimatedSprite.flip_h = false
		else:
			$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("fly")
		velocity = move_and_slide(velocity, FLOOR)
	elif is_dead == true:
		var score = get_node("../Score")
		score.set_text(str(start_score))
		start_score = start_score + 1

	if is_on_wall():
		direction *= -1

func _on_Timer_timeout():
	queue_free()
