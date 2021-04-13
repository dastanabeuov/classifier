$(document).on "turbolinks:load", ->

  xrootsList = $(".xroots-list")

  App.cable.subscriptions.create('XrootsChannel', {
    connected: ->
      console.log 'Connected!'
      @perform 'follow'
    ,
    received: (data) ->
      xrootsList.append data
  })