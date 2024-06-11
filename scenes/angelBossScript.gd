extends CharacterBody3D


const SPEED = 2.5
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func cry():
	print("you cried")

func _physics_process(delta):


	var plr = get_node("../Player")
	var direction = (plr.position - position).normalized()
	
	if position.distance_to(plr.position) > 5:
		direction.x = 0
		direction.y = 0
	
	if position.distance_to(plr.position) > 1:
		look_at(plr.position)
	
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		cry()


	move_and_slide()
