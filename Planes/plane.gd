extends CharacterBody2D
class_name Player

@export_category('Variables')
@export var _gravity: float = 1000.0
@export var _jumpForce: float = -400.0
@export var _maxSpeed: float = 400.0
@export var _rotationSpeed: float = 2
@export var isDead: bool = false

func _physics_process(_delta: float) -> void:
	
	#Executando o pulo
	if Input.is_action_just_pressed("jump"):
		if isDead:
			return
		velocity.y = _jumpForce
		rotation = deg_to_rad(-30)
		
	#Calculando a velocidade do Plane
	velocity.y += _delta * _gravity
	velocity.y = min(velocity.y, _maxSpeed)
	
	#Fazendo a rotação e movendo o personagem.
	rotatePlayer(_delta)
	move_and_slide()
	
func rotatePlayer(_delta: float) -> void:
	if velocity.y > 0 and rotation < deg_to_rad(90):
		rotation += _rotationSpeed * _delta
