//xcategories_sub_xclasses
$(document).on('turbolinks:load', 'click', '.xcategories-sub-xclasses-link', function () {
  const xroot_id = $(this).attr('data-xroot-id')
  const xcategory_id = $(this).attr('data-xcategory-id')
  const current_url = window.location.pathname
  fetchXcategoriesSubXclassesNodes(xroot_id, xcategory_id, current_url)
})

function fetchXcategoriesSubXclassesNodes(xroot_id, xcategory_id, current_url) {
  if (current_url == `/xroots`) {
    alert('0')
    url = current_url + `/${xroot_id}/xcategories/${xcategory_id}/xcategories_sub_xclasses`

  } else if (current_url == `/xroots/${xroot_id}`) {
    alert('1');
    url = current_url + `/xcategories/${xcategory_id}/xcategories_sub_xclasses`;

  } else if (current_url == `/xroots/${xroot_id}/xcategories/${xcategory_id}`) {
    alert('2');
    url = current_url + `/xcategories_sub_xclasses`
  
  } else {
    alert('3');
    url = `/xroots/${xroot_id}/xcategories/${xcategory_id}/xcategories_sub_xclasses`;
  }

  $.ajax({
    method: "GET",
    dataType: "script",
    url: url,
    success: function(data) {
      
    }
  })
}