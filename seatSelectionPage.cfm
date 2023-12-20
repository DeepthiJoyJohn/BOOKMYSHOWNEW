 <html>
    <head>
        <title> Movie Tickets, Plays, Sports, Events &amp; Cinemas near Delhi-NCR - BookMyShow Delhi-NCR.</title>
        <link rel="shortcut icon" href="Images/Icon/icon1.png">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/styles.css">       
        <link rel="stylesheet" href="css/ticketbooking.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />                      
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>   
    <cfoutput> 
        <body>         
            <cfif session.eventid NEQ "">
                <cfinvoke component="BOOKMYSHOWNEW/Components/events" method="getEventsFromDb" returnvariable="resultEvents">
                    <cfinvokeargument name="eventId" value="#session.eventid#">
                    <cfinvokeargument name="eventtypeid" value="1">
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
                    <cfinvokeargument name="seatTypeId" value="0">
                </cfinvoke>
                <cfinvoke component="BOOKMYSHOWNEW/Components/seats" method="getSoldSeats" returnvariable="resultSoldSeats"> 
                </cfinvoke>
                              
                <section class="bkf-container _seat">
                    <div class="seats">
                        <table>
                            <tbody>
                                <cfloop query="resultSeatTypes">                                                                                                                   
                                    <tr>
                                        <td class="seatP" colspan="11" >#resultSeatTypes.seattype#-Rs.#resultSeatTypes.priceperseat#<td>                                                                                
                                    </tr>   
                                    <tr>
                                        <td colspan="11">-</td>
                                    </tr>                                     
                                    <tr>                                                                                                                       
                                        <cfloop from="1" to="#resultSeatTypes.noofseats#" index="i">  
                                            <cfset local.btnclass="seatbtn">
                                            <cfset local.disable="">
                                            <cfif ArrayContains(resultSoldSeats, "#resultSeatTypes.seattypeid##i#")>
                                                <cfset local.btnclass="soldbtn">
                                                <cfset local.disable="disabled"> 
                                            </cfif>                                                                                    
                                            <td><button class="#local.btnclass#" id="#resultSeatTypes.seattypeid##i#" #local.disable# onclick="setSeatStatus(this.id)" value="#resultSeatTypes.priceperseat#">#i#</button></td>
                                                <cfif i%10 eq 0>
                                                    </tr>
                                                    <tr></td>
                                                </cfif>                                            
                                        </cfloop>   
                                    </tr>          
                                </cfloop>                                
                            </tbody>
                        </table>
                    </div>
                </section>  
                <table class="btntable">
                    <tr>
                        <td><button class="seatbtn"></button><span class="spanbtn"> available</span></td>
                        <td><button class="selectedbtn"></button><span class="spanbtn"> selected</span></td>
                        <td><button class="soldbtn"></button><span class="spanbtn"> sold</span></td>
                    </tr>													
                    <tr>
                        <td colspan="3" ><button type="button"  id="payamt" class="paybtn" onclick="bookSeats()"></button></td>
                    </tr>
				</table>             
            </cfif>   
            <script src="js/javascript.js" type="module"></script>   
            <script src="js/scripts.js"></script>  
             <script src="js/seats.js"></script>  
            <script src="js/loginaction.js"></script>   
        </body> 
        <cfinclude template="footer.cfm"> 
    </cfoutput>
</html>