class @Gui
  constructor: ->
    $(".new_game").on("click", (e) => @new_game())
    $(".player_type_human").on("click", (e) => @set_player_type("Human"))
    $(".player_type_cpu").on("click", (e) => @set_player_type("CPU"))
    $(".difficult_easy").on("click", (e) => @set_difficult("Easy"))
    $(".difficult_medium").on("click", (e) => @set_difficult("Medium"))
    $(".difficult_hard").on("click", (e) => @set_difficult("Hard"))

  set_player_type: (type_name) ->
    $(".player_type").html(type_name)

  set_difficult: (difficult_name) ->
    $(".difficult").html(difficult_name) 
  new_game: ->

  createElementFor: (templateId, data) =>
    source = $(templateId).html()
    template = Handlebars.compile(source)
    html = template(data)
    element = $(html)
  

  clean_circles: =>
    $(".circle").remove()

  prepare_picker: (color) =>
    element = @createElementFor("#picker-template", {color : color})
    $(".col_picker").append(element)
    @setFollowMouse()



  setFollowMouse: =>
    col_picker = $('.col_picker');
    offset = col_picker.offset();
    offsetWidth = offset.left + col_picker.width();
    offsetHeight = offset.top + col_picker.height();
    circle = $('.picker');
    col_picker.on('mousemove',  (e) =>
      if e.pageX >= offset.left and e.pageY >= offset.top and e.pageX <= offsetWidth and e.pageY <= offsetHeight
        circle.css("left", e.pageX)
        circle.css("top", e.pageY-circle.height()/2)
    )
    circle.on('click', (e) =>
      @select_column(circle, e.pageX)
    )
  

  select_column: (circle, pos_x) ->
    col = Math.round((pos_x-150)/82)
    @selected_column(col)
    

  selected_column: (col) ->

  set_circle_position: (x,y) ->
    col_picker = $('.col_picker');
    circle = $('.picker');
    pos_x = 148+x*82
    pos_y = 569-y*82
    col_picker.off('mousemove')
    circle.off("click")
    circle.removeClass("picker")
    circle.animate({ left:pos_x, top:pos_y}, 500)

  show_end: (result) ->
    switch result
      when 3
        alert("no space")
      when 2
        alert("blue wins")
      when 1
        alert("red wins")





