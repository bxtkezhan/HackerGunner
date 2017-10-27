extends Node

onready var shoot = get_node("characterBody/shoot")
onready var throwGrenade = get_node("characterBody/throwGrenade")

var bulletNum = 40
var grenadeNum = 8

func _ready():
	set_process_input(true)

func _input(event):
	if event.type == InputEvent.MOUSE_BUTTON:
		if event.button_index == BUTTON_LEFT and event.is_pressed():
			if bulletNum > 0:
				shoot.shoot()
				bulletNum -= 1
	if event.is_action_pressed("ui_space"):
		if grenadeNum > 0:
			throwGrenade.throw()
			grenadeNum -= 1