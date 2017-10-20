extends Spatial

export(NodePath) var targetPath
var target = null

func _ready():
	if targetPath != null:
		target = get_node(targetPath)

func _on_stickersBody_input_event( camera, event, click_pos, click_normal, shape_idx ):
	if target != null:
		if event.type == InputEvent.MOUSE_BUTTON:
			if event.button_index == BUTTON_RIGHT and event.is_pressed():
				target.destination = click_pos
		elif event.type == InputEvent.SCREEN_TOUCH and event.is_pressed():
			target.destination = click_pos
