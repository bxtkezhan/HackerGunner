extends Node

onready var sceneBox = get_node("sceneBox")
onready var characterBody = get_node("characterBody")
onready var shoot = get_node("shoot")

func _ready():
	set_process(true)
	set_process_input(true)

func _process(delta):
	if sceneBox.userClick != null:
		characterBody.destination = \
			sceneBox.userClick * Vector3(1, 0, 1)

func _input(event):
	if event.type == InputEvent.MOUSE_BUTTON:
		if event.button_index == BUTTON_LEFT and event.is_pressed():
			shoot.shoot()