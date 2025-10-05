extends SubViewportContainer

@onready var subvp: SubViewport = $SubViewport

func _unhandled_input(event: InputEvent) -> void:
	subvp.push_input(event)
