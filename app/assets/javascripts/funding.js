$(function(){
    var w = 600;
    var h = 250;

    //Create SVG element
    var svg = d3.select("#overfunding")
        .append("svg")
        .attr("width", w)
        .attr("height", h);

$.ajax({
    url: '/funding',
    type: 'GET',
    dataType: 'JSON'
}).done(function(data){
        console.log(data);

        var dataset = [ 5, 10, 13, 19, 21, 25, 22, 18, 15, 13,
            11, 12, 15, 20, 18, 17, 16, 18, 23, 25 ];
        console.log(dataset);
var xScale = d3.scale.ordinal()
    .domain(d3.range(dataset.length))
    .rangeRoundBands([0, w], 0.05);

var yScale = d3.scale.linear()
    .domain([0, d3.max(dataset)])
    .range([0, h]);



//Create bars
svg.selectAll("rect")
    .data(dataset)
    .enter()
    .append("rect")
    .attr("x", function(d, i) {
        return xScale(i);
    })
    .attr("y", function(d) {
        return h - yScale(d);
    })
    .attr("width", xScale.rangeBand())
    .attr("height", function(d) {
        return yScale(d);
    })
    .attr("fill", function(d) {
        return "rgb(" + (d * 10) + ", 0, " + (d * 10) + ")";
    })
    .on("mouseover", function() {
        d3.select(this)
            .attr("fill", "orange");
    })
    .on("mouseout", function(d) {
        d3.select(this)
            .transition()
            .duration(250)
            .attr("fill", "rgb(0, 0, " + (d * 10) + ")");
    });

//Create labels
svg.selectAll("text")
    .data(dataset)
    .enter()
    .append("text")
    .text(function(d) {
        return d;
    })
    .attr("text-anchor", "middle")
    .attr("x", function(d, i) {
        return xScale(i) + xScale.rangeBand() / 2;
    })
    .attr("y", function(d) {
        return h - yScale(d) + 14;
    })
    .attr("font-family", "sans-serif")
    .attr("font-size", "11px")
    .attr("fill", "white");
    });
});
