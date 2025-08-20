extends Sprite2D

var anim_player: AnimationPlayer

func _ready() -> void:
	anim_player = $AnimationPlayer

func _process(delta: float) -> void:
	if !anim_player.is_playing():
		self.visible = false

func swing_sword() -> void:
	self.visible = true
	$AnimationPlayer.play("swing_left")
