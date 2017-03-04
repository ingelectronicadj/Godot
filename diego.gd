
extends Sprite

# member variables here, example:
# var a=2
# var b="textvar"
export var debug = false #La palabara reservada export permite modificar la variable desde Inspector
const platilla_de_texto = "Debug = %s" # %s será reemplazado por un string

func _ready():
	set_process_input(true) #Le decimos al nodo que excuche entradas
	actualiza_debug_label() #Imprimimos el valor inicial en label
	pass
	
func _input(event):
	if(event.is_action_pressed("conmutar_debug")):
		debug = !debug
		actualiza_debug_label()
		update() #Este es un método de godot, debe llamarse para que los cambios en _draw() tomen efecto

func _draw():
	if(debug):
		self.draw_rect(self.get_item_rect(),Color(1,0,0,0.5))

func actualiza_debug_label():
	var texto_a_imprimir = platilla_de_texto %debug
	get_parent().get_node("debug_label").set_text(texto_a_imprimir)