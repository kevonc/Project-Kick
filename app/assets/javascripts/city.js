$(function(){

    showprojects();

    d3.selectAll("button").on("click", function(){
           if (d3.select(this).attr("id") === "projectscities"){
               showprojects();
           } else if (d3.select(this).attr("id") === "fundingcities"){
               showfunding();
           }
    });
});

var dataEnter = [];
var projection = [];

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
                    d3.select("#city-name").text(data[i].name + '\n' + data[i].total_projects + " Projects");
                    d3.select("#citydata").classed("hidden", false);
                })
                .on("mouseout", function() {
                    d3.select("#citydata").classed("hidden", true);
                })
                .attr("r", 0)
                .attr("transform", function(d, i) {
                    return "translate(" + projection([data[i].longitude, data[i].latitude]) + ")" })
                .transition()
                .duration(1000)
                .attr("r", function(d, i) {
                    return Math.log(data[i].total_projects)*8;
                })
                .attr("fill", function(d,i){
                    return "hsla(" + Math.log(data[i].total_projects)*200 + ",75%,50%,.6)";
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
                .on("mouseover", function(d,i){
                    d3.select("#citydata")
                        .style("left", (d3.event.pageX) + 20 + "px")
                        .style("top", (d3.event.pageY) - 30 + "px");
                    d3.select("#city-name").text(data[i].name + '\n $' + data[i].total_funding + " Funded");
                    d3.select("#citydata").classed("hidden", false);
                })
                .on("mouseout", function() {
                    d3.select("#citydata").classed("hidden", true);
                })                .attr("r", 0)
                .attr("transform", function(d, i) {
                    return "translate(" + projection([data[i].longitude, data[i].latitude]) + ")" })
                .transition()
                .duration(1000)
                .attr("r", function(d,i){
                if (data[i].total_funding < 40000){
                  return 8;
                } else if (data[i].total_funding > 48000 && data[i].total_funding < 70000){
                  return 13;
                } else if (data[i].total_funding > 70000 && data[i].total_funding < 90000){
                  return 21;
                } else if (data[i].total_funding > 100000 && data[i].total_funding < 300000){
                  return 26
                } else {
                  return 30;
                }
              })
                .attr("fill", function(d,i){
                        return "hsla(" + Math.log(data[i].total_funding)*55 + ",75%,50%,.5)";
                });
        });
}