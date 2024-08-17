class_name Grid

static func quad(dims = 5, cell_size = 1.0, gap = 0.5, center = Vector3(0, 0, 0)):
	var grid = []
	var offset = (cell_size + gap) * (dims - 1) / 2
	
	var start = center - Vector3(offset, 0, offset)
	var pos = start
	for row in range(dims):
		for col in range(dims):
			grid.append(pos)
			pos.x += cell_size + gap
		pos.x = start.x
		pos.z += cell_size + gap
	return grid

static func quad_borders(dims = 5.0, cell_size = 1.0):
	var grid = [[], []]
	var offset = cell_size * (dims - 1) / 2
	var start = -Vector3(offset, 0, offset)
	var pos = start
	for row in range(dims):
		grid[0].append(pos)
		pos.z += cell_size
	pos = start
	for col in range(dims):
		grid[1].append(pos)
		pos.x += cell_size
	return grid

static func cube(dims = 20, cell_size = 1.0, center = Vector3(0, 0 ,0)):
	var grid = []
	var offset = cell_size * (dims - 1) / 2
	var start = center - Vector3(offset, offset, offset)
	var pos = start
	for layer in range(dims):
		for row in range(dims):
			for col in range(dims):
				grid.append(pos)
				pos.x += cell_size
			pos.x = start.x
			pos.z += cell_size
		pos.x = start.x
		pos.z = start.z
		pos.y += cell_size
	return grid


static func cube_edges(dims = 20, cell_size = 1.0, center = Vector3(0, 0, 0)):
	var grid = [[], [], []] # edges placed on x axis, z axis, y axis 
	var offset = cell_size * (dims - 1) / 2
	var start = center - Vector3(offset, offset, offset)
	var pos = start
	for layer in range(dims):
		for col in range(dims):
			grid[0].append(pos)
			pos.x += cell_size
		pos.x = start.x
		pos.y += cell_size
	
	pos = start
	for layer in range(dims):
		for row in range(dims):
			grid[1].append(pos)
			pos.z += cell_size
		pos.z = start.z
		pos.y += cell_size
	
	pos = start
	for row in range(dims):
		for col in range(dims):
			grid[2].append(pos)
			pos.x += cell_size
		pos.x = start.x
		pos.z += cell_size
	
	return grid


static func xytox(xy, dims):
	return xy.y * dims + xy.x

static func xtoxy(x, dims):
	return Vector2i(x % dims, x / dims)
