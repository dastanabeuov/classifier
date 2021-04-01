document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.form-inline-link')
  if (control) {
    control.addEventListener('click', formInlineLinkHandler)
  }
})

function formInlineLinkHandler(event) {
  event.preventDefault()

  var resourceId = this.dataset.resourceId
  formInlineHandler(resourceId)
}

function formInlineHandler(resourceId) {
  var cardBlock = document.querySelector('.card-block[data-resource-id="' + resourceId + '"]')
  var formInline = document.querySelector('.form-inline[data-resource-id="' + resourceId + '"]')
  //var link = document.querySelector('.form-inline-link[data-resource-id"' + resourceId + '"]')

  if (formInline.classList.contains('hidden')) {
    cardBlock.classList.add('hidden')
    formInline.classList.remove('hidden')
    //link.value = I18n.t('.cancel')
  } else {
    cardBlock.classList.remove('hidden')
    formInline.classList.add('hidden')
    //link.value = I18n.t('.edit')
  }
}