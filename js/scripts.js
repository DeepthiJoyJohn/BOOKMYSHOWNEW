$(document).ready(function () {
  document.getElementById("btncontinue").style.display="none";  
  document.getElementById("phonepopupdiv").style.display="none";  
  document.getElementById("emailpopupdiv").style.display="none";  
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
  var textField = document.getElementById("userid");
  var password = document.getElementById("password");
  var signupbtn= document.getElementById("signupbtn");
  var login_btn= document.getElementById("login_btn");
  var errorText = document.getElementById("errorText");
  var errorText1 = document.getElementById("errorText1");
  var errorText3 = document.getElementById("errorText3");
  var flag=0;
  errorText.textContent="";
  errorText1.textContent="";
  errorText3.textContent="";
  if (textField.value.trim() === "") {
    // The text field is empty, display the error message
    errorText.textContent = "Field cannot be empty!";
    textField.style.border = "1px solid red";    
    flag=1;    
  } else {
    // The text field is not empty, clear the error message and reset the border
    errorText.textContent = "";
    textField.style.border = "1px solid #ccc";
  }
  if (password.value.trim() === "") {
    // The text field is empty, display the error message
    errorText1.textContent = "Field cannot be empty!";
    password.style.border = "1px solid red";
    flag=1;
  } else {
    // The text field is not empty, clear the error message and reset the border
    errorText1.textContent = "";
    password.style.border = "1px solid #ccc";
  }
  
  if(login_btn){   
    if(flag==0){      
          $.ajax({
            type: "GET",
            url: 'Components/login.cfc?method=checkuser&searchUsername='+textField.value+'&password='+password.value+'&btnid='+submitButtonId,
            cache: false,
            success: function(data){
              $('#errorText3').html(data);	
              var html = document.getElementById("errorText3").textContent;   
              if(html==""){                
                // document.getElementById("loginPopup").style.display = "none";
                // document.getElementById("loginBtn").style.display = "none";
                // document.getElementById("login_menu_top_id").style.display = "none";
                // document.getElementById("myaccountbtn").style.display = "block";
                // document.getElementById("a_logout").style.display = "flex";
                window.location.href = "myaccount.cfm";
              }               
            },
          });
    }
  }
};
function logout(){  
  $.ajax({
    type: "GET",
    url: 'Components/SessionManager.cfc?method=clearSessionData',
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
}
function displayemailpopup(){
  document.getElementById("mainpopupdiv").style.display="none";
  document.getElementById("phonepopupdiv").style.display="none";
  document.getElementById("emailpopupdiv").style.display="block";
}