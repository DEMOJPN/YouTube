## katamari_selectcc_base.gd ##

# Node Structure:
#	- root
#	  - CSGSphere3D (Position: .0.4, 1, 0 // Rotation: 0, 0, -90 // Scale 0.1, 0.1, 0.1)
#	    - Label3D (Text: ^ // Font Siz: 100 // Position: -1, 0, 0 // Rotation: 0, -90, -180)
#     - Camera3D (Position: 0, 2, 0 // Rotation: -90, -90, 0)

extends Node3D


# Variables
@onready var camera: Camera3D = $Camera3D
@onready var player_character: CSGSphere3D = $CSGSphere3D
@onready var pivot: Node3D = $"."

var input = Vector2.ZERO
var speed : float = 0.005


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	input = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	update_character_position()


# Rotates the character around a center pivot.
func update_character_position():
	# Right
	if input == Vector2(1,0):
		setCharacterRight()
		pivot.transform = pivot.transform.rotated_local(Vector3(1.0, 0.0, 0.0).normalized(), speed)
	
	# Left
	if input == Vector2(-1,0):
		setCharacterLeft()
		pivot.transform = pivot.transform.rotated_local(Vector3(-1.0, 0.0, 0.0).normalized(), speed)
	
	# Down
	if input == Vector2(0,1):
		setCharacterDown()
		pivot.transform = pivot.transform.rotated_local(Vector3(0.0, 0.0, 1.0).normalized(), speed)
	
	# Up
	if input == Vector2(0,-1):
		setCharacterUp()
		pivot.transform = pivot.transform.rotated_local(Vector3(0.0, 0.0, -1.0).normalized(), speed)

	# Up and Right
	if input.x <= 0.8  and input.x >= 0.7 and input.y >= -0.8 and input.y <= -0.7:
		setCharacterUpRight()
		pivot.transform = pivot.transform.rotated_local(Vector3(1.0, 0.0, -1.0).normalized(), speed)
	
	# Up and Left
	if input.x >= -0.8  and input.x <= -0.7 and input.y >= -0.8 and input.y <= -0.7:
		setCharacterUpLeft()
		pivot.transform = pivot.transform.rotated_local(Vector3(-1.0, 0.0, -1.0).normalized(), speed)
	
	# Down and Right
	if input.x <= 0.8  and input.x >= 0.7 and input.y <= 0.8 and input.y >= 0.7:
		setCharacterDownRight()
		pivot.transform = pivot.transform.rotated_local(Vector3(1.0, 0.0, 1.0).normalized(), speed)
	
	# Down and Left
	if input.x >= -0.8  and input.x <= -0.7 and input.y <= 0.8 and input.y >= 0.7:
		setCharacterDownLeft()
		pivot.transform = pivot.transform.rotated_local(Vector3(-1.0, 0.0, 1.0).normalized(), speed)

	# Placeholder for animation
	if input == Vector2(0,0):
		pass


# 8 Direction Character Rotation
func setCharacterUp() -> void:
	player_character.rotation.y =  deg_to_rad(180.0)

func setCharacterDown() -> void:
	player_character.rotation.y = deg_to_rad(0.0)

func setCharacterLeft() -> void:
	player_character.rotation.y = deg_to_rad(-90.0)

func setCharacterRight() -> void:
	player_character.rotation.y = deg_to_rad(90.0)

func setCharacterUpLeft() -> void:
	player_character.rotation.y = deg_to_rad(-135.0)

func setCharacterDownLeft() -> void:
	player_character.rotation.y = deg_to_rad(-45.0)

func setCharacterUpRight() -> void:
	player_character.rotation.y = deg_to_rad(135.0)

func setCharacterDownRight() -> void:
	player_character.rotation.y = deg_to_rad(45.0)
