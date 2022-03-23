extends "res://Characters/TemplatedCharacter.gd"

const FOV_TOLERANCE = 110
const MAX_DETECTION_RANGE = 570

const RED = Color(1,.25,.25)
const WHITE = Color (1,1,1)


var Player

func _ready():
	Player = get_node("/root").find_node("Player", true, false)
	

func _process(delta):
	if Player_in_FOV() and Player_in_LOS():
		$Flashlight.color = RED
		get_tree().call_group("SuspicionMeter", "player_seen")
	else:
		$Flashlight.color = WHITE

func Player_in_FOV():
	var npc_facing_direction = Vector2(1,0).rotated(global_rotation)
	var direction_to_Player = (Player.position - global_position).normalized()
	
	
	if abs(direction_to_Player.angle_to(npc_facing_direction)) < deg2rad(FOV_TOLERANCE):
		return true
	
	else:
		return false

func Player_in_LOS():
	var space = get_world_2d().direct_space_state
	var LOS_obstacle = space.intersect_ray(global_position, Player.global_position, [self], collision_mask) 
	
	if not LOS_obstacle:
		return false
	
	var distance_to_player = Player.global_position.distance_to(global_position)
	var Player_in_Range = distance_to_player < MAX_DETECTION_RANGE
	
	if LOS_obstacle.collider == Player and Player_in_Range:
		return true
	else:
		return false
		

