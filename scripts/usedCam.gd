extends Node3D
@onready var cam = get_node("usedHead/usedCam")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	position = get_node("/root/Node3D/Player").position
	rotation = get_node("/root/Node3D/Player").rotation
