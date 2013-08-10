$(function(){
  var w = 960,
   h = 420,

  //Create SVG element
   svg = d3.select("#overfunding")
    .append("svg")
    .attr("width", w)
    .attr("height", h);

  $.ajax({
    url: '/funding',
    type: 'GET',
    dataType: 'JSON'
  }).done(function(data){
    var dataset = data.sort(function(a,b) {
       return parseFloat(b.percentage) - parseFloat(a.percentage);
    });

    var names = [],
        values = [];

    for (var i=0; i<8; i++){
        names.push(dataset[i].name);
        values.push(dataset[i].percentage);
    }

    var xScale = d3.scale.ordinal()
        .domain(d3.range(values.length))
        .rangeRoundBands([0, w], 0.03);

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
        return h - yScale(d) + 50;
      })
      .attr("width", xScale.rangeBand())
      .attr("height", function(d) {
        return d ;
      })
      .attr("fill", function(d) {
        return "#76CC1E";
      })
      .on("mouseover", function() {
        d3.select(this)
         .attr("fill", "#FC6A6A");
      })
      .on("mouseout", function(d) {
        d3.select(this)
          .transition()
          .duration(250)
          .attr("fill", "#76CC1E");
      })
      .on("click", function() {
        sortBars();
      });

//Create labels
    svg.selectAll("text")
      .data(names)
      .enter()
      .append("text")
      .text(function(d,i) {
        return d + "  -  " + dataset[i].percentage + "%";
      })
      .attr("text-anchor", "middle")
      .attr("x", function(d, i) {
        return xScale(i) + xScale.rangeBand() / 2;
      })
      .attr("y", function(d,i) {
        //return h - yScale(d);
        //return 40 + (h-i);
        return h - yScale(dataset[i].percentage)+50;
      })
      .attr("text-anchor", "middle")
      .attr("font-family", "Tulpen One")
      .attr("font-size", "25px")
      .attr("fill", "black");
  });
});

var sortBars = function() {
  svg.selectAll("rect")
    .sort(function(a, b) {
      return d3.descending(a, b);
    })
    .transition()
    .duration(1000)
    .attr("x", function(d, i) {
      return xScale(i);
    });
};




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
