<html>
    <head>
        <title> Movie Tickets, Plays, Sports, Events &amp; Cinemas near Delhi-NCR - BookMyShow Delhi-NCR.</title>
        <link rel="shortcut icon" href="Images/Icon/icon1.png">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/styles.css">
        <link rel="stylesheet" href="css/all.css">
        <link rel="stylesheet" href="css/login.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <script src="js/loginaction.js"></script>
        <script src="js/jquery-3.6.0.min.js"></script>          
    </head>
    <body>
        <cfinclude template="header.cfm">  
        <cfset local.movieObject=createObject("component", "Components.events")> 
        <cfset local.resultMovies=local.movieObject.getEventsFromDb(0,1)>
        <cfset local.resultEvents=local.movieObject.getEventsFromDb(0,2)>
        <main> 
        <cfoutput>     
            <div class="imageSliderContainer">
                <div class="imageSliderBtn">
                    <button id="preve_imageBtn">
                        <i class="fa fa-angle-left"></i>
                    </button>  
                    <button id="next_imageBtn">
                        <i class="fa fa-angle-right"></i>
                    </button>  
                </div>
                <div class="imageSliderList">                    
                </div>                
            </div>
            <div class="MovieMainHeading">
                <h2>
                    Recommended Movies
                </h2>
            </div>
            <div class="eventContainer">                
                <div class="eventContainerList">
                    <div class="eventContainerListItem">
                        <cfloop query="#local.resultMovies#">
                            <div class="eventContainerListItemSub" onclick="redirectToEventDetail(#local.resultMovies.eventid#,1)">
                                <div class="eventContainerListItemSub_ImageDiv">
                                    <img src="#local.resultMovies.eventimg#"/>
                                </div>
                                <div class="eventContainerListItemSub_Description">
                                    <p class="eventContainerListItemSub_Description_Name">#local.resultMovies.eventname#</p>                                    
                                    <p class="eventContainerListItemSub_Description_Name_Brand">#local.resultMovies.eventtype#</p>
                                </div>                        
                            </div>	
                        </cfloop>                        
                    </div>
                </div>
            </div> 
            <div class="MovieMainHeading">
                <h2>
                    The Best Of Live Events
                </h2>
            </div>              
            <div class="eventContainer">                
                <div class="eventContainerList">
                    <div class="eventContainerListItem">
                        <cfloop query="#local.resultEvents#">
                            <div class="eventContainerListItemSub" onclick="redirectToEventDetail(#local.resultEvents.eventid#,2)">
                                <div class="eventContainerListItemSub_ImageDiv">
                                    <img src="#local.resultEvents.eventimg#"/>
                                </div>
                                <div class="eventContainerListItemSub_Description">
                                    <p class="eventContainerListItemSub_Description_Name">#local.resultEvents.eventname#</p>                                    
                                    <p class="eventContainerListItemSub_Description_Name_Brand">#local.resultEvents.eventtype#</p>
                                </div>                        
                            </div>	
                        </cfloop>                        
                    </div>
                </div>
            </div> 
        </cfoutput>         
        </main>
        <script src="js/javascript.js" type="module"></script>   
        <script src="js/scripts.js"></script> 
    </body> 
    <cfinclude template="footer.cfm">  
</html>