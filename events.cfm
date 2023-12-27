 <html>
    <head>
        <title> Movie Tickets, Plays, Sports, Events &amp; Cinemas near Delhi-NCR - BookMyShow Delhi-NCR.</title>
        <link rel="shortcut icon" href="Images/Icon/icon1.png">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/styles.css"> 
        <link rel="stylesheet" href="css/eventfilter.css"> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">                      
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="js/eventSeats.js"></script>  
    </head>
    <cfoutput>        
        <body> 
        <cfinclude template="header.cfm"> 
            <form action="events.cfm" id="eventform" method="post">                  
                <cfset local.movieObject=createObject("component", "Components.events")>
                <cfset local.seatObject=createObject("component", "Components.seats")>
                <cfset local.resultEvents=local.movieObject.getEventsFromDb(0,2)>  
                <cfset local.resultSeats=local.seatObject.getSeatTypes(3)>
                <cfset local.resultLanguage=local.movieObject.getLanguages()>
                <cfset local.resultCategory=local.movieObject.getCategories()>
                <main class="eventDescBody">                      
                    <div class="topImageDiv">  
                        <img class="topImage" src="https://assets-in.bmscdn.com/promotions/cms/creatives/1702117592908_harishankar1240x300.jpg">
                    </div> 
                    <div class="filterDiv">
                        <div class="filterLeft">
                            <h1 class="headingEvents">Filters</h1>
                            <div class="dateFilter">
                                <div class="arrowDiv" onclick="displayFilter('dateDetailFilter')">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 15 10"><path fill="none" stroke="##666666" stroke-width="1.5" d="M335 3L342 9.5 335 16" transform="rotate(90 175.5 -158.5)"></path></svg>
                                </div>
                                <div class="flex">
                                    <div class="left1">Date</div>
                                                                        
                                </div>
                                <div class="dateDetailFilter" id="dateDetailFilter">
                                    <button type="button" class="filterSub" name="Today" id="Today" onclick="setDates(this.name)">Today</button>
                                    <button type="button" class="filterSub" name="Tomorrow"id="Tomorrow"  onclick="setDates(this.name)">Tomorrow</button>
                                </div>
                               
                            </div>
                            <div class="dateFilter">
                                <div class="arrowDiv" onclick="displayFilter('languageDetailFilter')">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 15 10"><path fill="none" stroke="##666666" stroke-width="1.5" d="M335 3L342 9.5 335 16" transform="rotate(90 175.5 -158.5)"></path></svg>
                                </div>
                                <div class="flex">
                                    <div class="left1">Languages</div>
                                                                        
                                </div>
                                <div class="dateDetailFilter" id="languageDetailFilter">
                                    <cfloop query="#resultLanguage#">
                                        <button type="button" class="filterSub" name="lan#resultLanguage.language#" id="#resultLanguage.languageid#" onclick="setDates(this.name)">#resultLanguage.language#</button>
                                    </cfloop>                                
                                </div>
                            </div>
                            <div class="dateFilter">
                                <div class="arrowDiv" onclick="displayFilter('categoriesDetailFilter')">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 15 10"><path fill="none" stroke="##666666" stroke-width="1.5" d="M335 3L342 9.5 335 16" transform="rotate(90 175.5 -158.5)"></path></svg>
                                </div>
                                <div class="flex">
                                    <div class="left1">Categories</div>                                    
                                </div>
                                <div class="dateDetailFilter" id="categoriesDetailFilter">
                                    <cfloop query="#local.resultCategory#">
                                        <button type="button" class="filterSub" name="cat#local.resultCategory.eventcategoryname#" id="#local.resultCategory.eventcategoryid#" onclick="setDates(this.name)">#local.resultCategory.eventcategoryname#</button>
                                    </cfloop>  
                                </div>
                            </div>
                            <div class="dateFilter">
                                <div class="arrowDiv" onclick="displayFilter('priceDetailFilter')">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 15 10"><path fill="none" stroke="##666666" stroke-width="1.5" d="M335 3L342 9.5 335 16" transform="rotate(90 175.5 -158.5)"></path></svg>
                                </div>
                                <div class="flex">
                                    <div class="left1">Price</div>
                                    
                                </div>
                                <div class="dateDetailFilter" id="priceDetailFilter"> 
                                    <button class="filterSub" type="button" name="Free" onclick="setDates(this.name)">Free</button>
                                    <button class="filterSub" type="button" name="0-500" onclick="setDates(this.name)">0-500</button>
                                </div>
                            </div>
                        </div>
                        <div class="filterRight">
                            <h1 class="headingEvents">Events</h1>
                            <div class="eventsList" id="eventList">
                                <cfloop query="#local.resultEvents#">
                                    <div class="eventContainerListItemSub" onclick="redirectToEventDetail(#local.resultEvents.eventid#,2)">
                                        <div class="eventContainerListItemSub_ImageDiv">
                                            <img  src="#local.resultEvents.eventimg#"/>                                            
                                        </div>
                                        <div class="eventImgDate">#local.resultEvents.eventstartdatedisplay#</div>
                                        <div class="eventContainerListItemSub_Description">
                                            <p class="eventContainerListItemSub_Description_Name">#local.resultEvents.eventname#</p>                                    
                                            <p class="eventContainerListItemSub_Description_Name_Brand">#local.resultEvents.eventtype#</p>
                                            <p class="eventRs">&##x20b9;#local.resultSeats.priceperseat#</p>
                                        </div>                        
                                    </div>
                                </cfloop>
                            </div>
                        </div>                        
                    </div>
                </main>
            </form>             
            <script src="js/loginaction.js"></script> 
        </body> 
        <cfinclude template="footer.cfm"> 
    </cfoutput>
</html>