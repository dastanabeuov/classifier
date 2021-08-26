//xcategories_sub_children
$(document).on('turbolinks:load', 'click', '.xcategories-sub-children-link', function () {
  const xroot_id = $(this).attr('data-xroot-id')
  const xcategory_id = $(this).attr('data-xcategory-id')
  const xclass_id = $(this).attr('data-xclass-id')
  const current_url = window.location.pathname
  fetchXcategoriesSubChildrenNodes(xroot_id, xcategory_id, xclass_id, current_url)
})

function fetchXcategoriesSubChildrenNodes(xroot_id, xcategory_id, xclass_id, current_url) {
  if (current_url == `/xroots`) {
    alert('0');
    url = current_url + `/${xroot_id}/xcategories/${xcategory_id}/xclasses/${xclass_id}/xcategories_sub_children`;

  } else if (current_url == `/xroots/${xroot_id}`) {
    alert('1');
    url = current_url + `/xcategories/${xcategory_id}/xclasses/${xclass_id}/xcategories_sub_children`;

  } else if (current_url == `/xroots/${xroot_id}/xcategories/${xcategory_id}`) {
    alert('2');
    url = current_url + `/xclasses/${xclass_id}/xcategories_sub_children`

  } else if (current_url == `/xroots/${xroot_id}/xcategories/${xcategory_id}/xclasses/${xclass_id}`) {
    alert('3');
    url = current_url + `/xcategories_sub_children`;

  } else {
    alert('4')
    url = `/xroots/${xroot_id}/xcategories/${xcategory_id}/xclasses/${xclass_id}/xcategories_sub_children`
  }

  $.ajax({
    method: "GET",
    dataType: "script",
    url: url,
    success: function(data) {
      
    }
  })
}