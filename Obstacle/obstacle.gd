extends Node2D
class_name Obstacle

signal onPlaneCrashed

@export_category('Variables')
@export var moveSpeed: float = 150

func _process(_delta: float) -> void:
	position.x -= moveSpeed * _delta

func _on_body_entered(_body) -> void:
	if _body is Player:
		onPlaneCrashed.emit()

func _on_exited_screen_notifier_screen_exited():
	queue_free()
