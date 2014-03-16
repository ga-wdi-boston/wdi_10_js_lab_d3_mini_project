window.onload = function(){
  // d3VisualizerFunct();
  Bubbles();
  chart();

};

var Bubbles,
    chart
    rValue,
    idValue,
    rScale
    textValue,
    collisionPadding,
    minCollisionRadius,
    jitter,
    chart;

//set up the bubble properties
Bubbles = function() {
  var data, height, label, margin, maxRadius, node, width;
  width = 980;
  height = 510;
  data = [];
  node = null;
  label = null;
  maxRadius = 65;
  margin = {
    top: 5,
    right: 0,
    bottom: 0,
    left: 0
  };
};
// to scale the bubble
rScale = function(){
  d3.scale.sqrt().range([0,maxRadius]);
};
// to size the bubble
rValue = function(d) {
  return parseInt(d.repetition * 10);
};
// to set id
idValue = function(d) {
  return d.name + "_" + d.repetition;
};
// to set the text
textValue = function(d) {
  return d.name;
};

chart = function() {
  d3.json('/towns/index.json', function(error, data){
    var town_data, label, maxDomainValue, node, svg, svgEnter, rScale_val, rValue_val;
    town_data = data;
    maxDomainValue = d3.max(town_data, function(d) {
      return rValue_val = rValue(d);
    });
    rScale_val = rScale();
    rScale.domain([0, maxDomainValue]);
    svg = d3.select(this).selectAll("svg").data(town_data);
    svgEnter = svg.enter().append("svg");
    svg.attr("width", width + margin.left + margin.right);
    svg.attr("height", height + margin.top + margin.bottom);
    node = svgEnter.append("g")
                   .attr("id", "bubble-nodes")
                   .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

    node.append("rect")
        .attr("id", "bubble-background")
        .attr("width", width)
        .attr("height", height)
        .on("click", clear);

    label = d3.select(this)
              .selectAll("#bubble-labels")
              .data([town_data])
              .enter()
                .append("text")
                .attr("id", "bubble-labels")
                .text(textValue(d));
  });
};

// var d3VisualizerFunct = function(){
//   d3.json('/towns/index.json', function(error, towns){
//   var town_viz;
//   debugger;
//   town_viz = d3.select("#towns-container")
//                .selectAll("g")
//                .data(towns)
//                .enter()
//                 .append("g")
//                 .attr("class", "node");
//   });
// };
