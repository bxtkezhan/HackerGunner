extends Spatial

export(NodePath) var targetPath
var target = null
var active = false

func _ready():
	var sceneBoxMesh = get_node("sceneBox")
	sceneBoxMesh.get_mesh().surface_get_material(0).set_fixed_flag(0, true)
	if targetPath != null:
		target = get_node(targetPath)

func _on_Area_body_enter( body ):
	if target != null:
		if body.get_name() == target.get_name():
			active = true


func _on_Area_body_exit( body ):
	if target != null:
		if body.get_name() == target.get_name():
			active = false

func _on_stickersBody_input_event( camera, event, click_pos, click_normal, shape_idx ):
	if active:
		if event.type == InputEvent.MOUSE_BUTTON:
			if ((event.button_index == BUTTON_RIGHT or
				 event.button_index == BUTTON_LEFT) and
				event.is_pressed()):
				target.destination = click_pos
		elif event.type == InputEvent.SCREEN_TOUCH and event.is_pressed():
			target.destination = click_pos
