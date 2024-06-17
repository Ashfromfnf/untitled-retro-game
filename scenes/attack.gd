extends Node



func _physics_process(_delta):
	
	var parry = $"../../CanvasLayer/SubViewportContainer/SubViewport/Container/parry"
	var idle = $"../../CanvasLayer/SubViewportContainer/SubViewport/Container/idle"
	if Input.is_action_pressed("PARRY"):
		if parry.visible == false:
			parry.visible = true
		if idle.visible == true:
			idle.visible = false
	else:
		if parry.visible == !false:
			parry.visible = !true
		if idle.visible == !true:
			idle.visible = !false
