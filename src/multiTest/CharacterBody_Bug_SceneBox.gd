extends Node

onready var characterBody = get_node("characterBody")
onready var shoot = characterBody.get_node("shoot")

func _ready():
	set_process_input(true)

func _input(event):
	if event.type == InputEvent.MOUSE_BUTTON:
		if (event.button_index == BUTTON_LEFT and
			event.is_pressed()):
			shoot.shoot()