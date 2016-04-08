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
//= require bootstrap-sprockets
//= require moment
//= require fullcalendar
//= require day-schedule-selector.js
//= require jquery_ujs
//= require jquery.turbolinks
//= require turbolinks
//= require_tree .
//= require jquery.geocomplete

$(function() {
$("#geo-input").geocomplete();
});  

$(function() {



  var wheight = $(window).height(); 
  var slideqty = $('#featured .item').length;
  var randSlide = Math.floor(Math.random()*slideqty);
  
  $('.fullheight').css('height', wheight); //set to window tallness  

  $(window).resize(function() {
    wheight = $(window).height(); //get the height of the window
    $('.fullheight').css('height', wheight); //set to window tallness  
  });

  $('#featured .item').eq(randSlide).addClass('active');
  




    //replace IMG inside carousels with a background image
  $('#featured .item img').each(function() {
    var imgSrc = $(this).attr('src');
    $(this).parent().css({'background-image': 'url('+imgSrc+')'});
    $(this).remove();
  });


    // Carousel change
  $('.carousel').carousel({   
    interval: 4000,  
    pause: false  // do not pause on hover
  });

  var sideslider = $('[data-toggle=collapse-side]');
  var sel = sideslider.attr('data-target');
  sideslider.click(function(event){
      $(sel).toggleClass('in');
  });
  $('#side-menu-collapse').click(function(event){
      $(sel).toggleClass('in');
  });

  $(window).scroll(function() {
    if ($(document).scrollTop() > 250) {
      $(".navbar").addClass("scrolled");
    } else {
      $(".navbar").removeClass("scrolled");
    }
  });

  //Change Nav Item Content Active

  $('.navigation').on('click', 'li', function() {
    var content = $(this).data('content');
    $('#dashboard-content .active').removeClass("active");
    $('#dashboard-content #'+ content).addClass("active");    

  });

  //AutoComplete Location
  // $("#geo-input").geocomplete();

  // $('.navigation .nav-item').click(function(event){
  //   $('#dashboard-content .active').removeClass("active");
  //   $('#dashboard-content #my-teachers').addClass("active");    
  // });

});

