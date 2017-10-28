extends RigidBody

export var scale = 1
export var moveSpeed = 300
export var animationSpeed = 1.5
export var blueNum = 100

onready var character = get_node("character")
onready var animationPlayer = character.get_node("AnimationPlayer")
onready var timer = get_node("Timer")
onready var util = preload("../libs/util.gd").new()

var destination = null
var destinationHist = null
var attacker = null

func _ready():
	for node in get_children():
		if node.get_name() != "Timer":
			node.set_scale(Vector3(1, 1, 1) * scale)
		if "CollisionShape" in node.get_name():
			node.set_translation(node.get_translation() * scale)
	destination = get_translation()
	destinationHist = destinationHist
	animationPlayer.set_speed(animationSpeed)
	set_fixed_process(true)

func beAttacked(node, speed=15):
	attacker = node
	var vect = get_translation() - attacker.get_translation()
	vect = vect.normalized() * Vector3(1, 0, 1)
	set_linear_velocity(vect * speed)
	timer.start()

func _on_Timer_timeout():
	destination = get_translation()
	attacker = null

func _fixed_process(delta):
	if attacker != null: return
	var translation = get_translation()
	# Rotate
	if destination != destinationHist:
		character.set_rotation(
			Vector3(0, util.calcAngle(
			translation, destination), 0))
		destinationHist = destination
	# Translation
	if translation.distance_to(destination) > 0.5:
		set_linear_velocity(
			(destination - translation).normalized() *
			 Vector3(1, 0, 1) * moveSpeed * delta)
		if not animationPlayer.is_playing():
			animationPlayer.play("Arun")
	elif get_linear_velocity().length() > 0:
		set_linear_velocity(Vector3(0, 0, 0))
		animationPlayer.play("default")
