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

// function setDates(btnname){
//   $.ajax({
//     type: "POST",
//     url: 'Components/events.cfc?method=setDatesSession',
//     cache: false,
//     data:{btnName:btnname},
//     success: function(response){ 
//       alert(response);
//       var extractedValues = extractValuesFromWDDX(response);
//       Object.keys(extractedValues).forEach(function(key) {
//         alert(extractedValues[key]);
//         if(key=="eventid"){
//           var eventid=extractedValues[key];
//         }else if(key=='eventimg'){
//           var eventimg=extractedValues[key];
//         }       
//         var elements=document.getElementsByClassName("eventsList");  
//         for (var i = 0; i < elements.length; i++) {
//           elements[i].innerHTML = `<div class="eventContainerListItemSub" onclick="redirectToEventDetail(eventid,2)">
//                                       <div class="eventContainerListItemSub_ImageDiv">
//                                           <img  src="${eventimg}"/>                                            
//                                       </div>
//                                     </div>`;
//         }
        
//       });
      
//     }
//   });
// }
function setDates(btnname){
  alert(btnname);
    $.ajax({
      type: "POST",
      url: 'Components/events.cfc?method=setDatesSession',
      cache: false,      
      data:{btnName:btnname},      
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
              alert(event.EVENTID); 
           eventhtml ='<div class="eventContainerListItemSub" onclick="redirectToEventDetail('+event.EVENTID+',2)">'+
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