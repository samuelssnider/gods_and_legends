
var dropDown = function() {
  console.log(1);
}

$(document).ready(function(){
  $('button[name="dd-nav-button"]').on('click', dropDown);
  
  window.onclick = function(event) {
    if (!event.target.matches('.dropbtn')) {

      var dropdowns = document.getElementsByClassName("dropdown-content");
      for (var i = 0; i < dropdowns.length; i++) {
        var openDropdown = dropdowns[i];
        if (openDropdown.classList.contains('show')) {
          openDropdown.classList.remove('show');
        }
      }
    }
  }
})

function myFunction() {
    document.getElementById("myDropdown").classList.toggle("show");
}