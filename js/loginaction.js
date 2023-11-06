
function loginaction(){
  var password=document.getElementById("pwd").value;
  var mobileNo=document.getElementById("mobileNo").value;
  alert(mobileNo);
  $.ajax({
    type: "POST",
    url: 'Components/loginaction.cfc?method=checkuser&mobileNo='+mobileNo+'&password='+password,
    cache: false,
    success: function(data){
      
      }               
    
  });
}
