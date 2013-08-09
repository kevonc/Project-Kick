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
           var dataset = data.sort(function(a,b) {
               return parseFloat(b.percentage) - parseFloat(a.percentage)
           } );

        var names = [];
        var values = [];

        for (var i=0;i<9;i++){
            names.push(dataset[i].name);
            values.push(dataset[i].percentage);
        }

var xScale = d3.scale.ordinal()
    .domain(d3.range(values.length))
    .rangeRoundBands([0, w], .1);

var yScale = d3.scale.linear()
    .domain([0, d3.max(dataset).percentage])
    .range([0, h]);

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
                return d ;
            })
            .attr("fill", function(d) {
                return "#6b486b";
            })
            .on("mouseover", function() {
                d3.select(this)
                    .attr("fill", "#386a6e");
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
    .text(function(d,i) {
        return d + "\n" + dataset[i].percentage;
    })
    .attr("text-anchor", "middle")
    .attr("x", function(d, i) {
        return xScale(i) + xScale.rangeBand() / 2;
    })
    .attr("y", function(d) {
       //return h - yScale(d) ;
       return 600;
    })
    .attr("font-family", "Tulpen One")
    .attr("font-size", "22px")
    .attr("fill", "black");
    });
});
//
//var xAxis = svg.d3.axis()
//    .scale(xScale)
//    .text("test","Test");
//
//
//
//svg.append("g")
//    .call(xAxis)
//    .orient("bottom")
//    .attr("transform","translate(10,10")
//    .tickFormat(function(d,i){
//        return d[i]});
