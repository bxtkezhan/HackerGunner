extends Spatial

export var boxShape = Vector2(8, 8)
export(String, FILE, "*.scn") var jumpBox0_Scn
export var jumpBox0_Pos = Vector2(0, -6.5)
export(String, FILE, "*.scn") var jumpBox1_Scn
export var jumpBox1_Pos = Vector2(6.5, 0)
export(String, FILE, "*.scn") var jumpBox2_Scn
export var jumpBox2_Pos = Vector2(0, 6.5)
export(String, FILE, "*.scn") var jumpBox3_Scn
export var jumpBox3_Pos = Vector2(-6.5, 0)

onready var sceneBox = get_node("sceneBox")
onready var jumpBoxs = get_node("jumpBoxContainer")

func _ready():
	sceneBox.set_scale(
	Vector3(boxShape.x, 1, boxShape.y))
	if jumpBox0_Scn == null:
		jumpBoxs.get_node("jumpBox0").queue_free()
	else:
		jumpBoxs.get_node("jumpBox0").set_translation(Vector3(
			jumpBox0_Pos.x, 0, jumpBox0_Pos.y))
	if jumpBox1_Scn == null:
		jumpBoxs.get_node("jumpBox1").queue_free()
	else:
		jumpBoxs.get_node("jumpBox1").set_translation(Vector3(
			jumpBox1_Pos.x, 0, jumpBox1_Pos.y))
	if jumpBox2_Scn == null:
		jumpBoxs.get_node("jumpBox2").queue_free()
	else:
		jumpBoxs.get_node("jumpBox2").set_translation(Vector3(
			jumpBox2_Pos.x, 0, jumpBox2_Pos.y))
	if jumpBox3_Scn == null:
		jumpBoxs.get_node("jumpBox3").queue_free()
	else:
		jumpBoxs.get_node("jumpBox3").set_translation(Vector3(
			jumpBox3_Pos.x, 0, jumpBox3_Pos.y))
	
