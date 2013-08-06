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
//                    if(Math.log(data[i].total_funding/50) < 4){
//                        //debugger;
                        return "hsl(" + Math.log(data[i].total_funding)*30 + ",100%,50%)";
                        //"#3366FF"
//                    } else {
//
//                        return "#000000"
//                    }
                });
//                .style("fill", function(d){
//                    if      (d.region == "m") {return "#0a9078"}
//                    else if (d.region == "w") {return "#0066ab"}
//                    else if (d.region == "s") {return "#e5b022"}
//                    else if (d.region == "e") {return "#ef4423"}
//                    else {return "gray"}
        });
}