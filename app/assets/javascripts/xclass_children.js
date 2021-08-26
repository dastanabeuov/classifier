//xclass_children
$(document).on('turbolinks:load', 'click', '.xclass-children-link', function() {
  $(`ul.tree li`).each(function() {
    
    var li = $(this);

    var urln = $(this).attr("href");

    $.ajax({
      method: 'GET',
      dataType: 'script',
      url: urln,
      success: function(data) {
        li.html(data);
        console.log(data);
      }
    });
  });
}

$(document).on('turbolinks:load', 'click', '.xclass-children-link', function () {
  const xroot_id = $(this).attr('data-xroot-id')
  const xcategory_id = $(this).attr('data-xcategory-id')
  const xclass_id = $(this).attr('data-xclass-id')
  const current_url = window.location.pathname
  fetchXclassesChildrenNodes(xroot_id, xcategory_id, xclass_id, current_url)
})

function fetchXclassesChildrenNodes(xroot_id, xcategory_id, xclass_id, current_url) {
  if (current_url == `/xroots`) {
    alert('0');
    url = current_url + `/${xroot_id}/xcategories/${xcategory_id}/xclasses/${xclass_id}/xclass_children`;

  } else if (current_url == `/xroots/${xroot_id}`) {
    alert('1');
    url = current_url + `/xcategories/${xcategory_id}/xclasses/${xclass_id}/xclass_children`;

  } else if (current_url == `/xroots/${xroot_id}/xcategories/${xcategory_id}`) {
    alert('2');
    url = current_url + `/xclasses/${xclass_id}/xclass_children`

  } else if (current_url == `/xroots/${xroot_id}/xcategories/${xcategory_id}/xclasses/${xclass_id}`) {
    alert('3');
    url = current_url + `/xclass_children`;

  } else {
    alert('4')
    url = `/xroots/${xroot_id}/xcategories/${xcategory_id}/xclasses/${xclass_id}/xclass_children`
  }

  $.ajax({
    method: "GET",
    dataType: "script",
    url: url,
    success: function(data) {

    },
    error: function (xhr, ajaxOptions, thrownError) {
      alert("XHR:"+xhr.status+"Error:"+thrownError);
    }
  })
}