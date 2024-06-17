extends CharacterBody3D


var SPEED = 2.5
const JUMP_VELOCITY = 4.5

var shooting = false
var redScreen = false
var bossDead = false
var ascendingTime = false


@onready var redScreenObj = get_node("../CanvasLayer/SubViewportContainer/SubViewport/cam/usedHead/usedCam/RedScreen")
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
	
	if position.distance_to(plr.position) > 1 and ascendingTime == false:
		look_at(plr.position)
	else:
		if shooting == false:
			shootLaser()
	
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		
	if ascendingTime == true:
		velocity.y = 1
		
	else:
		cry()



	if Input.is_action_just_pressed("PARRY"):
		if redScreen == true:
			hitBoss()

	move_and_slide()
	
	
	
	
	
	
	
func shootLaser():
	shooting = true
	SPEED = 0
	$Node3D/Model/Node/sphere/lasereye.visible = true
	await get_tree().create_timer(3.5).timeout
	laser()
	
func laser():
	print("shoot")
	redScreen = true
	redScreenObj.visible = true
	await get_tree().create_timer(1.5).timeout
	redScreenObj.visible = false
	if redScreen == true and bossDead == false:
		redScreen = false
		SPEED = 2.5
		shooting = false
	
	
func hitBoss():
	bossDead = true
	redScreen = false
	
	ascendingTime = true
