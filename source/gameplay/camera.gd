extends Camera3D

@export var speed = 10
@export var rotation_speed = 1
@export var local_mode = true

var rot_x = 0
var rot_y = 0

func _process(delta):
	if Input.is_action_pressed("camera_forward"):
		if projection == PROJECTION_ORTHOGONAL:
			size -= speed * delta
		else: 
			if local_mode: translate(Vector3.FORWARD * speed * delta)
			else: position += Vector3.FORWARD * speed * delta
	if Input.is_action_pressed("camera_backward"):
		if projection == PROJECTION_ORTHOGONAL:
			size += speed * delta
		else: 
			if local_mode: translate(Vector3.BACK * speed * delta)
			else: position += Vector3.BACK * speed * delta
	if Input.is_action_pressed("camera_left"):
		if local_mode: translate(Vector3.LEFT * speed * delta)
		else: position += Vector3.LEFT * speed * delta
	if Input.is_action_pressed("camera_right"):
		if local_mode: translate(Vector3.RIGHT * speed * delta)
		else: position += Vector3.RIGHT * speed * delta
	if Input.is_action_pressed("camera_up"):
		if local_mode: translate(Vector3.UP * speed * delta)
		else: position += Vector3.UP * speed * delta
	if Input.is_action_pressed("camera_down"):
		if local_mode: translate(Vector3.DOWN * speed * delta)
		else: position += Vector3.DOWN * speed * delta
	
	var rotated = false
	if Input.is_action_pressed("camera_rotate_left"):
		rot_y += rotation_speed * delta
		rotated = true
	if Input.is_action_pressed("camera_rotate_right"):
		rot_y -= rotation_speed * delta
		rotated = true
	if Input.is_action_pressed("camera_rotate_up"):
		rot_x += rotation_speed * delta
		rotated = true
	if Input.is_action_pressed("camera_rotate_down"):
		rot_x -= rotation_speed * delta
		rotated = true
	
	if rotated:
		transform.basis = Basis()
		rotate_x(rot_x)
		rotate_y(rot_y)

