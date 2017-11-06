extends RigidBody

onready var timer = get_node("Timer")
export var waitTime = 0.5
export var damageNum = 10

func _ready():
	timer.set_wait_time(waitTime)
	timer.start()

func _on_Timer_timeout():
	queue_free()

func _on_Area_body_enter( body ):
	body.blueNum -= damageNum
