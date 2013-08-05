//var projection = d3.geo.albersUsa()
//    .scale(1070)
//    .translate([width / 2, height / 2]);
//
//var path = d3.geo.path()
//    .projection(projection);
//
//var svg = d3.select("body").append("svg")
//    .attr("width", width)
//    .attr("height", height);
//
//svg.append("rect")
//    .attr("class", "background")
//    .attr("width", width)
//    .attr("height", height)
//    .on("click", clicked);
//
//var g = svg.append("g");
//
//d3.json("/mbostock/raw/4090846/us.json", function(error, us) {
//    g.append("g")
//        .attr("id", "states")
//        .selectAll("path")
//        .data(topojson.feature(us, us.objects.states).features)
//        .enter().append("path")
//        .attr("d", path)
//        .on("click", clicked);
//
//    g.append("path")
//        .datum(topojson.mesh(us, us.objects.states, function(a, b) { return a !== b; }))
//        .attr("id", "state-borders")
//        .attr("d", path);
//});