extends Node

onready var shoot = get_node("characterBody/shoot")
onready var throwGrenade = get_node("characterBody/throwGrenade")

var bulletNum = 40
var grenadeNum = 8

func _ready():
#	set_process_input(true)
	pass

#func _input(event):
#	if event.is_action_pressed("ui_j"):
#		if bulletNum > 0:
#				shoot.shoot()
#				bulletNum -= 1
#	elif event.is_action_pressed("ui_k"):
#		if grenadeNum > 0:
#			throwGrenade.throw()
#			grenadeNum -= 1