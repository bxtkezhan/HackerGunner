extends Spatial

onready var sceneBoxGen = preload("res://sceneBase/sceneBox.scn")
onready var rigidBody = get_node("RigidBody")

var bodySpeed = Vector3(0, 0, 0)

func _ready():
	var sceneBox1 = sceneBoxGen.instance()
	var sceneBox2 = sceneBoxGen.instance()
	sceneBox1.set_translation(Vector3(-4, 0, 0))
	sceneBox1.boxShape = Vector2(3.5, 8)
	sceneBox1.bodyName = "RigidBody"
	sceneBox1.jumpBox0 = Vector3(4, 0.6, 0)
	sceneBox2.set_translation(Vector3(4, 0, 0))
	sceneBox2.boxShape = Vector2(3.5, 8)
	sceneBox2.bodyName = "RigidBody"
	sceneBox2.jumpBox2 = Vector3(-4, 0.6, 0)
	add_child(sceneBox1)
	add_child(sceneBox2)
	
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