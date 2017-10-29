extends Control

export(NodePath) var shootNode
export(NodePath) var throwGrenadeNode

export var bulletNum = 50
export var grenadeNum = 10

var shoot = null
var throwGrenade = null

func _ready():
	if shootNode != null:
		shoot = get_node(shootNode)
	if throwGrenadeNode != null:
		throwGrenade = get_node(throwGrenadeNode)
	set_process_input(true)

func _input(event):
	if event.is_action_pressed("ui_j"):
		if shoot != null and bulletNum > 0:
			shoot.shoot()
			bulletNum -= 1
	elif event.is_action_pressed("ui_k"):
		if throwGrenade != null and grenadeNum > 0:
			throwGrenade.throw()
			grenadeNum -= 1

func _on_buttonA_pressed():
		if shoot != null and bulletNum > 0:
			shoot.shoot()
			bulletNum -= 1

func _on_buttonB_pressed():
		if throwGrenade != null and grenadeNum > 0:
			throwGrenade.throw()
			grenadeNum -= 1
