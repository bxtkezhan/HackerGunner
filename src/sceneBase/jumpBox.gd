extends Spatial

export var targetName = "characterBody"
export(Vector3) var destination

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _on_Area_body_enter( body ):
	if body.get_name() == targetName and destination != null:
		body.set_translation(destination)
		if body.get("destination") != null:
			body.destination = destination
