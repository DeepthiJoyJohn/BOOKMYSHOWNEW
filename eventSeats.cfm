 <html>
    <head>
        <title> Movie Tickets, Plays, Sports, Events &amp; Cinemas near Delhi-NCR - BookMyShow Delhi-NCR.</title>
        <link rel="shortcut icon" href="Images/Icon/icon1.png">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/styles.css">       
        <link rel="stylesheet" href="css/ticketbooking.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"/> 
        <script src="js/jquery-3.6.0.min.js"></script> 
    </head>   
    <cfoutput> 
        <body>  
            <form>       
                <cfif session.eventid NEQ "">
                    <cfinvoke component="BOOKMYSHOWNEW/Components/events" method="getEventsFromDb" returnvariable="resultEvents">
                        <cfinvokeargument name="eventId" value="#session.eventid#">
                        <cfinvokeargument name="eventtypeid" value="#session.eventTypeId#">
                    </cfinvoke>
                    <cfinvoke component="BOOKMYSHOWNEW/Components/events" method="getEventHalls" returnvariable="resultEventHalls">                    
                    </cfinvoke>    
                    <cfinvoke component="BOOKMYSHOWNEW/Components/events" method="getShowTime" returnvariable="resultShowTime">  
                        <cfinvokeargument  name="hallid" value="#session.Hallid#">                 
                    </cfinvoke>
                    <section class="movie-details-seatbooking">
                        <div class="fix-height-div">
                            <div class="top-section-container">
                                <div class="movie-details-container"> 
                                    <div class="text-details">  
                                        <div class="cinema-name-container1">                    
                                            <a href="bookTickets.cfm" class="cinema-name-container1">
                                                <div class="header-container">
                                                    <h2>
                                                        <div>
                                                            <i class='fas fa-angle-left'></i>
                                                            <span class="__event-name">
                                                                <a class="sa">#resultEvents.eventname#</a>
                                                                <a class="sa1">#resultEventHalls.eventHallName#</a>
                                                                <a class="sa1">#resultShowTime.showtime#</a>
                                                                <a class="sa1">#resultShowTime.showdate#</a>
                                                            </span>
                                                        </div>
                                                    </h2>
                                                </div>							
                                            </a>
                                        </div> 
                                    </div>
                                </div> 
                            </div> 
                        </div>               
                    </section>   
                    <cfinvoke component="BOOKMYSHOWNEW/Components/seats" method="getSeatTypes" returnvariable="resultSeatTypes"> 
                    </cfinvoke>
                    <cfinvoke component="BOOKMYSHOWNEW/Components/seats" method="getSoldSeats" returnvariable="resultSoldSeats"> 
                    </cfinvoke>                   
                    <section class="bkf-container _seat">
                        <div class="eventBookHead">SELECT YOUR CATEGORY</div>
                        <div class="seats">
                            <table>
                                <tbody>                                    
                                    <cfloop query="resultSeatTypes"> 
                                        <cfinvoke component="BOOKMYSHOWNEW/Components/seats" method="getEventSeatCount" returnvariable="resultEventSeatCount">
                                            <cfinvokeargument name="seatTypeId" value="#resultSeatTypes.seattypeid#">
                                        </cfinvoke>
                                        <cfset local.seatCountTxt = 0>                                                                                                                                                                                                                                                                                                          
                                        <tr>
                                            <td class="seatP" colspan="11">#resultSeatTypes.seattype#-Rs.#resultSeatTypes.priceperseat#<td>                                                                                                                     
                                        </tr>  
                                        <tr>
                                            <td>                                            
                                                <div class="addMinusBtn">
                                                    <cfif local.seatCountTxt gt 0>
                                                        <button class="minus-button" name="minus-button" value="#resultEventSeatCount#">-</button>
                                                        <input class="quantity-input"  type="text" id="" value="#local.seatCountTxt#">
                                                        <button class="plus-button" name="plus-button" value="#resultEventSeatCount#">+</button>
                                                    <cfelse>
                                                        <button class="addBtn" type="submit" name="addSeat" id="">Add</button>
                                                    </cfif>
                                                </div>
                                            </td>   
                                        </tr>
                                    </cfloop>                                                                  
                                </tbody>
                            </table>
                        </div>
                        <div>
                            <button class="btnProceed"  onclick="loginaction(`email`)">Book</button>
                        </div>
                    </section>                             
                </cfif>   
                <script src="js/javascript.js" type="module"></script>   
                <script src="js/scripts.js"></script>              
                <script src="js/loginaction.js"></script>
                <script src="js/seats.js"></script>   
            </form>
        </body> 
        <cfinclude template="footer.cfm"> 
    </cfoutput>
</html>