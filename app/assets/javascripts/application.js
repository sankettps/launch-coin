// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require bootstrap.min
//= require owl.carousel.min
//= require jquery.raty
//= require moment
//= require bootstrap-datetimepicker
//= require jquery.dataTables.min
//= require dataTables.bootstrap.min
//= require particles
//= require flipclock
//= require bootstrap-select.min
//= require classie
//= require jquery.easing.min

jQuery(document).ready(function($) {
  if (!String.prototype.trim) {
    (function() {
      // Make sure we trim BOM and NBSP
      var rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
      String.prototype.trim = function() {
        return this.replace(rtrim, '');
      };
    })();
  }
  
  [].slice.call( document.querySelectorAll( 'input.input-field' ) ).forEach( function( inputEl ) {
  // in case the input is already filled..
  if( inputEl.value.trim() !== '' ) {
    classie.add( inputEl.parentNode, 'input-filled' );
  }

  // events:
  inputEl.addEventListener( 'focus', onInputFocus );
  inputEl.addEventListener( 'blur', onInputBlur );
  } );

  function onInputFocus( ev ) {
    classie.add( ev.target.parentNode, 'input-filled' );
  }

  function onInputBlur( ev ) {
    if( ev.target.value.trim() === '' ) {
      classie.remove( ev.target.parentNode, 'input-filled' );
    }
  }
});

$(window).scroll(function() {
  if ($(this).scrollTop() > 1){  
    $('header').addClass("sticky");
    $('body').addClass("sticky-b");
  }
  else{
    $('header').removeClass("sticky");
    $('body').removeClass("sticky-b");
  }
});