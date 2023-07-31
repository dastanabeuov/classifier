//xcategories_sub_children
$(document).on('turbolinks:load', function(){
  $(document).on('click', '.xcategories-sub-children-load', function () {
    const xroot_id = $(this).attr('data-xroot-id')
    const xcategory_id = $(this).attr('data-xcategory-id')
    const xclass_id = $(this).attr('data-xclass-id')
    const current_url = window.location.pathname
    fetchXcategoriesSubChildrenNodes(xroot_id, xcategory_id, xclass_id, current_url)
  })

  function fetchXcategoriesSubChildrenNodes(xroot_id, xcategory_id, xclass_id, current_url) {
    if (current_url == `/xroots`) {
      url = current_url + `/${xroot_id}/xcategories/${xcategory_id}/xclasses/${xclass_id}/xcategories_sub_children`;

    } else if (current_url == `/xroots/${xroot_id}`) {
      url = current_url + `/xcategories/${xcategory_id}/xclasses/${xclass_id}/xcategories_sub_children`;

    } else if (current_url == `/xroots/${xroot_id}/xcategories/${xcategory_id}`) {
      url = current_url + `/xclasses/${xclass_id}/xcategories_sub_children`

    } else if (current_url == `/xroots/${xroot_id}/xcategories/${xcategory_id}/xclasses/${xclass_id}`) {
      url = current_url + `/xcategories_sub_children`;

    } else {
      url = `/xroots/${xroot_id}/xcategories/${xcategory_id}/xclasses/${xclass_id}/xcategories_sub_children`
    }

    $.ajax({
      method: "GET",
      dataType: "script",
      url: url,
      cache: true
    })
  }
});