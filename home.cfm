 <html>
    <head>
        <title> Movie Tickets, Plays, Sports, Events &amp; Cinemas near Delhi-NCR - BookMyShow Delhi-NCR.</title>
        <link rel="shortcut icon" href="Images/Icon/icon1.png">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/styles.css">       
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">                      
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>
    <cfoutput>
        <body> 
            <cfinclude template="outLook.cfm">         
            <main>          
                <div class="imageSliderContainer">
                    <div class="imageSliderBtn">
                        <button id="preve_imageBtn">
                            <i class="fa solid fa-angle-left"></i>
                        </button>  
                        <button id="next_imageBtn">
                            <i class="fa solid fa-angle-right"></i>
                        </button>  
                    </div>
                    <div class="imageSliderList">                    
                    </div>                
                </div>
                <cfinvoke component="BOOKMYSHOWNEW/Components/events" method="getEventsFromDb" returnvariable="resultEvents">
                    <cfinvokeargument name="eventId" value="0">
                </cfinvoke>                
                <div class="bestofElectronic_Container">                
                    <div class="bestofElectronic_list">
                        <div class="bestofElectronic_product_item">
                            <cfloop query="#resultEvents#">
                                <div class="bestofElectronic_items" onclick="redirectToEventDetail(#resultEvents.eventid#)">
                                    <div class="bestofElectronic_image_Product">
                                        <img src="#resultEvents.eventimg#"/>
                                    </div>
                                    <div class="bestofElectronicmoreOption">
                                        <p class="bestofElectronicProduct_name">#resultEvents.eventname#</p>                                    
                                        <p class="bestofElectronicProduct_brand">#resultEvents.eventtype#</p>
                                    </div>                        
                                </div>	
                            </cfloop>                        
                        </div>
                    </div>
                </div>            
            </main>
            <script src="js/javascript.js" type="module"></script>   
            <script src="js/scripts.js"></script>  
            <script src="js/loginaction.js"></script>         
        </body>
    </cfoutput> 
</html>