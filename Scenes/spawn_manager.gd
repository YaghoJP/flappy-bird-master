extends Node2D
class_name SpawnManger

const OBSTACLE = preload("res://Obstacle/obstacle.tscn")

@export_category('Objects')
@export var _timer: Timer
@export var _spawnPosition: Vector2 = Vector2(660, 450   )

var auxTimer: bool = false
func _ready() -> void:
	_stopObstacles()

func startTimer() -> void:
	if !auxTimer:
		auxTimer = true
		_timer.start()

func getRandomSpawnPosition() -> Vector2:
	var _viewport: Rect2 = get_viewport_rect()
	var _half = _viewport.size.y / 2
	_spawnPosition.x = _viewport.end.x + 150
	_spawnPosition.y = randf_range(_half + 240, _half -50)
	
	return(_spawnPosition)
	
func _on_spawn_timer_timeout() -> void:
	var _obs := OBSTACLE.instantiate()
	_obs.position = getRandomSpawnPosition()
	_obs.onPlaneCrashed.connect(_onPlaneCrashed)
	
	add_child(_obs)

func _onPlaneCrashed(plane: Player) ->void:
	plane.isDead = true
	_stopObstacles()
	
func _stopObstacles() -> void:
	
	var _children := get_children()
	_timer.stop()
	for child in _children:
		if child is Obstacle:
			child.canMove = false


func _on_plane_manager_on_obstacles_start() -> void:
	startTimer()
