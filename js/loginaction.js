
function loginaction(){
  $.ajax({
    type: "POST",
    url: 'Components/loginaction.cfc?method=checkuser&searchUsername='+textField.value+'&password='+password.value+'&btnid='+submitButtonId,
    cache: false,
    success: function(data){
      
      }               
    
  });
}
