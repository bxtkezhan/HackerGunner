extends Spatial

onready var bugBody = get_node("bugBody")
onready var timer = get_node("Timer")

func _ready():
	timer.set_wait_time(2)
	timer.start()


func _on_Timer_timeout():
	bugBody.destination = Vector3(
		rand_range(-6.5, 6.5), 0, rand_range(-6.5, 6.5))
