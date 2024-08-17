extends Node

signal setup_completed()
signal place_selected

var chat_focused: bool

func on_chat_focus_enter():
	chat_focused = true


func on_chat_focus_exit():
	chat_focused = false
