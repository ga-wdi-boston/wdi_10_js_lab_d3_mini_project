$(document).ready(function(){
  var diameter = 960,
      format = d3.format(",d"),
      color = d3.scale.category20c();

  var bubble = d3.layout.pack()
      .size([diameter, diameter])
      .padding(1.5);

  var svg = d3.select("body").append("svg")
      .attr("width", diameter)
      .attr("height", diameter)
      .attr("class", "bubble");

  var remoteData = {},
    remoteSuccessHandler;

  // $.get('/projects/index.json')
  //   .success(remoteSuccessHandler.bind(this));

  // remoteSuccessHandler = function(data){
  //   var entry;
  //   console.log("success");

  //   data.forEach(function(el){
  //       entry = {};
  //       entry['fillKey'] = el.fill_color;
  //       entry['reincarcerated'] = el.reincarcerated;
  //       entry['popAtRisk'] = el.pop_at_risk;
  //       entry['percent'] = el.percent;
  //       remoteData[el.name] = entry;
  //   });
  // };

  d3.json("/projects/index.json", function(error, data) { // retrieving the json, and passing a function
    var node = svg.selectAll(".node")
        .data(data)
      .enter().append("g") // For each data element, append g, and set the following attributes
        .attr("class", "node")
        .attr("transform", function(d) { return "translate(" + 300 + "," + 300 + ")"; });

    node.append("title") // For each node, append a title of the name of the project
        .text(function(d) { return d.name });

    node.append("circle") // For each node, append a circle element
        .attr("r", 30)
        .style("fill", function(d) { return color(d.category); });

    node.append("text") // For each node, append text
        .attr("dy", ".3em")
        .style("text-anchor", "middle") // Position the text in the middle of each circle
        .text(function(d) { return d.name.substring(0, d.r / 3); }); // Set the text equal to the className of the data element. The substring method chops off the last part of the string to make it fit inside the circle, using the radius of each data element to determine at which character the string should be chopped off.
  });

  d3.select(self.frameElement).style("height", diameter + "px");
});
