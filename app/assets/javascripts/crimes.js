$(document).ready(function() {

  var dispatch = d3.dispatch("load", "statechange");

  var groups = [
    //"murder_total",
    "sex_offense_total",
    "robbery_total",
    "aggravated_assault_total",
    "burglary_total",
    "motor_theft_total",
    "arson_total"
  ];

  $.get('/crimes/index.json')
        .success(function(crimes, status) {
          var crimeByYear = d3.map();
          crimes.forEach(function(d) { crimeByYear.set(d.survey_year, d); });
          dispatch.load(crimeByYear);
          dispatch.statechange(crimeByYear.get(2001));
        }.bind(this));

  // A drop-down menu for selecting a state; uses the "menu" namespace.
  dispatch.on("load.menu", function(stateById) {
    var select = d3.select("body")
      .append("div")
      .append("select")
        .on("change", function() { dispatch.statechange(stateById.get(this.value)); });

    select.selectAll("option")
        .data(stateById.values())
      .enter().append("option")
        .attr("value", function(d) { return d.survey_year; })
        .text(function(d) { return d.survey_year; });

    dispatch.on("statechange.menu", function(crime) {
      select.property("value", crime.survey_year);
    });
  });

  // A pie chart to show crime number by crime group; uses the "pie" namespace.
  dispatch.on("load.pie", function(stateByYear) {
    // initialize some basic stuff
    var width = 880,
        height = 500,
        radius = Math.min(width, height) / 2;

    var color = d3.scale.ordinal()
        .domain(groups)
        .range(["#98abc5", "#8a89a6", "#7b6888", "#6b486b", "#a05d56", "#d0743c", "#ff8c00"]);

    var arc = d3.svg.arc()
        .outerRadius(radius * 0.8)
        .innerRadius(radius * 0.5);

    var outerArc = d3.svg.arc()
        .innerRadius(radius * 0.9)
        .outerRadius(radius * 0.9);

    var pie = d3.layout.pie()
        .sort(null);

    var svg = d3.select("body").append("svg")
        .attr("width", width)
        .attr("height", height)
      .append("g")
        .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");

    svg.append("g")
      .attr("class", "slices");
    svg.append("g")
      .attr("class", "labels");
    svg.append("g")
      .attr("class", "lines");

    // do show the pie chart
    var g = svg.select('.slices').selectAll(".arc")
      .data(function(d){ return groups;})
    .enter().append("g")
      .attr("class", "arc");

    var path = g.append("path")
        .style("fill", color)
        .each(function() { this._current = {startAngle: 0, endAngle: 0}; });
    var pathText = g.append("text")
      .style("text-anchor", "middle");

    // do show the text
    var text = svg.select(".labels").selectAll("text")
        .data(groups)
      .enter()
        .append("text")
        .attr("dy", ".35em")
        .text(function(d) {
          var array = d.split('_');
          if(array.length > 2){
            return array[0] + " " + array[1] ;
          }else {
            return array[0];
          }
         });
    var polyline = svg.select('.lines').selectAll('polyline')
        .data(groups)
      .enter().append("polyline");

    dispatch.on("statechange.pie", function(d) {
      path.data(pie.value(function(g) { return d[g]; })(groups)).transition()
          .attrTween("d", function(d) {
            var interpolate = d3.interpolate(this._current, d);
            this._current = interpolate(0);
            return function(t) {
              return arc(interpolate(t));
            };
          });

      pathText.data(pie.value(function(g) { return d[g]; })(groups)).transition()
          .attr("transform", function(d) { return "translate(" + arc.centroid(d) + ")"; })
          .attr("dy", ".35em")
          .text(function(data){
            var count = 0;
            for (var i = 0; i < groups.length; i++){
              count += d[groups[i]];
            }
            return (Math.floor((data.value/count) * 100)) + "%";
          });

      text.data(pie.value(function(g) { return d[g];})(groups)).transition()
          .attrTween("transform", function(d) {
          this._current = this._current || d;
          var interpolate = d3.interpolate(this._current, d);
          this._current = interpolate(0);
          return function(t) {
            var d2 = interpolate(t);
            var pos = outerArc.centroid(d2);
            pos[0] = radius * (midAngle(d2) < Math.PI ? 1 : -1);
            return "translate("+ pos +")";
          };
        })
      .styleTween("text-anchor", function(d){
          this._current = this._current || d;
          var interpolate = d3.interpolate(this._current, d);
          this._current = interpolate(0);
          return function(t) {
            var d2 = interpolate(t);
            return midAngle(d2) < Math.PI ? "start":"end";
          };
        });

      polyline.data(pie.value(function(g) { return d[g];})(groups)).transition()
        .attrTween("points", function(d){
          this._current = this._current || d;
          var interpolate = d3.interpolate(this._current, d);
          this._current = interpolate(0);
          return function(t) {
            var d2 = interpolate(t);
            var pos = outerArc.centroid(d2);
            pos[0] = radius * 0.95 * (midAngle(d2) < Math.PI ? 1 : -1);
            if (pos[1] < -90 && pos[1] > -270){
              return [[arc.centroid(d2)[0],arc.centroid(d2)[1] - 5], outerArc.centroid(d2), pos];
            }else{
              return [[arc.centroid(d2)[0],arc.centroid(d2)[1] + 5], outerArc.centroid(d2), pos];
            }
          };
        });

    });
  });

  // Coerce population counts to numbers and compute total per state.
  function type(d) {
    d.total = d3.sum(groups, function(k) { return d[k] = +d[k]; });
    return d;
  }

  function midAngle(d) {
    return d.startAngle + (d.endAngle - d.startAngle)/2;
  }

})
//show percentage on the chart
