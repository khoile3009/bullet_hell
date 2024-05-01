extends CharacterBody2D

@onready var MAX_SPEED = 300
@onready var ACCELERATION = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func spin_base_on_mouse_position():
	print(get_global_mouse_position())
	look_at(get_global_mouse_position())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	var input_vector = Vector2(x, y)
	velocity = velocity.move_toward(input_vector.normalized() * MAX_SPEED, ACCELERATION )
	spin_base_on_mouse_position()
	move_and_slide()
