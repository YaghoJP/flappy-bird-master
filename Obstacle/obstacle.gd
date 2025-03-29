extends Node2D
class_name Obstacle

signal onPlaneCrashed(plane: Player)

@export_category('Variables')
@export var moveSpeed: float = 150
@export var canMove: bool = true

func _process(_delta: float) -> void:
	if canMove:
		position.x -= moveSpeed * _delta

func _on_body_entered(_body) -> void:
	if _body is Player:
		onPlaneCrashed.emit(_body)

func _on_exited_screen_notifier_screen_exited():
	queue_free()
