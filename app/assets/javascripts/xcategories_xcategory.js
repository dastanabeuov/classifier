//xcategories_xcategory
$(document).on('click', '.xcategories-xcategory-load', function () {
  const xroot_id = $(this).attr('data-xroot-id')
  const current_url = window.location.pathname
  fetchXcategoriesXcategoryNodes(xroot_id, current_url)
})

function fetchXcategoriesXcategoryNodes(xroot_id, current_url) {
  if (current_url == `/xroots`) {
    url = current_url + `/${xroot_id}/xcategories_xcategory`;
  }
  
  $.ajax({
    method: "GET",
    dataType: "script",
    url: url,
    cache: false,
    success: function(data) {
    },
    error: function (xhr, ajaxOptions, thrownError) {
      alert("XHR:"+xhr.status+"Error:"+thrownError);
    }
  })
}