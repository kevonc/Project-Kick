$(function(){
    displayData("totalprojectsbycategories");
    $("#projectscategories").on("click", function(){
        removeData();
        displayData("totalprojectsbycategories");
    });
    $("#fundingcategories").on("click", function(){
        removeData();
        displayData("totalfundingbycategories");
    });
});

function displayData(dataset){

  $.ajax({
    url: '/' + dataset,
    type: 'GET',
    dataType: 'JSON'
  }).done(function(data){
    var squareSize = 30,
     squaresInRow = 30,
     squaresInColumn = 8,
     gapSize = 2,
     boardBorder = 2,
     boardWidth = (squareSize * squaresInRow) + (gapSize * (squaresInRow - 1) + boardBorder * 2),
     boardHeight = (squareSize * squaresInColumn) + (gapSize * (squaresInColumn - 1) + boardBorder * 2),

     svg_category_project = d3.select("#category").append("svg")
      .attr("width", boardWidth)
      .attr("height", boardHeight);

    svg_category_project.selectAll("rect")
      .data(data)
      .enter().append("rect")
      .attr("fill", "#fff")
      .attr("id", function (d, i) { return "square_" + i; })
      .attr("x", function (d, i) { return d.x + 12; })
      .attr("y", function (d, i) { return d.y + 50; })
      .attr("width", 2)
      .attr("height", 2)
      .attr("rx", boardBorder)
      .attr("fill", function(d, i) { return d.color; })
      .attr("opacity", 0.5)
      .on("mouseover", function(d, i) {
        $(".hover").remove();
        d3.select("#sub-cat").select("svg").remove();
        d3.select(this)
        .attr("fill", "#fff")
        .transition()
        .duration(500)
        .attr("stroke-width", 0)
        .attr("stroke", "#fff");
        if (dataset === "totalprojectsbycategories") {
          d3.select("#cat-title").text(d.cat_name + " - " + d.total_projects + " Projects");
        } else {
          d3.select("#cat-title").text(d.cat_name + " - $" + d.total_funding);
        }
        d3.select("#sub-cat").insert(subCatBreakdown(d.sub_cat));
      })
      .on("mouseout", function(d, i) {
        d3.select(this)
          .attr("fill", function (d, i) { return d.color; })
          .transition()
          .duration(50)
          .attr("stroke-width", 0);
        // d3.select("#sub-cat").classed("hidden", true);
      });

      d3.selectAll("rect").transition()
        .attr("x", function (d, i) { return d.x; })
        .attr("y", function (d, i) { return d.y; })
        .attr("width", squareSize)
        .attr("height", squareSize)
        .attr("opacity", 1)
        .delay(function(d, i) { return i * 2; })
        .duration(400);

    function subCatBreakdown(data) {
      var array = [];

      for (var k in data) {
      var singleArray = [];
        singleArray.push(k);
        singleArray.push(data[k]);
        array.push(singleArray);
      }

      var pieWidth = 500,
          pieHeight = 300,
          radius = Math.min(pieWidth, pieHeight) / 3;

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
        .style("fill", "#386a6e");

      var pos = d3.svg.arc().innerRadius(radius + 30).outerRadius(radius + 30);

      g.append("text")
        .attr("transform", function(array) { return "translate(" + pos.centroid(array) + ")"; })
        .attr("dy", 5)
        .attr("text-anchor", "middle")
        .attr("fill", "#424242")
       .text(function(d, i) { return array[i][0]; })
        .attr("font-family", "Tulpen One")
        .attr("font-size", "22px");

      d3.select("g").transition()
        .attr("fill", "#ffffff");
    }
  });
}

function removeData() {
  d3.select("#category").select("svg").remove();
  d3.select("#sub-cat").select("svg").remove();
}
