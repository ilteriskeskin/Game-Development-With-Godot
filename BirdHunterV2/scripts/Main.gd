extends Node

var bird = preload("res://scenes/Bird.tscn")
onready var arrow = get_node("Player/bullet_container")

func _ready():
	set_physics_process(true)
	
func _physics_process(delta):
	if arrow.get_position() == bird.get_position():
		bird.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
