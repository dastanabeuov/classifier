$(function(){
  $("ul.items li").click(function(){
    $(this).children('ul').toggle();
  });
});