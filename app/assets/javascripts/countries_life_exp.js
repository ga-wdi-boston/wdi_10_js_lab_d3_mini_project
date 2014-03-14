$(document).ready(function() {

  var margin = {top: 20, right: 20, bottom: 30, left: 40},
      width  = 960 - margin.left - margin.right,
      height = 500 - margin.top - margin.bottom;

  var x = d3.scale.linear()
      .range([0, width -50]);

  var y = d3.scale.linear()
      .range([height, 0])

  var color = d3.scale.category20b();

  var xAxis = d3.svg.axis()
      .scale(x)
      .orient("bottom")
      .tickFormat(function(d) { return d / 1e6; })
      .tickSize(1);

  var yAxis = d3.svg.axis()
      .scale(y)
      .orient("left")
      .tickSize(1);

  var svg = d3.select("#life-exp").append("svg")
      .attr("width", width + margin.left + margin.right)
      .attr("height", height+ margin.top + margin.bottom)
    .append("g")
      .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

  d3.json("life_exp.json", function(error, data) {
    data.forEach(function(country) {
      delete country.created_at;
      delete country.updated_at;
      delete country.id;
    })
    console.log(data);

    x.domain(d3.extent(data, function(d) { return d.total_aid; }));
    y.domain(d3.extent(data, function(d) { return d.life_expectancy; }));

    svg.append("g")
        .attr("class", "x axis")
        .attr("transform", "translate(0," + height + ")")
        .call(xAxis)
      .append("text")
        .attr("class", "label")
        .attr("x", width - 50)
        .attr("y", -6)
        .style("text-anchor", "end")
        .text("US Foreign Aid Received, 1940-2010 (in MM$USD)");

    svg.append("g")
        .attr("class", "y axis")
        .call(yAxis)
      .append("text")
        .attr("class", "label")
        .attr("transform", "rotate(-90)")
        .attr("y", 6)
        .attr("x", -height + 10)
        .attr("dy", ".71em")
        .style("text-anchor", "start")
        .text("Life Expectancy, 2010");

    var points = svg.selectAll(".dot")
        .data(data)
      .enter().append("g")
        .attr("transform", function(d) {
          var xCoord = x(d.total_aid), yCoord = y(d.life_expectancy);
          return "translate(" + xCoord + "," + yCoord + ")";
        })

    var circles = points
      .append("circle")
        .attr("class", "dot")
        .attr("r", 3.5)
        .style("fill", function(d) { return color(d.name); })

    points
      .on("mouseenter", function(d) {
        d3.select(this).append("text")
          .text(d.name)
          .attr("dx", "0.25em")
          .attr("class", "hover-label")
          .attr("font-size", 14)
          .attr("fill", "tomato")
      })
      .on("mouseleave", function(d) {
        d3.select(this).selectAll(".hover-label").remove();
      })

    var legend = svg.selectAll(".legend")
        .data(color.domain())
      .enter().append("g")
          .attr("class", "legend")
          .attr("transform", function(d,i) {
            return "translate(0," + i * 20 + ")"; });

    legend.append("text")
      .attr("x", width -24)
      .attr("y", 9)
      .attr("dy", ".35em")
      .style("text-anchor", "end")
      .text(function(d) { return d; });
  });
});
