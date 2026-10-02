extends VBoxContainer


func _ready() -> void:
	# Wait one frame for the UI system to fully initialize
	call_deferred("_focus_first_button")

func _focus_first_button() -> void:
	var buttons = get_all_buttons()
	
	# Verify that the container actually has buttons before grabbing focus
	if not buttons.is_empty():
		buttons[0].grab_focus()
func _unhandled_input(event: InputEvent) -> void:
	# 1. Check if the user is pressing a vertical movement action
	var direction = 0
	if event.is_action_pressed("ui_down"):
		direction = 1
	elif event.is_action_pressed("ui_up"):
		direction = -1
		
	# If no relevant button was pressed, do nothing
	if direction == 0:
		return
		
	# 2. Get the index of the currently focused button
	var current_index = get_focused_button_index()
	var buttons = get_all_buttons()
	
	if buttons.is_empty():
		return
		
	# 3. Calculate the new index with wrap-around scrolling
	var new_index = 0
	if current_index == -1:
		# If nothing is focused yet, default to the first or last depending on direction
		new_index = 0 if direction == 1 else buttons.size() - 1
	else:
		# Formula to safely wrap indices: (0 - 1 + 5) % 5 = 4 (wraps to bottom)
		new_index = (current_index + direction + buttons.size()) % buttons.size()
		
	# 4. Grab focus on the new target button
	buttons[new_index].grab_focus()
	
	# Accept the event so it doesn't trigger multiple UI actions simultaneously
	get_viewport().set_input_as_handled()

# Helper function to grab only Button nodes
func get_all_buttons() -> Array[Button]:
	var buttons: Array[Button] = []
	for child in get_children():
		if child is Button and child.focus_mode != FOCUS_NONE:
			buttons.append(child)
	return buttons

# Helper function to get the current button's index
func get_focused_button_index() -> int:
	var focused_node = get_viewport().gui_get_focus_owner()
	if not focused_node or focused_node.get_parent() != self:
		return -1
		
	var buttons = get_all_buttons()
	print(focused_node)
	return buttons.find(focused_node)
	
