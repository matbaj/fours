#= require game
#= require glue
#= require gui
class App
	constructor: ->
		game = new Game()
		gui = new Gui()
		glue = new Glue(game,gui)
		window.game = game
		window.gui = gui
		game.start()

$ ->
	new App()