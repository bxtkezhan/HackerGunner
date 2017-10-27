extends Spatial

export(int) var waitTime = 3

onready var timer = get_node("Timer")
onready var explodeGen = preload("res://specialEffects/explode.tscn")

var bodyList = []
var areaList = []
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

func _on_Area_area_enter( area ):
	if areaList.find(area) == -1:
		areaList.append(area)

func _on_Timer_timeout():
	if timeoutTag == 1: # 1s
		timeoutTag = 2
		# do
		explode = explodeGen.instance()
		explode.get_node("Particles").set_emit_timeout(0.75)
		add_child(explode)
		get_node("grenade").hide()
		for body in bodyList:
			if body.get("blueNum") != null:
				body.blueNum = 0
		for area in areaList:
			print(str(area))
			if (str(area) != "[Deleted Object]" and
				area.get("useInduction") != null):
				if area.useInduction == true:
					area.inductedPlay()
		# end
		timer.set_wait_time(1.5)
		timer.start()
	elif timeoutTag == 2:
		queue_free()
