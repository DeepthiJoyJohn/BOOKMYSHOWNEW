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
            <cfinclude template="header.cfm"> 
            <cfif session.eventid>
                <cfinvoke component="BOOKMYSHOWNEW/Components/events" method="getEventsFromDb" returnvariable="resultEvents">
                        <cfinvokeargument name="eventId" value="#session.eventid#">
                        <cfinvokeargument name="eventtypeid" value="1">

                </cfinvoke>
                <main class="eventDescBody">                            
                    <div class="bestofElectronic_Container1">  
                        <div class="bestofElectronic_list">
                            <div class="bestofElectronic_product_item">
                                <cfloop query="#resultEvents#">
                                    <div class="details">
                                        <div class="bestofElectronic_items1" onclick="redirectToEventDetail(#resultEvents.eventid#)">
                                            <div class="bestofElectronic_image_Product">
                                                <img src="Images/EventImages/#resultEvents.eventimg#"/>
                                            </div>
                                            <div class="bestofElectronicmoreOption">
                                                <p class="bestofElectronicProduct_name1">In Cinemas</p>
                                            </div>                                                               
                                        </div>	
                                        <div class="detailssub">
                                            #resultEvents.eventname#
                                            <div class="detailssubratings">                                            
                                                <i class="fa fa-star red" aria-hidden="true"></i>#resultEvents.eventratings#/10
                                            </div>
                                            <div class="FLEX">
                                                <div class="diGRHt">
                                                    #resultEvents.eventdimension#
                                                </div>
                                                <div class="diGRHt">
                                                    #resultEvents.eventlanguage#
                                                </div>    
                                            </div>
                                            <div class="FLEX">
                                                <div class="detailssubratings1">
                                                #resultEvents.Hours#h #resultEvents.Minutes#m . #resultEvents.eventtype# .#resultEvents.releasedate#
                                                </div>                                        
                                            </div>  
                                            <button data-phase="postRelease" class="bGKFux" onclick="redirectToTicketBooking(#resultEvents.eventid#)">
                                                <div>
                                                    <span>
                                                        Book tickets
                                                    </span>
                                                </div>
                                            </button>
                                        </div>                                     
                                    </div>
                                </cfloop>                        
                            </div>
                        </div>
                    </div> 
                </main>
            </cfif>
            <script src="js/javascript.js" type="module"></script>   
            <script src="js/scripts.js"></script>  
            <script src="js/loginaction.js"></script>         
        </body> 
        <cfinclude template="footer.cfm"> 
    </cfoutput>
</html>