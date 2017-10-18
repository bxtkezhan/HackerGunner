extends Node

onready var sceneBox = get_node("sceneBox")
onready var characterBody = get_node("characterBody")

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	if sceneBox.userClick != null:
		characterBody.destination = \
			sceneBox.userClick * Vector3(1, 0, 1)