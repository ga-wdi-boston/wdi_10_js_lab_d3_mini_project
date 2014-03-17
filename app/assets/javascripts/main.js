
var diameter = 3500;

var bubble = d3.layout.pack()
    .sort(null)
    .size([diameter, diameter])
    .padding(1.5);

TownBubbes = function(url) {
  d3.json(url, function(error, towns){
    var color = d3.scale.category20b();
    var node = d3.select("#towns-container")
                    .attr("width", diameter)
                    .attr("height", diameter)
                    .attr("class", "bubble")
                    .selectAll("g")
                    .data(bubble.nodes(transformData(towns)).filter(function(town){
                      return !town.children;
                    }))
                    .enter()
                    .append("g")
                    .attr("transform", function(town){
                      var val, translate;
                      val = town.name.length * 10;
                      translate = "translate(" + town.x  + "," +  town.y +  ")";
                      return translate
                    })
                    .attr("class", "node");

        node.append('circle')
                 .attr('r', function(d){
                    return d.r;
                  })
                 .style("fill", function(town) {
                    return color(town.value);
                  })
                 .attr('id', function(town, i ){
                    return i;
                  });

        node.append('text')
                 .text(function(town){return town.name;})
                 .style("text-anchor", "middle");

        node.append('text')
                 .text(function(town){return parseInt(town.value);})
                 .style("text-anchor", "middle")
                 .attr("transform", function(town){
                      translate = "translate(" + 0  + "," +  15 +  ")";
                      return translate
                    });
  });
};

function transformData(json) {
  var data = json.towns;
  new_data = { children: data };
  return new_data;
}

var topTownRender = function(event){
  debugger;
  event.preventDefault();
  d3.select("#towns-container").selectAll(".node").remove();
  TownBubbes('/towns.json');
  return false;
};

TownBubbes('/towns/index.json');
topTownButton = document.getElementById('top-town-button');
topTownButton.addEventListener('click', topTownRender, false);





