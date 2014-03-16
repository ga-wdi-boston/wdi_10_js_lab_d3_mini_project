var DataApp = DataApp || {};

DataApp.init = function () {
  DataApp.getData('/countries', DataApp.drawLines);
  console.log("this in init is " + this)
  $(".countries_list").on("click", function (event) {
    event.preventDefault;

    var id = $(event.target).attr("data");
    DataApp.getData('/countries/' + id, DataApp.redrawLines);
    console.log(id + " was clicked!");
  });
};

DataApp.getData = function (url, callback) {
  // set data_sets to empty arrays
  DataApp.population = [];
  DataApp.itUsersP2 = [];
  DataApp.itBroadbandP2 = [];
  DataApp.itCellP2 = [];

  var success = function (error, data) {
    var map = d3.map(data.years);

    map.forEach(function (index, d) {
      // organize data
      switch (d.indicator.code) {
        case "SP.POP.TOTL":
          DataApp.population.push({
            name: "Population (Total)",
            year: d.name,
            value: d.value
          });
          break;
        case "IT.NET.USER.P2":
          DataApp.itUsersP2.push({
            name: "Internet Users (%)",
            year: d.name,
            value: d.value
          });
          break;
        case "IT.NET.BBND.P2":
          DataApp.itBroadbandP2.push({
            name: "Broadband Subscribers (%)",
            year: d.name,
            value: d.value
          });
          break;
        case "IT.CEL.SETS.P2":
          DataApp.itCellP2.push({
            name: "Cell Subscribers (%)",
            year: d.name,
            value: d.value
          });
          break;
        default:
          console.log("Not needed.")
          break;
      }
    });

    callback();
  };

  // get the data and do something with it
  d3.json(url, success);
};

DataApp.redrawLines = function (event) {
  // set the min and max values for the scale domains
  DataApp.x.domain(d3.extent(DataApp.itCellP2, function(d) { return d.year; }));
  DataApp.y.domain(d3.extent(DataApp.itCellP2, function(d) { return d.value; }));

  // Update the valueline path of lines
  DataApp.svg.selectAll('path.line')
    .transition()
      .duration(1000)
      .attr("d", DataApp.line(DataApp.itUsersP2));

  DataApp.svg.selectAll('path.broad')
    .transition()
      .duration(1000)
      .attr("d", DataApp.line(DataApp.itBroadbandP2));

  DataApp.svg.selectAll('path.cell')
    .transition()
      .duration(1000)
      .attr("d", DataApp.line(DataApp.itCellP2));

  DataApp.svg.select("g.x")
      .call(DataApp.xAxis);


  DataApp.svg.select("g.y")
      .call(DataApp.yAxis);

};

DataApp.drawLines = function () {
  DataApp.margin = {top: 20, right: 20, bottom: 30, left: 50};
  DataApp.width = 960 - DataApp.margin.left - DataApp.margin.right;
  DataApp.height = 500 - DataApp.margin.top - DataApp.margin.bottom;
  // Define scales
  DataApp.x = d3.scale.linear()
      .range([0, DataApp.width]);

  DataApp.y = d3.scale.linear()
      .range([DataApp.height, 0]);

  // Set up generators
  DataApp.xAxis = d3.svg.axis()
      .scale(DataApp.x)
      .orient("bottom");

  DataApp.yAxis = d3.svg.axis()
      .scale(DataApp.y)
      .orient("left");

  DataApp.line = d3.svg.line()
      .x(function (d) { return DataApp.x([d.year]); })
      .y(function (d) { return DataApp.y([d.value]); });

  // setup svg
  DataApp.svg = d3.select("#container").append("svg")
      .attr("width", DataApp.width + DataApp.margin.left + DataApp.margin.right)
      .attr("height", DataApp.height + DataApp.margin.top + DataApp.margin.bottom)
    .append('g')
      .attr("transform", "translate(" + DataApp.margin.left + "," + DataApp.margin.top + ")");

  // set the min and max values for the scale domains
  DataApp.x.domain(d3.extent(DataApp.itCellP2, function(d) { return d.year; }));
  DataApp.y.domain(d3.extent(DataApp.itCellP2, function(d) { return d.value; }));

  // call axis generators and append
  DataApp.svg.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(0, " + DataApp.height + ")")
      .call(DataApp.xAxis);
  DataApp.svg.append("g")
      .attr("class", "y axis")
      .call(DataApp.yAxis)
    .append("text")
      .attr("transform", "rotate(-90)")
      .attr("y", 6)
      .attr("dy", ".71em")
      .style("text-anchor", "end")
      .text("Percentage (%)");

  DataApp.svg.append("path")
      .datum(DataApp.itUsersP2)
      .attr("class", "line")
      .attr("d", DataApp.line)
      .transition()
      .duration(500);

  DataApp.svg.append("path")
      .datum(DataApp.itBroadbandP2)
      .attr("class", "broad")
      .attr("d", DataApp.line)
      .transition()
      .duration(500);

  DataApp.svg.append("path")
      .datum(DataApp.itCellP2)
      .attr("class", "cell")
      .attr("d", DataApp.line)
      .transition()
      .duration(500);
}
