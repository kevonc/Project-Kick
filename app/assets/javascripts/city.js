$(function(){

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
                .attr("r", 0)
                .attr("transform", function(d, i) {
                    return "translate(" + projection([data[i].longitude, data[i].latitude]) + ")" })
                .transition()
                .duration(1000)
                .attr("r", function(d, i) {
                    return Math.log(data[i].total_projects)*8
                })
                .attr("fill", function(d,i){
                    return "hsl(" + Math.log(data[i].total_funding/50)*20 + ",100%,50%)";
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
                .attr("r", 0)
                .attr("transform", function(d, i) {
                    return "translate(" + projection([data[i].longitude, data[i].latitude]) + ")" })
                .transition()
                .duration(1000)
                .attr("r", function(d,i){
                    return Math.log(data[i].total_funding/50) })
                .attr("fill", function(d,i){
                        return "hsl(" + Math.log(data[i].total_funding)*30 + ",100%,50%)";
                });
        });
}
//hover events
svg.selectAll("circle, text")
    .on("mouseover", function(d) {
        //Get this bar's x/y values, then augment for the tooltip
        d3.select("#citydata")
            .style("left", (d3.event.pageX) + 20 + "px")
            .style("top", (d3.event.pageY) - 30 + "px")
            .select("#value")
            .text(d.school);
//        d3.select('#seed-number')
//            .text(d.seed);
//        d3.select('#name')
//            .text(d.school);
//        d3.select('#expenses')
//            .text("$" + addCommas(d.texpenses));
//        d3.select('#revenue')
//            .text("$" + addCommas(d.rev));
//        d3.select('#appearance')
//            .text(d.appearances);
//        d3.select('#finalfours')
//            .text(d.finalfours);
//        d3.select('#titles')
//            .text(d.titles);
//        // for rounding values to million
//        // .text("$" + parseInt(d.gross/1000000) + " million");
//        d3.select("#tooltip").classed("hidden", false);
    })

    .on("mouseout", function() {

        //Hide the tooltip
        d3.select("#city").classed("hidden", true);
    });