extends Node2D

onready var idle = get_node("Idle")
onready var bate = get_node("Bate")
onready var anim = get_node("Anim")
onready var grave = get_node("Grave")

var lado

const ESQ = -1
const DIR = 1

func _ready():
	pass

func esq():
	set_position(Vector2(220, 1070))
	idle.set_flip_h(false)
	bate.set_flip_h(false)
	
	grave.set_position(Vector2(-44, 41))
	grave.set_flip_h(true)
	lado = ESQ
	
func dir():
	set_position(Vector2(500, 1070))
	idle.set_flip_h(true)
	bate.set_flip_h(true)
	
	grave.set_position(Vector2(28, 41))
	grave.set_flip_h(false)
	lado = DIR
	
func bater():
	anim.play("Bater")