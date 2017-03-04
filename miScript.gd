extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var posicion

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	#posicion = get_pos()
	posicion = get_node("Diego").get_pos()
	set_process(true)
	pass

func _process(delta):
	if(Input.is_key_pressed(KEY_LEFT)):
		posicion.x -= 10
	if(Input.is_key_pressed(KEY_RIGHT)):
		posicion.x += 10
	if(Input.is_key_pressed(KEY_UP) && posicion.y > 246): #Arriba es hacia abajo
		posicion.y -= 3
	if(Input.is_key_pressed(KEY_DOWN) && posicion.y < 462):
		posicion.y += 3
	get_node("Diego").set_pos(posicion)
	zoom()
	
func zoom():
	var escala=0.0066*posicion.y - 1.06637
	var vect = Vector2(escala,escala)
	get_node("Diego").set_scale(vect)