$(document).on('turbolinks:load', function(){
    var p = $(".nav-side-menu");
    var d = $(".content");
    var r = $(".nav-side-menu");
    
    var curr_width = p.width()
    var unlock = false;
    
    $(document).mousemove(function(e) {
      var change = curr_width + (e.clientX - curr_width);
    
       if(unlock) {
          if(change > 310) {
            $("#debug").text(e.clientX + " Размер");
            
            p.css("width", change);
            d.css("padding-left", change + 10);
          }
          else {
            
            p.css("width", 300);
            d.css("padding-left", 310);
            }
        }
    });
    
    r.mousedown(function(e) {
        curr_width = p.width();
        unlock = true;
        // r.css("background-color", "rgba(0, 0, 0, 0.2)");
    });

    $(document).mousedown(function(e) {
        if(unlock) {
          e.preventDefault();
        }
    });

    $(document).mouseup(function(e) {
        unlock = false;
        $("#debug").text("");
        // r.css("background-color", "rgba(0, 0, 0, 0.1)");
    });
});