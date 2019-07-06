extends Node2D

onready var ilter = get_node("ilter")
onready var timerToReplay = get_node("TimerToReplay")
onready var label = get_node("Node2D/Control/Label")

var pontos = 0
var estado = 1

const JOGANDO = 1
const PERDENDO = 2

func _ready():
	pass
	
func kill():
	ilter.apply_impulse(Vector2(0, 0), Vector2(-1000, 0))
	get_node("BackAnim").stop()
	estado = PERDENDO
	timerToReplay.start()
	get_node("SoundHit").play()

func pontuar():
	pontos += 1
	label.set_text(str(pontos))
	get_node("SoundScore").play()
	
func _on_TimerToReplay_timeout():
	get_tree().reload_current_scene()	