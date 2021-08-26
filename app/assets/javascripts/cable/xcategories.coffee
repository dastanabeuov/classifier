$(document).on "turbolinks:load", ->

  xcategoriesList = $(".xcategories-list")

  App.cable.subscriptions.create('XcategoriesChannel', {
    connected: ->
      console.log('Connected!')
      @perform('follow')
    ,
    received: (data) ->
      xcategoriesList.append(data)
  })