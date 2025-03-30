extends Node
class_name PlaneManager

signal onObstaclesStart

@export_category('Variavles')
@export var _currentIndexSkin: int = 0
@export var spawnPosition: Vector2 = Vector2(220, 375)

@export_category('Objects')
@export var _skins: Dictionary[int, SkinsPlane] = {}

func _ready():
	setSkin(_currentIndexSkin,spawnPosition)
	
func setSkin(_indexSkin: int, _position: Vector2) -> void:
	var _plane = _skins[_indexSkin].plane.instantiate()
	add_child(_plane)
	
	_plane.position = spawnPosition
	_plane.onGameStarted.connect(onGamerStarted)

func onGamerStarted() ->void:
	onObstaclesStart.emit()
