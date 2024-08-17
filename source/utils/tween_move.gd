extends Control

@export var duration: float = 1
@export var pos: Vector4 = Vector4(0, 0, 10, 10)
@export var EASE = Tween.EASE_IN_OUT
@export var TRANS = Tween.TRANS_QUAD


func appear():
	visible = true
	var tween = get_tree().create_tween()
	position = Vector2(pos.x, pos.y)
	tween.tween_property(self, "position", Vector2(pos.z, pos.w),
		duration).set_trans(TRANS).set_ease(EASE)
	return tween.finished


func disappear():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", Vector2(pos.x, pos.y),
		duration).set_trans(TRANS).set_ease(EASE).finished.connect(
			func(): visible = false, CONNECT_ONE_SHOT
		)
	return tween.finished
