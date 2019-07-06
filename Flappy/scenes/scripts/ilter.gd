extends RigidBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)

func _input(event):
	if event.is_action_pressed("touch"):
		on_touch()
		
func on_touch():
	apply_impulse(Vector2(0, 0), Vector2(0, -1000))
	get_node("SoundVoa")