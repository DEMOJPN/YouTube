## katamari_selectcc_base.gd ##

# Node Structure:
#	- root
#	     - Pivot (Node3D or CSGSphere3D Scaled to 0.1 on XYZ, Rotated -90 degrees on Z)
#		     - CSGSphere3D (Position set to -10m on X)
#	     	     - Label3D (Text set to "^", font size 100 and Position set to -1 on X, Rotated 90 degrees on Y and -180 degrees on Z)
#	     - Camera3D (Set to Current)

extends Node3D

# Variables
@onready var camera: Camera3D = $Pivot/Camera3D
@onready var player_character: CSGSphere3D = $Pivot/CSGSphere3D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass



# 8 Direction Character Rotation
func setCharacterUp() -> void:
	player_character.rotation.x =  deg_to_rad(180.0)

func setCharacterDown() -> void:
	player_character.rotation.x = deg_to_rad(0.0)

func setCharacterLeft() -> void:
	player_character.rotation.x = deg_to_rad(90.0)

func setCharacterRight() -> void:
	player_character.rotation.x = deg_to_rad(-90.0)

func setCharacterUpLeft() -> void:
	player_character.rotation.x = deg_to_rad(135.0)

func setCharacterDownLeft() -> void:
	player_character.rotation.x = deg_to_rad(45.0)

func setCharacterUpRight() -> void:
	player_character.rotation.x = deg_to_rad(-135.0)

func setCharacterDownRight() -> void:
	player_character.rotation.x = deg_to_rad(-45.0)
