$(function(){
    var w = 1000;
    var h = 600;

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
        var dataset = [];

        for (var k in data) {
            var singleArray = [];
            singleArray.push(k);
            singleArray.push(data[k]);
            dataset.push(singleArray);
        }

        debugger;

var xScale = d3.scale.ordinal()
    .domain(d3.range(dataset.length))
    .rangeRoundBands([0, w], 0.1);

var yScale = d3.scale.linear()
    .domain([0, d3.max(dataset)[1]])
    .range([0, h]);

        var names = [];
        var values = [];

        for (var i=0;i<dataset.length;i++){
            names.push(dataset[i][0]);
            values.push(dataset[i][1]);
            names;
            values;
        }
//Create bars
svg.selectAll("rect")
    .data(values)
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
    .data(names)
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
       // return h - yScale(d) + 14;
        return 10
    })
    .attr("font-family", "sans-serif")
    .attr("font-size", "11px")
    .attr("fill", "black");
    });
});
