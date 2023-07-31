//xcategory_xclasses
$(document).on('turbolinks:load', function(){
  $(document).on('click', '.xcategory-xclasses-load', function () {
    const xroot_id = $(this).attr('data-xroot-id')
    const xcategory_id = $(this).attr('data-xcategory-id')
    const current_url = window.location.pathname
    XcategoryXclasses(xroot_id, xcategory_id, current_url)
  })

  function XcategoryXclasses(xroot_id, xcategory_id, current_url) {
    if (current_url == `/xroots`) {
      url = current_url + `/${xroot_id}/xcategories/${xcategory_id}/xcategory_xclasses`

    } else if (current_url == `/xroots/${xroot_id}`) {
      url = current_url + `/xcategories/${xcategory_id}/xcategory_xclasses`;

    } else if (current_url == `/xroots/${xroot_id}/xcategories/${xcategory_id}`) {
      url = current_url + `/xcategory_xclasses`
    
    } else {
      url = `/xroots/${xroot_id}/xcategories/${xcategory_id}/xcategory_xclasses`;
    }

    $.ajax({
      method: "GET",
      dataType: "script",
      url: url,
      cache: true
    })
  }
});