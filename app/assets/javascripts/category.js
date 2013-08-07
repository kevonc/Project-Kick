$(function(){
  $.ajax({
    url: '/totalprojectsbycategories',
    type: 'GET',
    dataType: 'JSON'
  }).done(function(data){
    var squareSize = 30;
    var squaresInRow = 30;
    var squaresInColumn = 8;
    var gapSize = 2;
    var boardBorder = 2;
    var boardWidth = (squareSize * squaresInRow) + (gapSize * (squaresInRow - 1) + boardBorder * 2);
    var boardHeight = (squareSize * squaresInColumn) + (gapSize * (squaresInColumn - 1) + boardBorder * 2);

    var svg_category_project = d3.select("#category").append("svg")
      .attr("width", boardWidth)
      .attr("height", boardHeight);

    var svg_category_project_breakdown = d3.select("#sub-cat").append("svg")
      .attr("width", boardWidth - (boardBorder * 2))
      .attr("height", 200);

    var newSquares = svg_category_project.selectAll("rect")
      .data(data)
      .enter();

    svg_category_project.append("rect")
      .attr("x", 300).attr("y", 150)
      .attr("rx", boardBorder) // radius
      .attr("width", boardWidth).attr("height", boardHeight)
      .attr("fill", "#fff");

    newSquares.append("rect")
      .attr("fill", "#fff")
      // .transition()
      // .duration(2000)
      .attr("id", function (d, i) { return "square_" + i; })
      .attr("x", function (d, i) { return d.x; })
      .attr("y", function (d, i) { return d.y; })
      .attr("width", squareSize)
      .attr("height", squareSize)
      .attr("rx", boardBorder)
      .attr("fill", function (d, i) { return d.color; })
      .on("mouseover", function(d, i) {
        d3.select(this)
        .attr("fill", "#fff")
        .transition()
        .duration(500)
        .attr("stroke-width", 1)
        .attr("stroke", "#000000");
        d3.select("#cat-title").text(d.cat_name);
        d3.select("#sub-cat").insert(subCatBreakdown(d, i));
      })
      .on("mouseout", function(d, i) {
        d3.select(this)
          .attr("fill", function (d, i) { return d.color; })
          .transition()
          .duration(50)
          .attr("stroke-width", 0);
        d3.select("#sub-cat").classed("hidden", true);
      });

    function subCatBreakdown(d, i) {
      var svg_category_project_breakdown = d3.select("#sub-cat")
        .classed("hidden", false);


      var newCircles = svg_category_project_breakdown.selectAll("circle")
      .data([1,2,3])
      .enter();

      console.log(newCircles);

      newCircles.append("circle")
        .attr("cx", 50)
        .attr("cy", 50)
        .attr("r", 40)
        .attr("fill", "#F781D8");
    };
  });
});