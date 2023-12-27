$(document).ready(function () {
  document.getElementById('dateDetailFilter').style.display = 'none';
  document.getElementById('languageDetailFilter').style.display = 'none';
  document.getElementById('categoriesDetailFilter').style.display = 'none';
  document.getElementById('priceDetailFilter').style.display = 'none';
});

function extractStringFromWDDX(wddxData) {
  var parser = new DOMParser();
  var xmlDoc = parser.parseFromString(wddxData, 'data');

  var structNode = xmlDoc.querySelector('string');
  if (structNode) {
    return structNode.innerHTML;
  } else {
    return null;
  }
}
function displayFilter(filtername){
  var display=document.getElementById(filtername).style.display;
  if(display=="block"){
    document.getElementById(filtername).style.display='none';
  }else{
    document.getElementById(filtername).style.display='block';
  }
}
function extractValuesFromWDDX(wddxData) {  
  var parser = new DOMParser();  
  var xmlDoc = parser.parseFromString(wddxData, 'text/xml');  
  var arrayNode = xmlDoc.querySelector('data > array');
  if (arrayNode) {
    var structNode = arrayNode.querySelector('struct');
    if (structNode) {
      var varNodes = structNode.querySelectorAll('var');
      var extractedValues = {};
      varNodes.forEach(function(varNode) {
        var varName = varNode.getAttribute('name');
        var varValue = varNode.querySelector('string, number').textContent;
        extractedValues[varName] = varValue;
      });

      return extractedValues;
    } else {
      return null;
    }
  } else {
    return null;
  }
}


function setDates(btnname){   
 
    var noofbtns = document.getElementsByClassName("filterSub");
    var datebtn="";
    var lanstr="";
    var catstr="";
    for(var i = 0; i < ((noofbtns.length)); i++){ 
      if((noofbtns[i].name==btnname) && (noofbtns[i].style.backgroundColor!="red")){
        noofbtns[i].style.backgroundColor="red";
        noofbtns[i].style.color="white";
        
      }else if((noofbtns[i].name==btnname) && (noofbtns[i].style.backgroundColor=="red")){
        noofbtns[i].style.backgroundColor="";
        noofbtns[i].style.color="";
      }
      if(noofbtns[i].style.backgroundColor=="red"){
        var datebtn= datebtn+noofbtns[i].name+',';
        var strFirstThree = noofbtns[i].name.substring(0,3);
        if(strFirstThree=="lan"){
           lanstr=lanstr+noofbtns[i].id+','; 
        }else if(strFirstThree=="cat"){
          catstr=lanstr+noofbtns[i].id+','; 
        }
      }      
    }
    if(lanstr != ""){
      lanstr = lanstr.slice(0, -1);
    }
    if(catstr != ""){
      catstr = catstr.slice(0, -1);
    }
   
    $.ajax({
      type: "POST",
      url: 'Components/events.cfc?method=setDatesSession',
      cache: false,      
      data:{btnName:datebtn,selectedLanguage:lanstr,selectedCategory:catstr},      
      success: function(response){        
        document.getElementById("eventList").innerHTML="";
        var parser = new DOMParser();
        var xmlDoc = parser.parseFromString(response, "text/xml");
        var events = [];
        var recordset = xmlDoc.querySelector("recordset");
        var rowCount = parseInt(recordset.getAttribute("rowCount"));        
        if (rowCount == 0) {
          document.getElementById("eventList").append("No Data");
        }else{
          for (var i = 0; i < rowCount; i++) {
            var event = {};
            var fields = recordset.querySelectorAll("field");
            fields.forEach(function (field, index) {
               var fieldName = field.getAttribute("name");
               var value = field.children[i].textContent;
               event[fieldName] = value;
            });
            events.push(event);
          }
        }
        var eventhtml="";
        events.forEach(function (event) {   
           eventhtml +='<div class="eventContainerListItemSub" onclick="redirectToEventDetail('+event.EVENTID+',2)">'+
                        '<div class="eventContainerListItemSub_ImageDiv">'+
                        '<img  src="'+event.EVENTIMG+'"/>'+                                                                    
                        '</div>'+
                        '<div class="eventImgDate">'+events.EVENTSTARTDATEDISPLAY+'</div>'+
                        '<div class="eventContainerListItemSub_Description">'+
                            '<p class="eventContainerListItemSub_Description_Name">'+event.EVENTNAME+'</p>'+                                    
                            '<p class="eventContainerListItemSub_Description_Name_Brand">'+event.EVENTTYPE+'</p>'+
                            '<p class="eventRs">&#x20b9;'+''+ event.PRICEPERSEAT+'</p>'+
                        '</div>'+ 
                      '</div>';
           document.getElementById("eventList").innerHTML=eventhtml;
        });        
      }
    });
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