//xcategories_xcategory
$(document).on('turbolinks:load', 'click', '.xcategories-xcategory-link', function () {
  const xroot_id = $(this).attr('data-xroot-id')
  const current_url = window.location.pathname
  fetchXcategoriesXcategoryNodes(xroot_id, current_url)
})

function fetchXcategoriesXcategoryNodes(xroot_id, current_url) {
  if (current_url == `/xroots`) {
    alert('0');
    url = current_url + `/${xroot_id}/xcategories_xcategory`;
  }
  
  $.ajax({
    method: "GET",
    dataType: "script",
    url: url,
    success: function(data) {
      
    }
  })
}