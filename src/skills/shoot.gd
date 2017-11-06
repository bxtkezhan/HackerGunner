extends Spatial

onready var shootingPart1 = get_node("shootingPart1")
onready var timer = get_node("Timer")
onready var doubleBulletGen = preload("res://props/doubleBullet.tscn")

export(NodePath) var bodyPath
export var characterName = "character"
export var damageNum = 10

var character = null

func _ready():
	shootingPart1.hide()
	if bodyPath != null:
		var characterBody = get_node(bodyPath)
		character = characterBody.get_node(characterName)
		timer.set_wait_time(shootingPart1.get_variable(0))

func shoot():
	if character != null:
		timer.start()
		var rotation = character.get_rotation()
		var doubleBullet = doubleBulletGen.instance()
		set_rotation(rotation)
		shootingPart1.show()
		doubleBullet.set_translation(Vector3(0, 1, 2))
		doubleBullet.set_linear_velocity(
			Vector3(0, 0, 5).rotated(Vector3(0, -1, 0), rotation.y))
		doubleBullet.damageNum = damageNum
		add_child(doubleBullet)

func _on_Timer_timeout():
	shootingPart1.hide()
