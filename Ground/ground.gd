extends Node2D
class_name Ground

signal onPlaneCrashed(plane: Player)

@export_category("Objects")
@export var ground_1: Area2D
@export var ground_2: Area2D
@export var textureGround_1: Sprite2D

@export_category("Variables")
@export var speed: float = -150.0

var width: int

func _ready() -> void:
	width = textureGround_1.texture.get_width()
	
func _process(delta: float) -> void:
	ground_1.global_position.x += speed * delta
	ground_2.global_position.x += speed * delta
	
	if ground_1.global_position.x < -int(width/2):
		ground_1.global_position.x = ground_2.global_position.x + width

	if ground_2.global_position.x < -int(width/2):
		ground_2.global_position.x = ground_1.global_position.x + width

func _on_body_entered(body: Node2D) -> void:
	
	if body is Player:
		body.isDead = true
		onPlaneCrashed.emit(body)
		stopMoveGround()
		body.stopGravity()

func stopMoveGround() ->void:
	speed = 0
