extends Node3D
@onready var cam = get_node("usedCam")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	position = get_node("/root/Node3D/UCharacterBody3D").position
	rotation = get_node("/root/Node3D/UCharacterBody3D").rotation
