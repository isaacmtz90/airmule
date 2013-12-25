// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
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

if($(".messages li a").length > 0){
	$('.messages li').bind('click', function(e) {           
	  var url = $(this).children('a').eq(0).attr('href');
	  $('div.conversation').load(url); // load the html response into a DOM element
	  $(".messages li ").removeClass("selected");
	  $(this).addClass("selected");
	  e.preventDefault(); // stop the browser from following the link
	});
}

