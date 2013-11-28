// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs

// Loads all Bootstrap javascripts
//= require bootstrap

jQuery(window).on('mercury:ready', function() {
  Mercury.saveUrl = '/about';
});

onload: function() {
    Mercury.on('ready', function() {
        var link = $('#mercury_iframe').contents().find('#edit_link');
        console.log("mercury ready ready", link);
        mercuryInstance.saveUrl = link.data('save-url');
        link.hide();
    });

    Mercury.on('saved', function() {
        window.location.href = window.location.href.replace(/\/editor\//i, '/');
    });
}