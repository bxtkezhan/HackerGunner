extends Spatial

export(int) var waitTime = 3

onready var timer = get_node("Timer")
onready var explodeGen = preload("res://specialEffects/explode.tscn")

var bodyList = []
var timeoutTag = 1
var explode = null

func _ready():
	timer.set_wait_time(waitTime)
	timer.start()

func _on_Area_body_enter( body ):
	if bodyList.find(body) == -1:
		bodyList.append(body)

func _on_Area_body_exit( body ):
	var index = bodyList.find(body)
	if index != -1:
		bodyList.remove(index)

func _on_Timer_timeout():
	if timeoutTag == 1:
		timeoutTag = 2
		explode = explodeGen.instance()
		explode.get_node("Particles").set_emit_timeout(0.75)
		add_child(explode)
		get_node("grenade").hide()
		timer.set_wait_time(1.5)
		timer.start()
		print(bodyList)
	elif timeoutTag == 2:
		queue_free()
