extends Spatial

export var useInduction = true

onready var cube = get_node("TestCube")
onready var timer = get_node("Timer")
const coinGen = preload("res://props/coin.scn")

func _ready():
	cube.hide()

func inductedPlay():
	useInduction = false
	timer.start()
	var coin = coinGen.instance()
	add_child(coin)

func _on_Timer_timeout():
	queue_free()
