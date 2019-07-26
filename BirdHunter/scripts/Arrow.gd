extends Area2D

const SPEED = 700
var velocity = Vector2()

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	velocity.y = -(SPEED * delta)
	translate(velocity)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Arrow_body_entered(body):
	if "Bird" in body.name:
		body.dead()
	queue_free()
