extends Node2D

func _ready():
	Score.current = 0
	get_tree().connect("node_added", self, "_on_SceneTree_node_added")
	$Player.get_node("Health").connect("damaged", self, "create_pop_label", [$Player])
	$Player.get_node("HurtBox").connect("hurt", self, "_on_Player_hurt")


func _on_SceneTree_node_added(new_node):
	if new_node.has_node("Health"):
		new_node.get_node("Health").connect("damaged", self, "create_pop_label", [new_node])
		new_node.connect("tree_exited", self, "_on_Enemy_died", [new_node.get_node("Points").reward])
		new_node.get_node("HurtBox").connect("hurt", self, "_on_Enemy_hurt")
		new_node.get_node("Attack").connect("executed", self, "_on_Enemy_attack")


func create_pop_label(text, reference_node):
	$Interface.create_pop_label(text, reference_node.global_position)
	print(reference_node.global_position)


func _on_Enemy_died(reward):
	Score.current += reward
	$Camera2D.shake(1, 0.5)


func _on_Player_tree_exited():
	$InterfaceLayer.show_replay_menu()


func _on_Player_hurt():
	$CanvasModulate/AnimationPlayer.play("Blink")
#	$Camera2D.shake(0.5, 0.5)


func _on_Enemy_hurt():
	$Camera2D.shake(0.5)


func _on_Enemy_attack():
	$Camera2D.shake(0.5, 0.5)
