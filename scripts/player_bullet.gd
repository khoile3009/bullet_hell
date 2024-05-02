extends Node2D

class_name PlayerBullet

var damage = 5
var speed = 1000
# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(2.0).timeout
	queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position += transform.x * speed * delta


func _on_area_2d_body_entered(body: Node2D):
	if body.has_method("reduce_health"):
		body.reduce_health(damage)
	queue_free()# Replace with function body.
