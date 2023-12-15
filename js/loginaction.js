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
    var signUpemail="";
    var username="";
    if(thisa=="phone"){
      var password=document.getElementById("pwd").value;
      var username=document.getElementById("mobileNo").value;
      var errorspanphone=document.getElementById("errorspanphone");
      if(username=="" || password==""){
        errorspanphone.textContent="Password and Mobile cant be null!!!";
        return false;
      }else if(isNaN(username)){
        errorspanphone.textContent="Phone No should be Number!!!";
        return false; 
      }
    }else if(thisa=="email"){      
      var password=document.getElementById("pwdemail").value;
      var username=document.getElementById("email").value;
      var errorspanphone=document.getElementById("errorspanemail");
      var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;     
      if(password=="" || username==""){
        errorspanphone.textContent="Password and Email cant be null!!!";
        return false;
      }else if(reg.test(username) == false){
        errorspanphone.textContent="Invalid Email!!!";
        return false;
      }   
    }else if(thisa=="signup"){            
      var username=document.getElementById("username").value;
      var signUpemail=document.getElementById("signUpemail").value;
      var password=document.getElementById("signUppwd").value;
      var errorspanphone=document.getElementById("errorSpanSignUp");
      var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
      if((password.trim().length === 0) || (username.trim().length === 0)){         
        errorspanphone.textContent="Password and username cant be null!!!";
        return false;
      }else if(reg.test(signUpemail) == false){        
        errorspanphone.textContent="Invalid Email!!!";
        return false;
      } 
    }
 
  $.ajax({
    type: "POST",
    url: 'Components/loginaction.cfc?method=signUpSignIn',
    cache: false,
    data:{username:username,password:password,signupemail:signUpemail,btnValue:thisa},
    success: function(response){  
       var retval = $(response).find("number").text(); 
      if(retval==1 && thisa!="signup"){
        window.location.href = "index.cfm";
      }else if(retval==0 && thisa=="signup"){
        alert("signup Successfull.");
        window.location.href = "index.cfm";
      }else if(retval==1 && thisa=="signup"){
        errorspanphone.textContent="Username Exists!!!";
      }else{
        errorspanphone.textContent="Wrong Credentials!!!";
      }
    }
  });
}

function redirectToEventDetail(eventid,eventtypeid){
  
  $.ajax({
    type: "POST",
    url: 'Components/loginaction.cfc?method=setEventSession',
    cache: false,
    data:{eventId:eventid,eventTypeId:eventtypeid},
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

function redirecttoseatpage(hallid,showId,eventTypeId){
  alert(hallid);
  $.ajax({
    type: "POST",
    url: 'Components/loginaction.cfc?method=setTheartreSession',
    cache: false,
    data:{hallid:hallid,showId:showId},
    success: function(response){             
      var retval = $(response).find("string").text();      
      if(eventTypeId==1){
        window.location.href="seatSelectionPage.cfm"
      }else{
        window.location.href="eventSeats.cfm"
      }      
    }
  });  
}



