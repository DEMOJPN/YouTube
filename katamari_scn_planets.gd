## scn_planets.gd ##
extends Node3D


@onready var scn_player: Node3D = $scn_Player
@onready var planet_pivot: Node3D = $Planet_Pivot

var input = Vector2.ZERO
var speed : float = .015
var current_rotation = 0.0
var isChanging: bool = false


var home_command : bool = false
var bird_command : bool = false
@onready var label_3d_HOME: Label3D = $Planet_Pivot/Prince_Planet/pivot_house/Area3D/Label3D
@onready var label_3d_BIRD: Label3D = $Planet_Pivot/Prince_Planet/pivot_bird/bird/Area3D/Label3D



func _ready() -> void:
	pass

##  set player to default rotation so he doesn't spoawn in buildings when you change planets.
func _physics_process(_delta: float) -> void:
	input = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	update_character_position()
	
func _input(_event: InputEvent) -> void:

	if Input.is_action_just_pressed("change_planet") and !isChanging:
		isChanging = true
		current_rotation = current_rotation + 90.0
		var change_planet_tween = get_tree().create_tween()
		change_planet_tween.tween_property(planet_pivot, "rotation_degrees", Vector3(0.0, current_rotation, 0.0), 2.0)
		await change_planet_tween.finished
		isChanging = false

	if Input.is_action_just_pressed("int") and home_command:
		label_3d_HOME.text = "chicken" 
	pass

	if Input.is_action_just_pressed("int") and bird_command:
		label_3d_BIRD.text = "chicken" 

	if Input.is_action_just_pressed("jump") and !isChanging:
		scn_player.jump()


func update_character_position():
	# Right
	if input == Vector2(1,0):
		scn_player.setCharacterRight()
		scn_player.transform = scn_player.transform.rotated_local(Vector3(1.0, 0.0, 0.0).normalized(), speed)
	
	# Left
	if input == Vector2(-1,0):
		scn_player.setCharacterLeft()
		scn_player.transform = scn_player.transform.rotated_local(Vector3(-1.0, 0.0, 0.0).normalized(), speed)
	
	# Down
	if input == Vector2(0,1):
		scn_player.setCharacterDown()
		scn_player.transform = scn_player.transform.rotated_local(Vector3(0.0, 0.0, 1.0).normalized(), speed)
	
	# Up
	if input == Vector2(0,-1):
		scn_player.setCharacterUp()
		scn_player.transform = scn_player.transform.rotated_local(Vector3(0.0, 0.0, -1.0).normalized(),  speed)


	# Up and Right
	if input.x <= 0.8  and input.x >= 0.7 and input.y >= -0.8 and input.y <= -0.7:
		scn_player.setCharacterUpRight()
		scn_player.transform = scn_player.transform.rotated_local(Vector3(1.0, 0.0, -1.0).normalized(),  speed)
	
	# Up and Left
	if input.x >= -0.8  and input.x <= -0.7 and input.y >= -0.8 and input.y <= -0.7:
		scn_player.setCharacterUpLeft()
		scn_player.transform = scn_player.transform.rotated_local(Vector3(-1.0, 0.0, -1.0).normalized(),  speed)
	
	# Down and Right
	if input.x <= 0.8  and input.x >= 0.7 and input.y <= 0.8 and input.y >= 0.7:
		scn_player.setCharacterDownRight()
		scn_player.transform = scn_player.transform.rotated_local(Vector3(1.0, 0.0, 1.0).normalized(),  speed)
	
	# Down and Left
	if input.x >= -0.8  and input.x <= -0.7 and input.y <= 0.8 and input.y >= 0.7:
		scn_player.setCharacterDownLeft()
		scn_player.transform = scn_player.transform.rotated_local(Vector3(-1.0, 0.0, 1.0).normalized(),  speed)


	if input == Vector2(0,0):
		scn_player.setCharacterIdle()


func _on_v_slider_value_changed(value: float) -> void:
	scn_player.changeGroundLevel(value)


##BIRD
func _on_area_3d_body_entered(body: Node3D) -> void:
	bird_command = true
	label_3d_BIRD.visible = true

func _on_area_3d_body_exited(body: Node3D) -> void:
	bird_command = false
	label_3d_BIRD.visible = false
	label_3d_BIRD.text = "bird" 

##HOME
func _on_area_3d_body_home_entered(body: Node3D) -> void:
	home_command = true
	label_3d_HOME.visible = true


func _on_area_3d_body_home_exited(body: Node3D) -> void:
	home_command = false
	label_3d_HOME.visible = false
	label_3d_HOME.text = "bird" 
