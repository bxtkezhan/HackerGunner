extends Area

export(NodePath) var bodyPath
export var characterName = "character"
export var damageNum = 10

onready var collisionShape = get_node("CollisionShape")
onready var timer = get_node("Timer")

var characterBody = null
var character = null

func _ready():
	if bodyPath != null:
		characterBody = get_node(bodyPath)
		character = characterBody.get_node(characterName)
		hide()
		collisionShape.set_rotation(Vector3(PI / 2, 0, 0))
		set_fixed_process(true)
#	
func _fixed_process(delta):
	set_rotation(character.get_rotation())

func shoot(delay=0.3):
	show()
	collisionShape.set_rotation(Vector3(0, 0, 0))
	timer.set_wait_time(delay)
	timer.start()

func _on_shoot_body_enter( body ):
	body.blueNum -= damageNum

func _on_Timer_timeout():
	hide()
	collisionShape.set_rotation(Vector3(PI / 2, 0, 0))
	timer.stop()

