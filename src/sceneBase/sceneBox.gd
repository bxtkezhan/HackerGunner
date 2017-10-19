extends Spatial

export var boxShape = Vector2(8, 8)
export var bodyName = "characterBody"
export(Vector3) var jumpBox0
export var jumpBox0_Pos = Vector2(0, -6.5)
export(Vector3) var jumpBox1
export var jumpBox1_Pos = Vector2(6.5, 0)
export(Vector3) var jumpBox2
export var jumpBox2_Pos = Vector2(0, 6.5)
export(Vector3) var jumpBox3
export var jumpBox3_Pos = Vector2(-6.5, 0)

onready var sceneBox = get_node("sceneBox")
onready var jumpBoxs = get_node("jumpBoxContainer")
onready var stickersPlane = get_node("stickersPlane")

var userClick = null

func _ready():
	sceneBox.set_scale(
	Vector3(boxShape.x, 1, boxShape.y))
	stickersPlane.set_scale(
	Vector3(boxShape.x / 8, 1, boxShape.y / 8))
	if jumpBox0 == null:
		jumpBoxs.get_node("jumpBox0").queue_free()
	else:
		jumpBoxs.get_node("jumpBox0").set_translation(Vector3(
			jumpBox0_Pos.x, 0, jumpBox0_Pos.y))
	if jumpBox1 == null:
		jumpBoxs.get_node("jumpBox1").queue_free()
	else:
		jumpBoxs.get_node("jumpBox1").set_translation(Vector3(
			jumpBox1_Pos.x, 0, jumpBox1_Pos.y))
	if jumpBox2 == null:
		jumpBoxs.get_node("jumpBox2").queue_free()
	else:
		jumpBoxs.get_node("jumpBox2").set_translation(Vector3(
			jumpBox2_Pos.x, 0, jumpBox2_Pos.y))
	if jumpBox3 == null:
		jumpBoxs.get_node("jumpBox3").queue_free()
	else:
		jumpBoxs.get_node("jumpBox3").set_translation(Vector3(
			jumpBox3_Pos.x, 0, jumpBox3_Pos.y))


func _on_Area0_body_enter( body ):
	if body.get_name() == bodyName:
		body.set_translation(jumpBox0)
		userClick = jumpBox0

func _on_Area1_body_enter( body ):
	if body.get_name() == bodyName:
		body.set_translation(jumpBox1)
		userClick = jumpBox1

func _on_Area2_body_enter( body ):
	if body.get_name() == bodyName:
		body.set_translation(jumpBox2)
		userClick = jumpBox2

func _on_Area3_body_enter( body ):
	if body.get_name() == bodyName:
		body.set_translation(jumpBox3)
		userClick = jumpBox3

func _on_stickersPlaneBody_input_event( camera, event, click_pos, click_normal, shape_idx ):
	if event.type == InputEvent.MOUSE_BUTTON:
		if event.button_index == BUTTON_RIGHT and event.is_pressed():
			userClick = click_pos
	elif event.type == InputEvent.SCREEN_TOUCH and event.is_pressed():
		userClick = click_pos
