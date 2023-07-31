//xcategories_xcategory
$(document).on('turbolinks:load', function(){
  $(document).on('click', '.xroot-xcategories-load', function () {
    const xroot_id = $(this).attr('data-xroot-id')
    const current_url = window.location.pathname
    XrootXcategories(xroot_id, current_url)
  })

  function XrootXcategories(xroot_id, current_url) {
    if (current_url == `/xroots`) {
      url = current_url + `/${xroot_id}/xroot_xcategories`;
    }
    
    $.ajax({
      method: "GET",
      dataType: "script",
      url: url,
      cache: true
    })
  }
});