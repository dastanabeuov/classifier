// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
<<<<<<< HEAD
//= require jquery_ujs
//= require action_cable
//= require turbolinks
//= require popper
//= require bootstrap-sprockets
//= require cocoon
=======
//= require popper
//= require bootstrap-sprockets
//= require cocoon
//= require rails-ujs
//= require activestorage
//= require action_cable
//= require turbolinks
>>>>>>> ca8170c5bcc79d6cf8b14e3aca0e95b86eb60666
//= require_tree .

(function() {
  this.App || (this.App = {});

  App.cable = ActionCable.createConsumer();

}).call(this);