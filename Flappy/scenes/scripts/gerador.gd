extends Position2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var cano = preload("res://scenes/cano.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()

func _on_Timer_timeout():
	var novocano = cano.instance()
	novocano.set_position(get_position() + Vector2(0, rand_range(-500, 500)))
	get_owner().add_child(novocano)