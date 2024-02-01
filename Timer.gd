extends PanelContainer

@onready var Min1p = $"TextEdit/MinControl/+1"
@onready var Min1n = $"TextEdit/MinControl/-1"
@onready var Min10p = $"TextEdit/MinControl/+10"
@onready var Min10n = $"TextEdit/MinControl/-10"

@onready var Sec1p = $"TextEdit/SecControl/+1"
@onready var Sec1n = $"TextEdit/SecControl/-1"
@onready var Sec10p = $"TextEdit/SecControl/+10"
@onready var Sec10n = $"TextEdit/SecControl/-10"

@onready var start = $TextEdit/Start
@onready var stop = $TextEdit/Stop

@onready var min_counter = $TextEdit/MinCounter
@onready var sec_counter = $TextEdit/SecCounter

@onready var timer = $Timer

func _ready():
	timer.wait_time = 0.1

func _on_start_pressed():
	sec_counter.text = str(int(timer.wait_time) % 60)
	min_counter.text = str(floor(timer.wait_time / 60))
	timer.start()

func _on_stop_pressed():
	timer.stop()
	updateCounterInit()

func updateCounterInit():
	sec_counter.text = str(int(timer.wait_time) % 60)
	min_counter.text = str(floor(timer.wait_time / 60))
	
func updateCounterLeft():
	sec_counter.text = str(int(timer.time_left) % 60)
	min_counter.text = str(floor(timer.time_left / 60))
	
func _on_clock_timeout():
	if !timer.is_stopped():
		updateCounterLeft()

func _on_Min1p_pressed():
	if timer.is_stopped():
		timer.wait_time += 1 * 60
		updateCounterInit()

func _on_Min1n_pressed():
	if timer.is_stopped():
		timer.wait_time -= 1 * 60
		updateCounterInit()


func _on_Min10p_pressed():
	if timer.is_stopped():
		timer.wait_time += 10 * 60
		updateCounterInit()


func _on_Min10n_pressed():
	if timer.is_stopped():
		timer.wait_time -= 10 * 60
		updateCounterInit()


func _on_sec1p_pressed():
	if timer.is_stopped():
		timer.wait_time += 1
		updateCounterInit()
		
func _on_sec1n_pressed():
	if timer.is_stopped():
		timer.wait_time -= 1
		updateCounterInit()

func _on_sec10p_pressed():
	if timer.is_stopped():
		timer.wait_time += 10
		updateCounterInit()

func _on_sec10n_pressed():
	if timer.is_stopped():
		timer.wait_time -= 10
		updateCounterInit()

func _on_timer_timeout():
	pass
