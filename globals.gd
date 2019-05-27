extends Node

const GAMES_LIST = ["Getting Over It", "I Wanna Be The Boshy", "Overwatch", "Mario Maker",
	"Baldi's Basics in Education and Learning"]
var correct_game
var intro_finished = false
var boss_intro_finished = false
var boss_head_health = 25
var boss_middle_health = 25
var phase = 0
var won = false
var TC_position
var enemies_killed = 0
var bat1_health = 15
var bat2_health = 15

#func _input(event):
#	if event.is_action("ui_up"):
#		get_tree().quit()