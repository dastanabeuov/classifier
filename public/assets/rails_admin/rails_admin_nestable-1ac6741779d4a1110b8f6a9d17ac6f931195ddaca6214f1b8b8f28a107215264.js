(function(){jQuery(function(){var e,a,t,n,s,r,d;return d=function(e){var a;return a=e.nestable("serialize"),$.ajax({url:e.data("update-path"),type:"POST",data:{tree_nodes:a},success:function(e){var a;return a=$("<div>").addClass("nestable-flash alert alert-success").append($("<button>").addClass("close").data("dismiss","alert").html("&times;")).append($("<span>").addClass("body").html(e)),$("#rails_admin_nestable").append(a),a.fadeIn(200).delay(2e3).fadeOut(200,function(){return $(this).remove()})}})},n={},t=(a=$("#tree_nodes")).data("max-depth"),e=$("#rails_admin_nestable input[type=checkbox]"),s=$("#rails_admin_nestable button"),r=!e.length&&!s.length||e.prop("checked"),$("#rails_admin_nestable button").prop("disabled",e.prop("checked")),e.change(function(){return r=$(this).prop("checked"),s.prop("disabled",r)}),s.click(function(){return d(a)}),t&&"false"!==t&&(n.maxDepth=t),a.nestable(n).on({change:function(){if(r)return d(a)}})})}).call(this);