extends Node2D
class_name SpawnManger

const OBSTACLE = preload("res://Obstacle/obstacle.tscn")

@export_category('Objects')
@export var _timer: Timer
@export var _spawnPosition: Vector2 = Vector2(660, 450   )

func getRandomSpawnPosition() -> Vector2:
	var _viewport: Rect2 = get_viewport_rect()
	var _half = _viewport.size.y / 2
	_spawnPosition.x = _viewport.end.x + 150
	_spawnPosition.y = randf_range(_half + 240, _half -50)
	
	return(_spawnPosition)
	
func _on_spawn_timer_timeout() -> void:
	var _obs := OBSTACLE.instantiate()
	_obs.position = getRandomSpawnPosition()
	add_child(_obs)
