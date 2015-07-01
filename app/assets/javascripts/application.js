// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets

// Add Ajax CRUD
var ready;
ready = function() {
  var container, modal;
  modal = $("#modal");
  container = $("#container");
  container.on("ajax:success", ".btn[data-remote=true]", function(e, data, status, xhr) {
    modal.find(".modal-body").html(xhr.responseText);
    modal.modal('show');
  }).on("ajax:error", function(e, xhr, status, error) {
    container.append("<p>ERROR</p>");
  });
  modal.on("ajax:success", "form", function(e, data, status, xhr) {
    if (xhr.responseText.indexOf('was successfully created') !== -1) {
      container.html(xhr.responseText);
      modal.modal('hide');
    } else {
      modal.find(".modal-body").html(xhr.responseText);
    }
  }).on("ajax:error", function(e, xhr, status, error) {
    modal.append("<p>ERROR</p>");
  });
}
$(document).ready(ready);
$(document).on('page:load', ready);
