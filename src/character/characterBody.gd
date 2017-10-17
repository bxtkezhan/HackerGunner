extends RigidBody

export var destination = Vector3(0, 0, 0)
export var moveSpeed = 300
export var animationSpeed = 1.5

onready var character = get_node("character")
onready var animationPlayer = character.get_node("AnimationPlayer")

var destinationHist = destination

func _ready():
	animationPlayer.set_speed(animationSpeed)
	set_fixed_process(true)
	
func calcAngle(vect):
	var vect_src = Vector3(0, 0, 1)
	var vect_dst = vect - get_translation()
	var x = vect_dst.x
	var angle = vect_src.angle_to(vect_dst)
	return (2 * (x > 0) - 1) * angle

func _fixed_process(delta):
	var translation = get_translation()
	if destination != destinationHist:
		character.set_rotation(
			Vector3(0, calcAngle(destination), 0))
		destinationHist = destination
		print(destinationHist)
	if translation.distance_to(destination) > 0.5:
		set_linear_velocity(
			(destination - translation).normalized() *
			 moveSpeed * delta)
		if not animationPlayer.is_playing():
			animationPlayer.play("Arun")
	elif get_linear_velocity().length() > 0:
		set_linear_velocity(Vector3(0, 0, 0))
		animationPlayer.play("default")