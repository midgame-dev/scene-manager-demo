extends Node
class_name GameManager

static var _instance: GameManager

@export var current_scene: Node

func _ready() -> void:
	if _instance == null:
		_instance = self
	else:
		push_warning("More than one GameManager instance detected. Only one should exist.")

static func change_scene(scene_path: String) -> void:
	if _instance:
		_instance.call_deferred("_deferred_change_scene", scene_path)
	else:
		push_error("GameManager instance not found. Ensure it's properly initialized.")

func _deferred_change_scene(scene_path) -> void:
	var new_scene = load(scene_path).instantiate()
	
	remove_child(current_scene)
	current_scene.queue_free()
	
	add_child(new_scene)
	current_scene = new_scene
