 <html>
    <head>
        <title> Movie Tickets, Plays, Sports, Events &amp; Cinemas near Delhi-NCR - BookMyShow Delhi-NCR.</title>
        <link rel="shortcut icon" href="Images/Icon/icon1.png">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/styles.css">
        <link rel="stylesheet" href="css/eventbooking.css">              
        <link rel="stylesheet" href="css/font-awesome.min.css">                      
        <script src="js/jquery-3.6.0.min.js"></script>  
    </head>
    <cfoutput>        
        <body>  
            <cfinclude template="header.cfm"> 
            <cfif session.eventid>
                <cfinvoke component="BOOKMYSHOWNEW/Components/events" method="getEventsFromDb" returnvariable="resultEvents">
                        <cfinvokeargument name="eventId" value="#session.eventid#">
                        <cfinvokeargument name="eventtypeid" value="2">
                </cfinvoke>
                <main class="eventBookingBody">                            
                    <div class="eventContainer1">  
                        <div class="eventContainer2">
                            <div class="eventContainer3">
                                <cfloop query="#resultEvents#">
                                    <div class="details1">
                                        <cfset local.eventName=#resultEvents.eventname#>
                                        <cfset local.eventStartTime=#resultEvents.eventstarttime#>
                                        <cfset local.eventStartDate=#resultEvents.eventstartdatedisplay#>
                                        <cfset local.eventId=#resultEvents.eventid#>
                                        <div class="imageDiv1" onclick="redirectToEventDetail(#resultEvents.eventid#)">
                                            <div class="imageDiv2">
                                                <img src="#resultEvents.eventimg#"/>
                                            </div>                                                                                                           
                                        </div>
                                    </div>
                                </cfloop>
                            </div>                            
                        </div>    
                        <div class="eventBookBtnDiv">
                            <h3 class="eventName">#local.eventName# </h3>
                            <h3 class="eventTIme">#local.eventStartDate# at #local.eventStartTime#</h3>
                            <button data-phase="postRelease" class="bookEventBtn" onclick="redirectToTicketBooking(#local.eventId#)">
                                <div>
                                    <span>
                                        Book 
                                    </span>
                                </div>
                            </button> 
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