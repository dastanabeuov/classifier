//xcategories_sub_xclasses
$(document).on('click', '.xcategories-sub-xclasses-load', function () {
  const xroot_id = $(this).attr('data-xroot-id')
  const xcategory_id = $(this).attr('data-xcategory-id')
  const current_url = window.location.pathname
  fetchXcategoriesSubXclassesNodes(xroot_id, xcategory_id, current_url)
})

function fetchXcategoriesSubXclassesNodes(xroot_id, xcategory_id, current_url) {
  if (current_url == `/xroots`) {
    url = current_url + `/${xroot_id}/xcategories/${xcategory_id}/xcategories_sub_xclasses`

  } else if (current_url == `/xroots/${xroot_id}`) {
    url = current_url + `/xcategories/${xcategory_id}/xcategories_sub_xclasses`;

  } else if (current_url == `/xroots/${xroot_id}/xcategories/${xcategory_id}`) {
    url = current_url + `/xcategories_sub_xclasses`
  
  } else {
    url = `/xroots/${xroot_id}/xcategories/${xcategory_id}/xcategories_sub_xclasses`;
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