
var dropDown = function() {
  console.log(1);
}

$(document).ready(function(){
  $('button[name="dd-nav-button"]').on('click', dropDown);
})