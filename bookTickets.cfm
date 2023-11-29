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
   <cfset session.todaydate=now()> 
    <cfoutput>        
        <body>           
            <cfinclude template="outLook.cfm"> 
            <cfinvoke component="BOOKMYSHOWNEW/Components/events" method="getEventsFromDb" returnvariable="resultEvents">
                    <cfinvokeargument name="eventId" value="#session.eventid#">
            </cfinvoke>
            <section class="movie-details">
                <div class="fix-height-div">
                    <div class="top-section-container">
                        <div class="movie-details-container"> 
                            <div class="text-details">   
                                <h1>
                                    <div class="cinema-name-container">                    
                                        <a href="toeventdetailspage" class="cinema-name-container">
                                            #resultEvents.eventname#-#resultEvents.eventlanguage#								
                                        </a>
                                    </div> 
                                </h1> 
                            </div>
                        </div> 
                    </div> 
                </div>               
            </section>  
            <form id="dateContainerForm" action="bookTickets.cfm" method="post"> 
                <cfoutput>#session.todaydate#</cfoutput>                 
                <cfif StructKeyExists(form,"preveBtnDate")>
                    <cfif session.todaydate GT now()>
                        <cfset session.todaydate = dateAdd('d', -1, session.todaydate)>	
                    </cfif> 
                <cfelseif  StructKeyExists(form,"nextBtnDate")>
                    <cfif dateFormat(session.todaydate,"yyyy-mm-dd") LT dateFormat(resultEvents.enddate,"yyyy-mm-dd")>
                        <cfset session.todaydate = dateAdd('d', 1, session.todaydate)>	
                    </cfif>
                </cfif> 

                <cfinvoke component="BOOKMYSHOWNEW/Components/events" method="getDateRangeOfEvents" returnvariable="resultDateRange">
                    <cfinvokeargument name="eventId" value="#session.eventid#">                
                </cfinvoke>      
                <div class="datecontainer">
                    <ul class="date-list">
                        <button type="Submit" name="preveBtnDate" id="preve_imageBtnDate" class="btnDateArrow">
                            <i class="fa fa-angle-left fa-2xl" id="preBtn"></i>
                        </button> 
                        <cfloop from="1" to="#arrayLen(resultDateRange)#" index="i">
                            <cfif dateFormat(resultDateRange[i],"yyyy-mm-dd") EQ dateFormat(now(),"yyyy-mm-dd")>
                                <li class="date-item active">
                                    <span class="day">#dateFormat(resultDateRange[i],"ddd")#</span>
                                    <span class="date"> #dateFormat(resultDateRange[i],"dd")#</span>
                                    <span class="month">#dateFormat(resultDateRange[i],"MMM")#</span>
                                </li>
                            <cfelse>
                                <li class="date-item ">
                                    <span class="day">#dateFormat(resultDateRange[i],"ddd")#</span>
                                    <span class="date"> #dateFormat(resultDateRange[i],"dd")#</span>
                                    <span class="month">#dateFormat(resultDateRange[i],"MMM")#</span>
                                </li>
                            </cfif>
                        </cfloop>
                        <button type="submit" name="nextBtnDate" id="next_imageBtnDate"  class="btnDateArrow">
                            <i class="fa solid fa-angle-right fa-2xl" id="preBtn1"></i>
                        </button>
                    <ul>
                </div>
            </form>
            <div class="attributes-container">
                <div class="offer-details-container legends-section">
                </div>
                <div class="legends-container">
                    <div class="showtimes-legend">
                        <div class="legend-icon"></div>
                        <div class="legend-text">Available</div>
                    </div>
                    <div class="showtimes-legend">
                        <div class="legend-icon fast"></div>
                        <div class="legend-text">Fast Filling</div>
                    </div>
                    <div class="showtimes-legend">
                        <div class="__subtitle">LAN</div>
                        <div class="legend-text">Subtitles Language</div>
                    </div>
                </div>
            </div> 
            <ul class="venuelist">                    
                <li class="list">
                    <i class="fa fa-heart-o red"></i>fdhfdh
                    <div class="info-section">
                        <img src="https://in.bmscdn.com/moviemode/cinemaphotoshowcase/info.png" class="venue-info-icon lazy">
                        <div class="venue-info-text">INFO</div>
                    </div>
                    <div class="unpaid-mticket-wrapper">	
                        <div class="__mticket-info">
                            <span class="icon">
                                <i class="fa fa-mobile" aria-hidden="true"></i>
                            </span>
                            <label>M-Ticket</label>                                
                        </div>	
                        <div class="__fnb-info ">
                            <span class="icon">   
                                <i class='fa-solid fa-burger'></i>                                 
                            </span>
                            <label>Food &amp; Beverage</label>
                        </div>
                    </div>	
                    <!---<div class="showtime-pill-wrapper">--->
                        <div class="showtime-pill-container">
                            <a class="showtime-pill">
                                <div class="__details">
                                    <div class="__text">
                                        11:10 AM
                                    </div>
                                </div>	
                            </a>	
                        </div>
                    <!---</div>	--->
                    <div class="venue-flags">
                        <span class="gold-icon"></span>
                        <span class="venue-flags-details">Non-cancellable</span>
                    </div>	
                </li>                    
                <li class="list"><i class="fa fa-heart-o red"></i>cndcn</li>
            </ul> 
            <script src="js/javascript.js" type="module"></script>   
            <script src="js/scripts.js"></script>  
            <script src="js/loginaction.js"></script>   
        </body> 
    </cfoutput>
</html>