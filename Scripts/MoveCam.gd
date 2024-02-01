extends Camera2D

@export var ViewSensitivity:float = 1
@export var MoveAround:bool = true
var OldMousePosition:Vector2 = Vector2(0,0)
var vP
# Called when the node enters the scene tree for the first time.
func _ready():
	vP = get_viewport()
	OldMousePosition = vP.get_mouse_position()
func GetAxis(CA,CB):
	return 1 if CA else (-1 if CB else 0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if MoveAround:
		var Mod = delta*16
		var LR = GetAxis(Input.is_action_pressed('CamRight'),Input.is_action_pressed('CamLeft'))*Mod
		var UD = -GetAxis(Input.is_action_pressed('CamUp'),Input.is_action_pressed('CamDown'))*Mod
		self.position += Vector2(LR,UD) * ViewSensitivity
