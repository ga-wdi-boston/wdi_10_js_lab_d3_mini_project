var diameter = 480,
    format   = d3.format(",d"),
    color    = d3.scale.ordinal().range([
      "#2ecc71", // Pomegranate
      "#27ae60",  // Nephritis
      "#e74c3c",
      "#d35400"
      ]);

var bubble = d3.layout.pack()
    .sort(null)
    .size([diameter, diameter])
    .padding(1.5);

$(document).ready(function() {
  var econSvg =
    d3.select("#countries").append("svg")
      .attr({
        width:   diameter,
        height:  diameter,
        "class": "bubble"
        });
  var milSvg =
    d3.select("#countries").append("svg")
      .attr({
        width:   diameter,
        height:  diameter,
        "class": "bubble",
        x:       diameter
        });


  d3.json("econ.json", function(error, data) {
    var econCountries = [];
    data.forEach(function(country) {
      var econNode = { packageName: "economic", className: country.name,
        value: country.econ_aid }
      econCountries.push(econNode);
    })

    var node =
      econSvg.selectAll(".node")
        .data(bubble.nodes({ "name": "econ", "children": econCountries }))
      .enter().append("g")
        .attr("class", "node")
        .attr("transform", function(d) {
          return "translate(" + d.x + "," + d.y + ")"; });

    node.append("circle")
        .attr("r", function(d) { return d.r; })
        .style("fill", function(d) { return color(d.packageName)});

    node.append("text")
        .attr("dy", ".3em")
        .style("text-anchor", "middle")
        .text(function(d) {
          console.log(d.className);
          var name = d.className || ""
          return name.substring(0, d.r/4); });
  });

  d3.json("mil.json", function(error, data) {
    var milCountries = [];
    data.forEach(function(country) {
      var milNode = { packageName: "military", className: country.name,
        value: country.mil_aid }
      milCountries.push(milNode);
    })

    var node =
      milSvg.selectAll(".node")
        .data(bubble.nodes({ "name": "mil", "children": milCountries }))
      .enter().append("g")
        .attr("class", "node2")
        .attr("transform", function(d) {
          return "translate(" + d.x + "," + d.y + ")"; });

    node.append("circle")
        .attr("r", function(d) { return d.r; })
        .style("fill", function(d) { return color(d.packageName)});

    node.append("text")
        .attr("dy", ".3em")
        .style("text-anchor", "middle")
        .text(function(d) {
          console.log(d.className);
          var name = d.className || ""
          return name.substring(0, d.r/3); });
  });
});
