extends VehicleBody3D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var engine_power = 0
var brake_power = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	# self.steering = Input.get_axis("right", "left") * 0.4
	engine_power = 0
	brake_power = 0

	if Input.is_action_pressed("brake_hard"):
		brake_power = 0.8 
	elif Input.is_action_pressed("brake_soft"):
		brake_power = 0.2
	elif Input.is_action_pressed("engine_hard"):
		engine_power = 80
	elif Input.is_action_pressed("engine_soft"):
		engine_power = 20

	self.engine_force = engine_power
	self.brake = brake_power

func _input(event):
	if event.is_action_pressed("handle_right"):
		self.steering += 0.05
	if event.is_action_pressed("handle_left"):
		self.steering -= 0.05
