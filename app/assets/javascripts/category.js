$(function(){
  var w = 800;
  var h = 500;
  var svg = d3.select("body")
              .append("svg")
              .attr("width", w)
              .attr("height", h);

  var square = svg.append("rect")
                  .attr("x", 10)
                  .attr("y", 10)
                  .attr("width", 30)
                  .attr("height", 30)
                  .attr("fill", "#4c9ec3");

  var square = svg.append("rect")
                  .attr("x", 42)
                  .attr("y", 10)
                  .attr("width", 30)
                  .attr("height", 30)
                  .attr("fill", "#27709d");

  var square = svg.append("rect")
                  .attr("x", 10)
                  .attr("y", 42)
                  .attr("width", 30)
                  .attr("height", 30)
                  .attr("fill", "#318a6c");


});

// yellow - #d5b92a
// orange - #e36f26
// pink - #f16776
// red1- #d33f35
// red2 - #b02e30
// maroon - #923442
// purple - #86374d
// dark purple - #5b4961
// blue1 - #4c9ec3
// blue2- #27709d
// green1 - #318a6c
// green2 -#72a94b
// brown - #873625