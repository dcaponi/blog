App.comments = App.cable.subscriptions.create "CommentsChannel",
  connected: ->

  disconnected: ->

  received: (data) ->
    $("#messages").prepend(data)
