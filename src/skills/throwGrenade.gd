extends Spatial

export(NodePath) var bodyPath
export(NodePath) var grenadeContainerPath
const grenadeGen = preload("res://props/grenade.scn")

var characterBody = null
var grenadeContainer = null

func _ready():
	if bodyPath != null and grenadeContainerPath != null:
		characterBody = get_node(bodyPath)
		grenadeContainer = get_node(grenadeContainerPath)

func throw(grenadeScale = 0.5):
	if characterBody != null and grenadeContainer != null:
		var grenade = grenadeGen.instance()
		grenade.set_scale(Vector3(1, 1, 1) * grenadeScale)
		grenade.set_translation(characterBody.get_translation())
		grenadeContainer.add_child(grenade)