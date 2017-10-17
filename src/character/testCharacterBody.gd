extends Spatial

onready var characterBody = get_node("characterBody")
onready var timer = get_node("Timer")

func _ready():
	timer.set_wait_time(2)
	timer.start()


func _on_Timer_timeout():
	characterBody.destination = Vector3(
		rand_range(-6.5, 6.5), 0, rand_range(-6.5, 6.5))
