class @Glue
	constructor: (@game,@gui)->
		Before(@game, "new_game", => @gui.clean_circles())


		After(@game, "set_difficult", => alert("dupa"))
		After(@game, "start", => @game.new_game())
		After(@gui, "new_game", => @game.new_game())
		After(@game, "set_round", (color) => @gui.prepare_picker(color))
		After(@gui,	"selected_column", (col) => @game.selected_column(col))
		After(@game, "set_circle_position", (x,y) => @gui.set_circle_position(x,y))
		After(@game, "show_end", (result) => @gui.show_end(result))



		#LogAll(@game)
		#LogAll(@gui)