$(function(){

    showprojects();
});

var dataEnter = [];
var projection = [];

function showprojects() {
    var svg = d3.select("svg");

    $.ajax({
        url: '/funding',
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
                    return Math.log(data[i].total_projects)*8
                })
                .attr("fill", function(d,i){
                    return "hsla(" + Math.log(data[i].total_projects)*200 + ",100%,50%,.5)";
                });
        });
}