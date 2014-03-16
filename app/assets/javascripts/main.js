window.onload = function() {
  TownBubbes();
};

var bubble = d3.layout.pack()
    .sort(null)
    .size([diameter, diameter])
    .padding(1.5);

var diameter = 5000,
    color = d3.scale.category20c();

TownBubbes = function() {
  d3.json('/towns/index.json', function(error, towns){
    var spead = d3.layout.pack();
    var color = d3.scale.category20c();
    var townsViz = d3.select("#towns-container")
                    .attr("width", diameter)
                    .attr("height", diameter)
                    .attr("class", "bubble")
                    .selectAll("g")
                    .data(towns)
                    .enter()
                    .append("g")
                    .attr("transform", function(town){
                      var val, translate;
                      val = town.name.length * 10;
                      translate = "translate(" + (Math.floor(Math.random()*5000))  + "," +  (Math.floor(Math.random()*5000)) +  ")";
                      return translate
                    })
                    .attr("class", "node");

        townsViz.append('circle')
                 .attr('r', function(town){return town.repetition * 5;})
                 .style("fill", function(town) { return color(town.name); })
                 .attr('id', function(town, i ){return i;});

        townsViz.append('text')
                 .text(function(town){return town.name;})
                 .style("text-anchor", "middle");

        townsViz.append('text')
                 .text(function(town){return " count:" + parseInt(town.repetition);})
                 .style("text-anchor", "middle")
                 .attr("transform", function(town){
                      translate = "translate(" + 8  + "," +  15 +  ")";
                      return translate
                    });
  });
};


function classes(root) {
  var classes = [];

  function recurse(name, node) {
    if (node.children) node.children.forEach(function(child) { recurse(node.name, child); });
    else classes.push({packageName: name, className: node.name, value: node.size});
  }

  recurse(null, root);
  return {children: classes};
}




