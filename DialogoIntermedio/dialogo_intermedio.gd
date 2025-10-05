extends Node2D


func start_dialog():
	var layout: Node = Dialogic.start("res://Cutscenes/Timeline/timeline.dtl")
	layout.scale = Vector2(0.6, 0.6)   # teste 0.25 ~ 0.5
	
	if layout is Control:
		layout.anchor_left = 0.0
		layout.anchor_top = 0.0
		layout.anchor_right = 1.0
		layout.anchor_bottom = 1.0
		layout.offset_left = 0
		layout.offset_top = 0
		layout.offset_right = 0
		layout.offset_bottom = 0
	add_child(layout)
	_set_when_paused_recursive(layout)
	await get_tree().process_frame
	get_tree().paused = true
	if not Dialogic.timeline_ended.is_connected(_on_timeline_ended):
		Dialogic.timeline_ended.connect(_on_timeline_ended)
		
func _set_when_paused_recursive(n: Node) -> void:
	n.process_mode = Node.PROCESS_MODE_WHEN_PAUSED
	for c in n.get_children():
		_set_when_paused_recursive(c)

func _on_timeline_ended() -> void:
	if Dialogic.timeline_ended.is_connected(_on_timeline_ended):
		Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	get_tree().paused = false
