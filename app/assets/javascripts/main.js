window.onload = function() {

  var d3VisualizerFunct = function(){
    d3.json('/towns/index.json', function(error, towns){
    var town_viz;
    town_viz = d3.select("#towns-container")
              .selectAll("g")
              .data(towns)
              .enter()
                .append("g")
                .attr("class", "node");
    })
  };
  d3VisualizerFunct();
};
