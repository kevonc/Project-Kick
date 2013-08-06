/**
 * Created with JetBrains RubyMine.
 * User: Alina Guzman
 * Date: 8/5/13
 * Time: 10:44 PM
 * To change this template use File | Settings | File Templates.
 */

$(function(){
    var svg = d3.select("svg");

    d3.select("#projectscities")
        .on("click", function(){
            showprojects()
        });

    d3.select("#fundingcities")
        .on("click", function(){
            showfunding()
        });
});

function showfunding(){
    var svg = d3.select("svg");

    $.ajax({
        url: '/totalfundingbycities',
        type: 'GET',
        dataType: 'JSON'
    }).done(function(data){
            $("circle").hide();
            var dataUpdate = svg.selectAll("circle")
                .data(data);
            var projection = d3.geo.albersUsa()
                .scale(1224)
                .translate([485,280]);

            dataUpdate.enter().append("circle")
                .transition()
                .duration(1000)
                .attr("r", function(d,i){
                    return Math.log(data[i].total_funding/50) })
                .attr("transform", function(d, i) {
                    return "translate(" + projection([data[i].longitude, data[i].latitude]) + ")"});
        });
}

function showprojects() {
    var svg = d3.select("svg");

    $.ajax({
        url: '/totalprojectsbycities',
        type: 'GET',
        dataType: 'JSON'
    }).done(function(data){
            $("circle").hide();
            var dataEnter = svg.selectAll("circle")
                .data(data);
            var projection = d3.geo.albersUsa()
                .scale(1224)
                .translate([485,280]);

            dataEnter.enter().append("circle")
                .transition()
                .duration(1000)
                .attr("r", function(d, i)
                { return Math.log(data[i].total_projects)*8 })
                .attr("transform", function(d, i) {
                    return "translate(" + projection([data[i].longitude, data[i].latitude]) + ")" });

        });
}



