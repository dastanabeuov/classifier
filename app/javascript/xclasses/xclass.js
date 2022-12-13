$(function(){

  var to = false;
  $('#xclasses_q').keyup(function () {
    if(to) { clearTimeout(to); }
    to = setTimeout(function () {
      var v = $('#xclasses_q').val();
      $('#xclasses').jstree(true).search(v);
    }, 250);
  });
  
  //Should the node be toggled if the text is double clicked. Defaults to true
  //$.jstree.defaults.core.dblclick_toggle = false;

  //Drag a node
  $("#xclasses").bind("select_node.jstree", function(e, data) {
    $('#xclasses').jstree('save_state');
  });

  //Set new position drag a node
  // $('#xclasses').on('move_node.jstree', function(e, obj) {
  //   // console.log(n.old_parent + ":" + n.old_position + " -> " + n.parent + ":" + n.position);
  //   var id = obj.node.id;
  //   var parent_id = obj.node.parent.id;
  //   var new_position = obj.position;

  //   var data = {'xclass': {'parent_id': parent_id, 'new_position': new_position}};
  //   var url = '/xclasses/' + id + '.json';

  //   // PATCH
  //   $.ajax({
  //     beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
  //     'type': 'PATCH',
  //     'data': data,
  //     'url': url
  //   })
  // });

  $("#xclasses").on("activate_node.jstree", function(e,data){
     window.location.href = data.node.a_attr.href;
  })

  $('#xclasses').jstree({
    'core': {
      'check_callback': true,

      // 'data' : {
      //   'url': function(node) {
      //     return 'xclasses.json'; // GET /xclasses.json
      //   }
      // }

    },
    "state" : { "key" : "xclasses" },

    "plugins" : [
      "dnd",
      "unique",
      "search",
      "sort",
      "state"
    ]
  });

});