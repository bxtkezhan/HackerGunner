extends RigidBody

export var scale = 1
export var moveSpeed = 100
export var animationSpeed = 1
export var targetName = "characterBody"
export var blueNum = 100

onready var bug = get_node("bug")
onready var animationPlayer = bug.get_node("AnimationPlayer")
onready var util = preload("../libs/util.gd").new()

var destination = null
var destinationHist = null
var targetBody = null

func _ready():
	for node in get_children():
		if "CollisionShape" in node.get_name():
			node.set_translation(node.get_translation() * scale)
			node.set_scale(node.get_scale() * scale)
		elif "scanTarget" in node.get_name():
			node.set_scale(Vector3(2, 2, 2) * scale + Vector3(3, 3, 3))
		else:
			node.set_scale(node.get_scale() * scale)
	destination = get_translation() * Vector3(1, 0, 1)
	destinationHist = destination
	animationPlayer.set_speed(animationSpeed)
	set_fixed_process(true)

func _fixed_process(delta):
	var translation = get_translation()
	# Rotate
	if destination != destinationHist:
		bug.set_rotation(
			Vector3(0, util.calcAngle(
			translation, destination), 0))
		destinationHist = destination
	# Translation
	var linearVelocity = get_linear_velocity()
	if translation.distance_to(destination) > 0.5:
		set_linear_velocity(
			linearVelocity * Vector3(0, 1, 0) +
			(destination - translation).normalized() *
			Vector3(1, 0, 1) * moveSpeed * delta)
		if not animationPlayer.is_playing():
			animationPlayer.play("Arun")
	elif linearVelocity.length() > 0:
		set_linear_velocity(linearVelocity * Vector3(0, 1, 0))
		animationPlayer.play("default")

	if targetBody != null:
		destination = targetBody.get_translation()
		
	# Blue Numer = 0 => Out
	if blueNum <= 0:
		queue_free()

func _on_scanTarget_body_enter( body ):
	if body.get_name() == targetName:
		targetBody = body

func _on_scanTarget_body_exit( body ):
	if body.get_name() == targetName:
		targetBody = null
		destination = get_translation()

func _on_attackTarget_body_enter( body ):
	if body.get_name() == targetName:
		body.beAttacked(get_node("."))