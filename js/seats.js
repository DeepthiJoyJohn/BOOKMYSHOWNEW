$(document).ready( function() {
  document.getElementById("payamt").style.display="none";
})
function setSeatStatus(seatid){
  var classname=document.getElementById(seatid).className;
  if(classname=="seatbtn"){
		document.getElementById(seatid).className='selectedbtn';
	}else{
		document.getElementById(seatid).className='seatbtn';
	}
  var slides = document.getElementsByClassName("selectedbtn");
  var amt=0.0;
  for(var i = 0; i < ((slides.length)-1); i++){
    {
			amt=amt+(slides[i].value*1);
		}    
  }
  if(amt>0){
    document.getElementById('payamt').innerHTML="Book & Pay Amt- "+amt;
    document.getElementById("payamt").style.display="block";
  }else{
    document.getElementById("payamt").style.display="none";
  } 

}
function bookSeats(){
  var slides = document.getElementsByClassName("selectedbtn");
  var noofseats=(slides.length)-1;  
  var amt=0.0;
  var seatid="";
  for(var i = 0; i < ((slides.length)-1); i++){    
			amt=amt+(slides[i].value*1);
      seatid=slides[i].id;
      $.ajax({
        type: "POST",
        url: 'Components/seats.cfc?method=seatUpdation',
        cache: false,
        data:{amt:amt,seatid:seatid},
        success: function(){          
          
        }
      });
		}    
  
  $.ajax({
    type: "POST",
    url: 'Components/seats.cfc?method=booking',
    cache: false,
    data:{noOfSeats:noofseats,amt:amt},
    success: function(response){   
      alert("Booking Successfull");          
      window.location.href = 'seatSelectionPage.cfm';
    }
  });
}

const spanEvent = document.querySelectorAll('.addMinusBtn');
spanEvent.forEach(container => {
  const quantityInput = container.querySelector('.quantity-input');
  const plusButton = container.querySelector('.plus-button');
  const minusButton = container.querySelector('.minus-button');
  alert("d");
})