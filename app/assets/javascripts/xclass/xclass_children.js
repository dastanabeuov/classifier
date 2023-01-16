//xclass_children
$(document).on('click', '.xclass-children-load', function () {
  const xroot_id = $(this).attr('data-xroot-id')
  const xcategory_id = $(this).attr('data-xcategory-id')
  const xclass_id = $(this).attr('data-xclass-id')
  const current_url = window.location.pathname
  fetchXclassesChildrenNodes(xroot_id, xcategory_id, xclass_id, current_url)
})

function fetchXclassesChildrenNodes(xroot_id, xcategory_id, xclass_id, current_url) {
  if (current_url == `/xroots`) {
    url = current_url + `/${xroot_id}/xcategories/${xcategory_id}/xclasses/${xclass_id}/xclass_children`;

  } else if (current_url == `/xroots/${xroot_id}`) {
    url = current_url + `/xcategories/${xcategory_id}/xclasses/${xclass_id}/xclass_children`;

  } else if (current_url == `/xroots/${xroot_id}/xcategories/${xcategory_id}`) {
    url = current_url + `/xclasses/${xclass_id}/xclass_children`

  } else if (current_url == `/xroots/${xroot_id}/xcategories/${xcategory_id}/xclasses/${xclass_id}`) {
    url = current_url + `/xclass_children`;

  } else {
    url = `/xroots/${xroot_id}/xcategories/${xcategory_id}/xclasses/${xclass_id}/xclass_children`
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