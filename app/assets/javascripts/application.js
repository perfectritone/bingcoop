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
//= require_directory .

function equalize_side_box_heights() {
  left_box_height = $('#left_box .top_box').height();
  right_box_height = $('#right_box .top_box').height();
  if ( parseInt(left_box_height) == 0 || parseInt(right_box_height) == 0 )
    return;
  if (left_box_height < right_box_height) {
    $('#left_box .top_box').height(right_box_height);
  } else {
    $('#right_box .top_box').height(left_box_height);
  }
}

$(document).ready(equalize_side_box_heights);
