$(document).ready(function(){

  $.get('/')
    .success(function(data) {
      console.log(data)
    });

});
