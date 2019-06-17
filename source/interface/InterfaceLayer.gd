extends CanvasLayer

func _ready():
	Score.connect("score_changed", self, "_on_Score_score_changed")


func _on_Score_score_changed(new_score):
	$ScoreLabel.text = "Score: %s"%new_score


func show_replay_menu():
	$ReplayMenu.show()
	$ReplayMenu/MarginContainer/VBoxContainer/RetryButton.grab_focus()


func _on_RetryButton_pressed():
	get_tree().reload_current_scene()
