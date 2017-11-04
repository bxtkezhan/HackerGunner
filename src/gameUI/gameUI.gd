extends Control

export(NodePath) var shootNode
export(NodePath) var throwGrenadeNode
export(NodePath) var coinMineNode

export var bulletNum = 50
export var grenadeNum = 10

onready var menuBar = get_node("menuBar")
onready var dashPanel = get_node("dashPanel")

var shoot = null
var throwGrenade = null
var coinMine = null
var coinCount = 0

func _ready():
	if shootNode != null:
		shoot = get_node(shootNode)
		menuBar.get_node("bullet/Label").set_text("x%d" % bulletNum)
	if throwGrenadeNode != null:
		throwGrenade = get_node(throwGrenadeNode)
		menuBar.get_node("grenade/Label").set_text("x%d" % grenadeNum)
	set_process_input(true)
	
	if coinMineNode != null:
		coinMine = get_node(coinMineNode)
		coinCount = coinMine.get_child_count()
		set_process(true)

func doShoot():
	shoot.shoot()
	bulletNum -= 1
	menuBar.get_node("bullet/Label").set_text(
		"x%d" % bulletNum)

func doThrow():
	throwGrenade.throw()
	grenadeNum -= 1
	menuBar.get_node("grenade/Label").set_text(
		"x%d" % grenadeNum)

func _input(event):
	if event.is_action_pressed("ui_j"):
		if shoot != null and bulletNum > 0:
			doShoot()
	elif event.is_action_pressed("ui_k"):
		if throwGrenade != null and grenadeNum > 0:
			doThrow()

func _on_menuButton_pressed():
	get_tree().set_pause(true)
	dashPanel.show()

func _on_continue_pressed():
	dashPanel.hide()
	get_tree().set_pause(false)

func _on_buttonA_pressed():
		if shoot != null and bulletNum > 0:
			doShoot()

func _on_buttonB_pressed():
		if throwGrenade != null and grenadeNum > 0:
			doThrow()
			
func _process(delta):
	menuBar.get_node("coin/Label").set_text(
		"x%d" % (coinCount - coinMine.get_child_count()))