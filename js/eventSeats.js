$(document).ready( function() {
  
})

function bookEventSeats(){
  alert("d");
  $.ajax({
        type: "POST",
        url: 'Components/seats.cfc?method=bookEventSeats',
        cache: false,
        success: function(){          
          
        }
      });
  };