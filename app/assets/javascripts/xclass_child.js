//xclass_child
$(document).on('turbolinks:load', 'click', '.xclass-child-link', function () {
  const xroot_id = $(this).attr('data-xroot-id')
  const xcategory_id = $(this).attr('data-xcategory-id')
  const child_id = $(this).attr('data-child-id')
  const current_url = window.location.pathname
  fetchXclassChildNodes(xroot_id, xcategory_id, child_id, current_url)
})

function fetchXclassChildNodes(xroot_id, xcategory_id, child_id, current_url) {
  if (current_url == `/xroots`) {
    alert('0');
    url = current_url + `/${xroot_id}/xcategories/${xcategory_id}/xclasses/${child_id}/xclass_child`;
  
  } else if (current_url == `/xroots/${xroot_id}`) {
    alert('1');
    url = current_url + `/xcategories/${xcategory_id}/xclasses/${child_id}/xclass_child`;

  } else if (current_url == `/xroots/${xroot_id}/xcategories/${xcategory_id}`) {
    alert('2');
    url =  current_url + `/xclasses/${child_id}/xclass_child`

  } else if (current_url == `/xroots/${xroot_id}/xcategories/${xcategory_id}/xclasses/${child_id}`) {
    alert('3');
    url = current_url + `/xclass_child`;
  
  } else {
    alert('4');
    url = `/xroots/${xroot_id}/xcategories/${xcategory_id}/xclasses/${child_id}/xclass_child`;
  }

  $.ajax({
    method: "GET",
    dataType: "script",
    url: url,
    success: function(data) {

    }
  })
}