$(function(){
  showprojects();
  d3.select("#projectscities").classed("selected-button", true);
  d3.select("#projectscities").classed("btn", false);
  d3.select("#projectscities").attr("disabled", true);
  d3.select("#projectscities").on("click", function() {
    showprojects();

    d3.select("#projectscities").classed("selected-button", true);
    d3.select("#projectscities").classed("btn", false);
    $("#projectscities").attr("disabled", true);

    d3.select("#fundingcities").classed("selected-button", false);
    d3.select("#fundingcities").classed("btn", true);
    $("#fundingcities").attr("disabled", false);
  });
  $("#fundingcities").on("click", function() {
    showfunding();

    d3.select("#fundingcities").classed("selected-button", true);
    d3.select("#fundingcities").classed("btn", false);
    $("#fundingcities").attr("disabled", true);

    d3.select("#projectscities").classed("selected-button", false);
    d3.select("#projectscities").classed("btn", true);
    $("#projectscities").attr("disabled", false);
  });
});

var dataEnter = [],
    projection = [];

function showprojects() {
  var svg = d3.select("svg");
  $.ajax({
      url: '/totalprojectsbycities',
      type: 'GET',
      dataType: 'JSON'
  }).done(function(data){
    $("circle").remove();

    dataEnter = svg.selectAll("circle").data(data);

    //setting scale and coordinates for svg USA map
    projection = d3.geo.albersUsa()
      .scale(1224)
      .translate([485,280]);

    //appending circles to the map
    dataEnter.enter().append("circle")
      .on("mouseover", function(d,i){
          d3.select("#citydata")
            .style("left", (d3.event.pageX) + 20 + "px")
            .style("top", (d3.event.pageY) - 30 + "px");
          d3.select("#city-name").html(data[i].name + "<br>" + data[i].total_projects + " Projects");
          d3.select("#citydata").classed("hidden", false);
      })
      .on("mouseout", function() {
        d3.select("#citydata").classed("hidden", true);
      })
      .attr("r", 0)
      .attr("transform", function(d, i) {
        return "translate(" + projection([data[i].longitude, data[i].latitude]) + ")";
      })
      .transition()
      .duration(1000)
      .attr("r", function(d, i) {
        return Math.log(data[i].total_projects) * 4;
      })
      .attr("fill", function(d,i){
        return "hsla(" + Math.log(data[i].total_projects) * 200 + ",75%,50%,.35)";
      });
  });
}

function showfunding(){
  var svg = d3.select("svg");

  $.ajax({
    url: '/totalfundingbycities',
    type: 'GET',
    dataType: 'JSON'
  }).done(function(data){

    $("circle").remove();
    //setting d3 selection for enter
      dataEnter = svg.selectAll("circle")
        .data(data);

    //setting scale and coordinates for svg USA map
    projection = d3.geo.albersUsa()
      .scale(1224)
      .translate([485,280]);

    //appending circles to the map
    dataEnter.enter().append("circle")
      .on("mouseover", function(d,i) {
        d3.select("#citydata")
          .style("left", (d3.event.pageX) + 20 + "px")
          .style("top", (d3.event.pageY) - 30 + "px");
        d3.select("#city-name").html(data[i].name + "<br>$" + data[i].funding_currency + " Funded");
        d3.select("#citydata").classed("hidden", false);
      })
      .on("mouseout", function() {
        d3.select("#citydata").classed("hidden", true);
      })
      .attr("r", 0)
      .attr("transform", function(d, i) {
        return "translate(" + projection([data[i].longitude, data[i].latitude]) + ")";
      })
      .transition()
      .duration(1000)
      .attr("r", function(d,i) {
         if (data[i].total_funding > 70000000){
          return 43;
        } else if (data[i].total_funding > 10000000){
          return 37;
         } else if (data[i].total_funding > 7000000){
           return 34;
        } else if (data[i].total_funding > 3000000){
          return 30;
        } else if (data[i].total_funding > 1000000){
          return 23;
        } else if (data[i].total_funding > 500000){
          return 18;
        } else if (data[i].total_funding > 200000){
          return 14;
        } else if (data[i].total_funding > 100000){
          return 8;
        } else if (data[i].total_funding > 30000){
          return 0; // change to 0
//        } else {
//          return 0;
        }
      })
      .attr("fill", function(d,i) {
        return "hsla(" + Math.log(data[i].total_funding) * 155 + ",75%,50%,.35)";
    });
  });
}