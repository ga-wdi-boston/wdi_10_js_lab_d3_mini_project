$(document).ready(function(){

  d3.json('/carriers.json', function(error, data) {
    var color = d3.scale.category10();

    var carrier = d3.select('#container');

    carrier.selectAll('text')
           .data(data)
           .enter()
           .append('text')
           .text( function(data) { return data.carrier_code });

  var delay = carrier.selectAll('g')
         .data(data)
         .enter()
         .append('g')
          .selectAll('rect')
          .data(function(data) { return data.delays})
          .enter()
          .append('rect')
            .style('fill', function(delay) { return color(delay.day_of_week); })
            .attr('height', 10)
            .attr('width', 5)
            .attr('x', 5)
            .attr('y', function(delay, index) { return index * 3})
  })
});
