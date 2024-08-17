class_name Utilities

static func save_scene(node: Node, save_path: String):
	var scene = PackedScene.new()
	var result = scene.pack(node)
	if result == OK:
		save_path =  save_path % "%s%s" % [node.name.to_snake_case(), ".tscn"]
		var error = ResourceSaver.save(scene, 
				save_path)
		if error != OK:
			push_error("error saving scene ", save_path, " ", error)
