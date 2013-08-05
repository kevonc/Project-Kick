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
//= require_tree .


$(function(){
  $.ajax({
    url: '/totalprojectsbycities',
    type: 'GET',
    dataType: 'JSON'
  }).done(function(data){
    var svg = d3.select("svg");
    var projection = d3.geo.albersUsa().scale(1224).translate([475,280]);

   for (i=0;i < data.length; i++){
     var total_projects = data[i].total_projects;
     var longitude = data[i].longitude;
     var latitude = data[i].latitude;
     svg.append("circle").attr("r",Math.log(total_projects)*8).attr("transform", function() {
         return "translate(" + projection([longitude, latitude]) + ")";
     });
    }
  });
});

