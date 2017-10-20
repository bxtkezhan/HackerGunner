extends Spatial

onready var sceneBoxGen = preload("res://sceneBase/sceneBox.scn")
onready var jumpBoxGen = preload("res://sceneBase/jumpBox.scn")
onready var rigidBody = get_node("RigidBody")

var bodySpeed = Vector3(0, 0, 0)

func _ready():
	var sceneBox1 = sceneBoxGen.instance()
	var jumpBox1 = jumpBoxGen.instance()
	var sceneBox2 = sceneBoxGen.instance()
	var jumpBox2 = jumpBoxGen.instance()
	
	sceneBox1.set_translation(Vector3(-4, 0, 0))
	sceneBox1.set_scale(Vector3(3.5 / 8, 1, 1))
	jumpBox1.set_translation(Vector3(-4, 0, -6.5))
	jumpBox1.targetName = "RigidBody"
	jumpBox1.destination = Vector3(4, 0.6, 0)
	sceneBox2.set_translation(Vector3(4, 0, 0))
	sceneBox2.set_scale(Vector3(3.5 / 8, 1, 1))
	jumpBox2.set_translation(Vector3(4, 0, 6.5))
	jumpBox2.targetName = "RigidBody"
	jumpBox2.destination = Vector3(-4, 0.6, 0)
	
	add_child(sceneBox1)
	add_child(jumpBox1)
	add_child(sceneBox2)
	add_child(jumpBox2)
	
	set_process_input(true)
	set_fixed_process(true)

func _input(event):
	if event.is_action_pressed("ui_up"):
		bodySpeed.z = -1
	elif event.is_action_pressed("ui_down"):
		bodySpeed.z = 1
	elif ((event.is_action_released("ui_up") and bodySpeed.z < 0) or
		  (event.is_action_released("ui_down") and bodySpeed.z > 0)):
		bodySpeed.z = 0

func _fixed_process(delta):
	rigidBody.set_linear_velocity(bodySpeed * 300 * delta)