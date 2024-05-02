extends CharacterBody2D

@onready var MAX_SPEED = 300
@onready var ACCELERATION = 100
@onready var bullet_spawn = $BulletSpawn
@export var bullet_prefab: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func spin_base_on_mouse_position():
	look_at(get_global_mouse_position())

func shoot_bullet():
	var bullet = bullet_prefab.instantiate()
	get_tree().current_scene.add_child(bullet)
	bullet.transform = bullet_spawn.global_transform
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	var input_vector = Vector2(x, y)
	velocity = velocity.move_toward(input_vector.normalized() * MAX_SPEED, ACCELERATION )
	spin_base_on_mouse_position()
	move_and_slide()
	
func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot_bullet()
