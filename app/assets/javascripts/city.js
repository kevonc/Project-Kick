$(function(){

//    $("#container").on("click", "#projectscities", function(){
//            showprojects()
//        });
    d3.selectAll("button").on("click", function(){
           if (d3.select(this).attr("id") === "projectscities"){
               showprojects();
           } else if (d3.select(this).attr("id") === "fundingcities"){
               showfunding();
           }
    });
//    $("#container").on("click", "#fundingcities", function(){
//            showfunding()
//        });
});


var svg = d3.select("svg");

var dataEnter = [];
var projection = [];

function showfunding(){
    var svg = d3.select("svg");

    $.ajax({
        url: '/totalfundingbycities',
        type: 'GET',
        dataType: 'JSON'
    }).done(function(data){
            $("circle").remove();
            console.log("showfunding" + data.length);

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
                    console.log("in d3 enter radius attr");
                    return Math.log(data[i].total_funding/50) });

        });
}



function showprojects() {

    var svg = d3.select("svg");


    $.ajax({
        url: '/totalprojectsbycities',
        type: 'GET',
        dataType: 'JSON'
    }).done(function(data){
            $("circle").remove();
            console.log("showprojects" + data.length);

            dataEnter = svg.selectAll("circle").data(data);

            //setting scale and coordinates for svg USA map
            projection = d3.geo.albersUsa()
                .scale(1224)
                .translate([485,280]);

            console.log(dataEnter + "" + projection);


            //appending circles to the map
            //this doesn't work after any button is clicked already
            dataEnter.enter().append("circle")
                .attr("r", 0)
                .attr("transform", function(d, i) {
                    return "translate(" + projection([data[i].longitude, data[i].latitude]) + ")" })
                .transition()
                .duration(1000)
                .attr("r", function(d, i)
                {   console.log("in d3 enter radius attr");
                    return Math.log(data[i].total_projects)*8 });


        });
}



