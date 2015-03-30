# There are two players always
# red and blue

class @Game

	arrayEqual = (a, b) ->
		a.length is b.length and a.every (elem, i) -> elem is b[i]	

	constructor: (params) ->
		@columns = []


	start: () ->


	set_round: (color) ->

	end_round: =>
		#console.log "End round player " + @player
		@swap_players() unless @check_end_game()



	check_end_game: ->
		end = @find_winner() or @full_columns()
		@show_end(end) if end
		return end

	show_end: (result) ->

	full_columns: =>
		return 3 if _.filter(@columns[x][4] for x in [0..6], (e) => e ==0).length == 0

	find_winner: =>
		#Vertical
		slices = _.flatten( ((@columns[x][y+k] for k in [0..3]) for x in [0..6] for y in [0..1]), true)
		return 1 if _.filter(slices, (slice) => return arrayEqual([1,1,1,1], slice)).length
		return 2 if _.filter(slices, (slice) => return arrayEqual([2,2,2,2], slice)).length
			
		#Horizontal
		slices = _.flatten( ((@columns[x+k][y] for k in [0..3]) for x in [0..3] for y in [0..1]), true)
		return 1 if  _.filter(slices, (slice) => return arrayEqual([1,1,1,1], slice)).length
		return 2 if _.filter(slices, (slice) => return arrayEqual([2,2,2,2], slice)).length

		#Diagonal
		slices = _.flatten( ((@columns[x+k][y+k] for k in [0..3]) for x in [0..3] for y in [0..1]), true)
		return 1 if _.filter(slices, (slice) => return arrayEqual([1,1,1,1], slice)).length		
		return 2 if _.filter(slices, (slice) => return arrayEqual([2,2,2,2], slice)).length

		#Diagonal
		slices = _.flatten( ((@columns[x+k][y-k] for k in [0..3]) for x in [0..3] for y in [3..4]), true)
		return 1 if _.filter(slices, (slice) => return arrayEqual([1,1,1,1], slice)).length			
		return 2 if _.filter(slices, (slice) => return arrayEqual([2,2,2,2], slice)).length

		return 0


	swap_players: =>
		if @player == 1
			@player = 2
			@set_round("blue")
		else
			@player = 1
			@set_round("red")		

	new_game: () =>
		for i in [0..6]
			@columns.push []
			for j in [0..4]
				@columns[i].push 0
		@player = 1	
		@set_round("red")

	selected_column: (col) =>
		if @columns[col][4] == 0
			i = 0
			i++ while @columns[col][i] != 0
			@columns[col][i] = @player
			@set_circle_position(col, i)
			@end_round()
		else
			alert "Column is full"

	set_circle_position: (x,y) ->


