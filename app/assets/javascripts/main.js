$(document).ready(function(){

  $.get('/employees/index.json')
    .success(function(data) {
      console.log(data[0])
      console.log("success! first object above")
    });

});
