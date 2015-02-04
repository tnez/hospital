// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

// function to fire error after leaving a required field empty
required_field_check = function() {
    if ($(this).val() == '') {
        var parent_div = $(this).closest('.form-group');
        parent_div.addClass('error');
        parent_div.find('.error-message').removeClass('hidden');
    }
}

// register some stuff once the document is ready to go
$(document).ready( function() {
    $('.form-group.required input').bind('focusout',required_field_check);
    $('.form-group.required select').bind('focusout',required_field_check);
    $('.form-group.required radio').bind('focusout',required_field_check);
})
