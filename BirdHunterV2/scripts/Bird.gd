extends KinematicBody2D

var vel = Vector2()

func _ready():
	set_physics_process(true)
	
func _physics_process(delta):
	move_and_collide(vel * delta)