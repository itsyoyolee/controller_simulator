extends Node2D
const GRAVITY_VEC = Vector2(0, 900)
const FLOOR_NORMAL = Vector2(0, -1)
const SLOPE_SLIDE_STOP = 0.0
const MIN_ONAIR_TIME = 0.1
const WALK_SPEED = 200 # pixels/sec
const JUMP_SPEED = 300
const SIDING_CHANGE_SPEED = 10

var linear_vel = Vector2()
var onair_time = 0 #
var on_floor = false
var anim
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	Move(delta)
	Anim(delta)
	pass

func Move(var delta):
	onair_time += delta

	### MOVEMENT ###

	# Apply Gravity
	linear_vel += delta * GRAVITY_VEC
	# Move and Slide
	linear_vel = $body.move_and_slide(linear_vel, FLOOR_NORMAL, SLOPE_SLIDE_STOP)
	# Detect Floor
	if $body.is_on_floor():
		onair_time = 0

	on_floor = onair_time < MIN_ONAIR_TIME

	### CONTROL ###

	# Horizontal Movement
	var target_speed = 0
	if Input.is_action_pressed("ui_left"):
		target_speed += -1
	if Input.is_action_pressed("ui_right"):
		target_speed +=  1

	target_speed *= WALK_SPEED
	linear_vel.x = lerp(linear_vel.x, target_speed, 0.1)

	# Jumping
	if on_floor and Input.is_action_just_pressed("ui_up"):
		linear_vel.y = -JUMP_SPEED
	pass
	
#得到 蘑菇頭的方向 並判斷使用者的輸入 並回傳結果
func Catch(var dir):
	print(dir)
	if(Input.is_action_pressed("ui_select")):
		if(Input.is_action_pressed(dir)):
			return true
			print("878")
		else:
			return false	
	pass
	
func Anim(var delta):
	var new_anim = "idle"

	if on_floor:
		if linear_vel.x < -SIDING_CHANGE_SPEED:
			$body/Sprite.scale.x = 1
			new_anim = "walk"

		if linear_vel.x > SIDING_CHANGE_SPEED:
			$body/Sprite.scale.x = -1
			new_anim = "walk"
	else:
		# We want the character to immediately change facing side when the player
		# tries to change direction, during air control.
		# This allows for example the player to shoot quickly left then right.
		if Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
			$body/Sprite.scale.x = 1
		if Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):
			$body/Sprite.scale.x = -1

		if linear_vel.y < 0:
			new_anim = "jump"
		else:
			new_anim = "walk"
	if new_anim != anim:
		anim = new_anim
		$body/Anim.play(anim)