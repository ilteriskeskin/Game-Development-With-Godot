extends KinematicBody2D

export (int) var speed = 300
var velocity = Vector2()

const ARROW = preload("res://scenes/Arrow.tscn")

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
        velocity.x += 1
	if Input.is_action_pressed('ui_left'):
        velocity.x -= 1
	if Input.is_action_just_pressed('shoot'):
		var arrow = ARROW.instance()
		get_parent().add_child(arrow)
		arrow.position = $Position2D.global_position

	velocity = velocity.normalized() * speed

func _physics_process(delta):
    get_input()
    velocity = move_and_slide(velocity)
