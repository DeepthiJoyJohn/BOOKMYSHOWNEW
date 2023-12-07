function extractStringFromWDDX(wddxData) {
  var match = wddxData.match(/<string>(.*?)<\/string>/);
  if (match && match.length > 1) {
      return match[1]; 
  } else {
      return null; 
  }
}
function redirectToTicketBooking(){
  $.ajax({
    type: "POST",
    url: 'Components/loginaction.cfc?method=setDateSession',
    cache: false,
    success: function(data){      
      window.location.href="bookTickets.cfm";      
    }
  });
	
}

function loginwithgoogle(){  
  $.ajax({
    type: "POST",
    url: 'Components/loginaction.cfc?method=loginwithgoogle',
    cache: false,
    success: function(data){      
      var retval = $(data).find("string").text();
      window.location.href=retval;
      
    }
  });
}

function loginaction(thisa){  
  
    if(thisa=="phone"){
      var password=document.getElementById("pwd").value;
      var mobileNo=document.getElementById("mobileNo").value;
      var errorspanphone=document.getElementById("errorspanphone");
      if(mobileNo=="" || password==""){
        errorspanphone.textContent="Password and Mobile cant be null!!!";
        return false;
      }else if(isNaN(mobileNo)){
        errorspanphone.textContent="Phone No should be Number!!!";
        return false; 
      }
    }else if(thisa=="email"){      
      var password=document.getElementById("pwdemail").value;
      var mobileNo=document.getElementById("email").value;
      var errorspanphone=document.getElementById("errorspanemail");
      var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;     
      if(password=="" || mobileNo==""){
        errorspanphone.textContent="Password and Email cant be null!!!";
        return false;
      }else if(reg.test(mobileNo) == false){
        errorspanphone.textContent="Invalid Email!!!";
        return false;
      }   
    }
 
  $.ajax({
    type: "POST",
    url: 'Components/loginaction.cfc?method=checkuser',
    cache: false,
    data:{mobileNo:mobileNo,password:password},
    success: function(response){    
      alert(response)  ;
      var retval = $(response).find("number").text();      
      if(retval==1){
        window.location.href = "index.cfm";
      }else{
        errorspanphone.textContent="Wrong Credentials!!!"
      }
      
    }
  });
}

function redirectToEventDetail(eventid,eventtypeid){
  
  $.ajax({
    type: "POST",
    url: 'Components/loginaction.cfc?method=setEventSession',
    cache: false,
    data:{eventId:eventid},
    success: function(response){   
      var retval = $(response).find("string").text();      
      if(retval==1 && eventtypeid==1){
        window.location.href="eventDesc.cfm";
      }else{
        window.location.href="eventBooking.cfm";
      }
      
    }
  });  
}

function displayLogOutDiv(){
	window.open("index.cfm");
}
function refreshpage(){
  window.location.refresh();
}

function redirecttoseatpage(hallid,showId){
  alert(hallid);
  $.ajax({
    type: "POST",
    url: 'Components/loginaction.cfc?method=setTheartreSession',
    cache: false,
    data:{hallid:hallid,showId:showId},
    success: function(response){             
      var retval = $(response).find("string").text();      
      if(retval==1){
        window.location.href="seatSelectionPage.cfm"
      }else{
       
      }      
    }
  });  
}



