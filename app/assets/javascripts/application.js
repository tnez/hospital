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
//= require jquery.turbolinks
//= require jquery_ujs
//
//= require_tree .
//
//= require turbolinks

// function to fire error after leaving a required field empty
required_field_check = function() {
    var parent_div = $(this).closest('.form-group');    
    if ($(this).val() == '') {
        parent_div.attr('valid', false)
        parent_div.find('.error-message').removeClass('hidden');
    } else {
        parent_div.attr('valid', true)        
        parent_div.find('.error-message').addClass('hidden');
    }
}

// a form is valid if all required inputs have a value
form_is_valid = function ($form) {
    // DEBUG:
    console.log('---validation run')
    // default return value is true
    var is_valid = true;
    // get the input for all required fields
    var $required_fields = $form.find('.required :input');
    // for each required field
    $required_fields.each( function() {
        if ($( this ).val() == '') {
            is_valid = false;
        }
    })
    return is_valid;
}

// register some stuff once the document is ready to go
$(document).ready( function() {
    // hide any submit buttons
    $('form').find('[type="submit"]').hide();
    $('.form-group.required input').bind('focusout',required_field_check);
    $('.form-group.required select').bind('focusout',required_field_check);
    $('.form-group.required radio').bind('focusout',required_field_check);
    // fade in submit button if the form is valid
    $('form .required :input').change( function() {
        $form = $(this).closest('form');
        if (form_is_valid($form)) {
            $form.find('[type="submit"]').fadeIn()
        } else {
            $form.find('[type="submit"]').fadeOut()
        }
    })
    // fade out flash messages if they exist
    $('#alert,#notice').fadeOut(2400);
});
