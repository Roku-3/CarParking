extends Camera3D

var direction = Vector3.FORWARD
@onready var target: Object = $"../Car/BackCamera" 
@export var smooth_spd: float = 2.5
@export var slerp_spd: float = 0.05 

func _process(delta):
	self.global_position = lerp(self.global_position, target.global_position, smooth_spd*delta)
	var cam_quat = Quaternion(self.global_transform.basis)
	var target_quat = Quaternion(target.global_transform.basis)

	var result_quat = cam_quat.slerp(target_quat, slerp_spd)
	self.global_transform.basis = Basis(result_quat)
