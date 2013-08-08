$(function(){
  displayData("totalprojectsbycategories");
  $("#projectscategories").on("click", function(){
    d3.select("#category").select("svg").remove();
    d3.select("#sub-cat").select("svg").remove();
    displayData("totalprojectsbycategories");
  });
  $("#fundingcategories").on("click", function(){
    d3.select("#category").select("svg").remove();
    d3.select("#sub-cat").select("svg").remove();
    displayData("totalfundingbycategories");
  });
});

function displayData(dataset){
  $.ajax({
    url: '/' + dataset,
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
      .attr("fill", "#fff")
      .transition()
      .duration(1000);

    newSquares.append("rect")
      .attr("fill", "#fff")
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
        d3.select("#sub-cat").insert(subCatBreakdown(d.sub_cat));
      })
      .on("mouseout", function(d, i) {
        d3.select("#sub-cat").select("svg").remove();
        $("g").remove();
        d3.select(this)
          .attr("fill", function (d, i) { return d.color; })
          .transition()
          .duration(50)
          .attr("stroke-width", 0);
        // d3.select("#sub-cat").classed("hidden", true);
      });

    function subCatBreakdown(data) {
      var array = [];

      for (var k in data) {
      var singleArray = [];
        singleArray.push(k);
        singleArray.push(data[k]);
        array.push(singleArray);
      }

      d3.select("#sub-cat").classed("hidden", false);

      ///////////////////////////////////////////////////////

      var pieWidth = 500,
          pieHeight = 300,
          radius = Math.min(pieWidth, pieHeight) / 2;

      var color = d3.scale.ordinal()
        .range(["#98abc5", "#8a89a6", "#7b6888", "#6b486b", "#a05d56", "#d0743c", "#ff8c00"]);

      var arc = d3.svg.arc()
        .outerRadius(radius - 10)
        .innerRadius(0);

      var pie = d3.layout.pie()
        .sort(null)
        .value(function(array) { return array[1]; });

      var svg = d3.select("#sub-cat").append("svg")
        .attr("width", pieWidth)
        .attr("height", pieHeight)
        .append("g")
        .attr("transform", "translate(" + pieWidth / 2 + "," + pieHeight / 2 + ")");

      var g = svg.selectAll(".arc")
        .data(pie(array))
        .enter().append("g")
        .attr("class", "arc");

      g.append("path")
        .attr("d", arc)
        .style("fill", "#216e94");

      g.append("text")
        .attr("transform", function(array) { return "translate(" + arc.centroid(array) + ")"; })
        .attr("dy", ".71em")
        .style("text-anchor", "middle")
        .attr("fill", "#ffffff")
        .attr("font-family", "Armata")
        .text(function(d, i) { return array[i][0]; });
    }
  });
};