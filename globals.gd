extends Node

const GAMES_LIST = ["Getting Over It", "I Wanna Be The Boshy", "Overwatch", "Mario Maker",
	"Baldi"]
var correct_game
var intro_finished = false
var boss_intro_finished = false
var boss_head_health = BOSS_HEAD_HEALTH
var boss_middle_health = BOSS_MIDDLE_HEALTH
const BOSS_HEAD_HEALTH = 50
const BOSS_MIDDLE_HEALTH = 25
var phase = 0
var won = false
var TC_position
var enemies_killed = 0
const  BAT_HEALTH = 30
var bat1_health = BAT_HEALTH
var bat2_health = 15

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		if OS.window_fullscreen:
			OS.window_fullscreen = !OS.window_fullscreen