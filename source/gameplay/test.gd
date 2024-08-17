extends Node

@export var grid_node: Node3D
@export var camera: Camera3D

@export var dims = 20
@export var cell_size = 1
@export var camera_distance = 30

@export var cube_face_mat: ShaderMaterial

var edge_scene = preload("res://source/gameplay/edge.tscn")
var grid


func _ready():
	var grid_mesh = ArrayMesh.new()
	grid_node.mesh = grid_mesh
	
	var arrays = []
	arrays.resize(Mesh.ARRAY_MAX)
	var vertices = PackedVector3Array()
	
	var length = (dims - 1) * cell_size
	var gen_edge = func(start, end): 
		vertices.push_back(start)
		vertices.push_back(end)
		print("start %s end %s" % [start, end])
	
	grid = Grid.quad_borders(dims, cell_size)
	var up = Vector3.UP * length
	for pos in grid[0]:
		gen_edge.call(pos, pos + Vector3.RIGHT * length)
		gen_edge.call(pos + up, pos + up + Vector3.RIGHT * length)
	
	for pos in grid[1]:
		gen_edge.call(pos, pos + Vector3.BACK * length)
		gen_edge.call(pos + up, pos + up + Vector3.BACK * length)

	arrays[Mesh.ARRAY_VERTEX] = vertices
	grid_mesh.add_surface_from_arrays(Mesh.PRIMITIVE_LINES, arrays)
	
	for i in range(5):
		var p1 = generate_player()
		p1.translate(Vector3.UP * i * cell_size)
		p1.rotate_y(PI / 2 * i)
	


func generate_player():
	var player = MeshInstance3D.new()
	player.name = "Player test"
	add_child(player)

	var player_mesh = ArrayMesh.new()
	player.mesh = player_mesh
	
	var d = cell_size / 2
	var add_face = func(v: Array):
		var arrays = []
		arrays.resize(Mesh.ARRAY_MAX)
		var vertices = PackedVector3Array(v)
		arrays[Mesh.ARRAY_VERTEX] = vertices
		
		player_mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays)
	
	#top
	var rtf = Vector3( d, d * 2, d)
	var ltf = Vector3(-d, d * 2,  d)
	var rtb = Vector3( d, d * 2, -d)
	var ltb = Vector3(-d, d * 2, -d)
	add_face.call([
		ltf, rtb, rtf,
		rtb, ltf, ltb
	])
	
	#bottom
	var rdf = Vector3( d, 0, d)
	var ldf = Vector3(-d, 0,  d)
	var rdb = Vector3( d, 0, -d)
	var ldb = Vector3(-d, 0, -d)
	add_face.call([
		rdb, ldf, rdf,
		ldf, rdb, ldb
	])
	
	add_face.call([
		rdf, ltf, rtf,
		ltf, rdf, ldf
	])
	add_face.call([
		rtb, rdf, rtf,
		rdf, rtb, rdb
	])
	
	add_face.call([
		ltb, ldf, ldb,
		ldf, ltb, ltf
	])
	add_face.call([
		rdb, ltb, ldb,
		ltb, rdb, rtb
	])
	
	var m = [0, 0, 0, 0, 0, 0]
	var colors = [Color.WHITE, Color.BLACK, Color.GREEN, Color.RED, Color.YELLOW, Color.BLUE]
	for i in range(6):
		m[i] = cube_face_mat.duplicate() as ShaderMaterial
		m[i].set_shader_parameter("color", colors[i])
		player_mesh.surface_set_material(i, m[i])
	return player
