$(document).ready(function () {
  document.getElementById("btncontinue").style.display="none";  
  document.getElementById("phonepopupdiv").style.display="none";  
  document.getElementById("emailpopupdiv").style.display="none"; 
  document.getElementById("signUpDiv").style.display="none";   
  document.getElementById("btncontinue").setAttribute("disabled", "disabled");

});
function checklength(){
	var lengthofmob=document.getElementById("mobileNo").value;
  if(lengthofmob.length==10 && (!isNaN(lengthofmob))){
    document.getElementById("btncontinue").removeAttribute("disabled");
    document.getElementById("btncontinue").style.backgroundColor="rgb(248, 68, 100)";
    document.getElementById("btncontinue").style.display="block";
  }else{
    document.getElementById("btncontinue").setAttribute("disabled", "disabled");
    document.getElementById("btncontinue").style.backgroundColor="";
    document.getElementById("btncontinue").style.display="none";
  }
}


$('body').click(function(event){
  var mobval=document.getElementById("mobileNo").value;
  if(event.target.id=="mobileNo")
    document.getElementById("btncontinue").style.display="block";
  else
  document.getElementById("btncontinue").style.display="none";
});
function closeLoginPopup() {  
  window.location.reload();
  document.getElementById("loginPopup").style.display = "none";
}
function showLoginPopup() {
  var errorText = document.getElementById("errorText");
  errorText.textContent="";
  document.getElementById("loginPopup").style.display = "block";
  document.getElementById("newsignup").style.display = "block"; 
  document.getElementById("login_btn").style.display = "block"; 
}
function showSignupPopup() {
  var errorText = document.getElementById("errorText");  
  errorText.textContent=""; 
  document.getElementById("loginPopup").style.display = "block";
  document.getElementById("newsignup").style.display = "none"; 
  document.getElementById("signupview").style.display = "block";
  document.getElementById("signupview1").style.display = "block";  
  document.getElementById("leftlogin").style.display = "none"; 
  document.getElementById("login_btn").style.display = "none"; 
  document.getElementById("signupbtn").style.display = "block"; 
  document.getElementById("signUpDiv").style.display = "none"; 
  
}
function showSignUpDiv(){
  document.getElementById("loginPopup").style.display = "block";
  document.getElementById("mainpopupdiv").style.display = "none";    
  document.getElementById("signUpDiv").style.display = "block";

}
function hideSignupPopup(){
  document.getElementById("signupview").style.display = "none";
  document.getElementById("signupview1").style.display = "none";  
  document.getElementById("leftlogin").style.display = "block"; 
  document.getElementById("login_btn").style.display = "block"; 
  document.getElementById("signupbtn").style.display = "none";
  document.getElementById("newsignup").style.display = "block";   
}

document.getElementById("loginform").onsubmit = function(event) {       
  var submitButtonId = event.submitter.id; 
  event.preventDefault(); 
};
function logout(){  
  
  $.ajax({
    type: "POST",
    url: 'Components/loginaction.cfc?method=clearSessionData',
    cache: false,
    success: function(data){      
      window.location.href = "index.cfm";       
    },
  });
}
function hide(){
  document.getElementById("mainpopupdiv").style.display="none";
  document.getElementById("phonepopupdiv").style.display="block";

}
function redirecttopopup(){
  document.getElementById("phonepopupdiv").style.display="none";
  document.getElementById("mainpopupdiv").style.display="block";
  document.getElementById("emailpopupdiv").style.display="none";
  document.getElementById("signUpDiv").style.display="none";
}
function displayemailpopup(){
  document.getElementById("mainpopupdiv").style.display="none";
  document.getElementById("phonepopupdiv").style.display="none";
  document.getElementById("emailpopupdiv").style.display="block";
}