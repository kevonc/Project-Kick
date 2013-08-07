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

    var newSquares = svg_category_project.selectAll("rect")
      .data(data)
      .enter();

    svg_category_project.append("rect")
      .attr("x", 300).attr("y", 150)
      .attr("rx", boardBorder) // radius
      .attr("width", boardWidth).attr("height", boardHeight)
      .attr("fill", "#fff");

    newSquares.append("rect")
      .attr("id", function (d, i) { return "square_" + i; })
      .attr("x", function (d, i) { return d.x; })
      .attr("y", function (d, i) { return d.y; })
      .attr("width", squareSize)
      .attr("height", squareSize)
      .attr("rx", boardBorder)
      .attr("fill", function (d, i) { return d.color; })
      .on("mouseover", function(d, i) {
        d3.select(this).attr("stroke-width", 1);
        d3.select(this).attr("stroke", "#000000");
        d3.select("#cat-title").text(d.cat_name);
        d3.select("#sub-cat").append(subCatBreakdown(d, i));
      })
      .on("mouseout", function(d, i) {
        d3.select(this).attr("stroke-width", 0);
      });

    function subCatBreakdown(d, i) {
      d3.select(this).text("wthahaf");
      $.each(d.sub_cat, function(key, value) {
        console.log(key);
        console.log(value);
      });
    };
  });
});