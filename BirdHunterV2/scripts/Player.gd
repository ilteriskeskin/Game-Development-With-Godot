extends Area2D

export var rot_speed = 2.6
export var thrust = 500
export var max_vel = 400
export var friction = 0.65

export (PackedScene) var bullet

onready var bullet_container = get_node("bullet_container")
onready var gun_timer = get_node("gun_timer")

var screen_size = Vector2()
var pos = Vector2()

func _ready():
	screen_size = get_viewport_rect().size
	pos = screen_size / 2
	set_position(pos)
	set_process(true)
	
func _process(delta):
	if Input.is_action_pressed("ates"):
		if gun_timer.get_time_left() == 0:
			shoot()
	if Input.is_action_pressed("ui_left"):
		pos.x -= 5
	if Input.is_action_pressed("ui_right"):
		pos.x += 5
	set_position(pos)
	
	if pos.x > screen_size.x:
		pos.x = 0
	if pos.x < 0:
		pos.x = screen_size.x
	set_position(pos)
	
func shoot():
	gun_timer.start()
	var b = bullet.instance()
	bullet_container.add_child(b)
	b.start_at(get_rotation(), get_node("muzzle").get_global_position())