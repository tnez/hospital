// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


// function to fire error after leaving a required field empty
required_field_check = function() {
    if ($(this).val() == '') {
        error = 'Missing required input';
        $(this).closest('.form-group').addClass('error');
        $(this).closest('.form-group').append('<span class="error-message">' + error + '</span>');
    }
}

$(document).ready( function() {
    console.log('foofoofoo');
    $('.form-group.required input').bind('focusout',required_field_check);
    $('.form-group.required select').bind('focusout',required_field_check);
    $('.form-group.required radio').bind('focusout',required_field_check);
})
