function extractStringFromWDDX(wddxData) {
  var match = wddxData.match(/<string>(.*?)<\/string>/);
  if (match && match.length > 1) {
      return match[1]; 
  } else {
      return null; 
  }
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
    url: 'Components/loginaction.cfc?method=checkuser&mobileNo='+mobileNo+'&password='+password,
    cache: false,
    success: function(data){
      var retval = $(data).find("number").text();
      if(retval==1){
        window.location.href = "home.cfm";
      }else{
        errorspanphone.textContent="Wrong Credentials!!!"
      }
      
    }
  });
}
