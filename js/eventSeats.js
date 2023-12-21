 $(document).ready(function () {
  document.getElementById('dateDetailFilter').style.display = 'none';
  document.getElementById('languageDetailFilter').style.display = 'none';
  document.getElementById('categoriesDetailFilter').style.display = 'none';
  document.getElementById('moreDetailFilter').style.display = 'none';
  document.getElementById('priceDetailFilter').style.display = 'none';
});

function displayFilter(filtername){
  var display=document.getElementById(filtername).style.display;
  if(display=="block"){
    document.getElementById(filtername).style.display='none';
  }else{
    document.getElementById(filtername).style.display='block';
  }
}

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
