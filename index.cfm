<html>
    <head>
        <title> Movie Tickets, Plays, Sports, Events &amp; Cinemas near Delhi-NCR - BookMyShow Delhi-NCR.</title>
        <link rel="shortcut icon" href="Images/Icon/icon1.png">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/styles.css">       
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">                      
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>
    <body>        
        <div id="loginPopup" class="popup">
            <div class="popup-content">                
                <div class="right">
                    <div class="input-group">
                        <form id="loginform">
                            <div id="mainpopupdiv">
                                <div class="getstarted">Get Started <span class="close" onclick="closeLoginPopup()">&times;</span></div>
                                <div class="googlediv">
                                    <span class="googlespan">
                                        <img alt="google logo" src="//in.bmscdn.com/webin/common/icons/googlelogo.svg">
                                    </span>
                                    Continue with Google
                                </div><br><br>
                                <div class="googlediv">
                                    <span class="googlespan">
                                        <img alt="google logo" src="https://in.bmscdn.com/webin/common/icons/email.svg">
                                    </span>
                                    Continue with Email
                                </div>
                                <div class="ordiv">OR</div>
                                <div class="ordiv">
                                    <img alt="indian flag" src="//in.bmscdn.com/webin/common/icons/indianflag.svg">
                                    <input id="mobileNo" type="tel" pattern="[0-9]*" placeholder="Continue with mobile number" maxlength="10" onkeyup="checklength()" onclick="myFunction()" value="">
                                </div>
                                <span id="errorText" class="errortext"></span><br>
                                <div>
                                    <button class="btncontinue" id="btncontinue" onclick="hide()">Continue</button>
                                </div>
                                
                                <div class="newsignup" id="newsignup">
                                    <a href="https://in.bookmyshow.com/terms-and-conditions">
                                        I agree to the Terms & Conditions & Privacy Policy
                                    </a>
                                </div> 
                            </div>
                            <div id="phonepopupdiv">
                                <div class="arrowleft" onclick="redirecttopopup()"><i class="fa fa-arrow-left" aria-hidden="true"></i></div>
                                <div class="ordiv">
                                    <label>Enter Password</label><br><br>
                                    <input id="pwd" type="password" value="">
                                </div>
                                 <div>
                                    <button class="btncontinue" id="btncontinuephone" onclick="hide()">Continue</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <br>                
            </div>
        </div>
        <!--End-->
        <header class="headerclass">
            <div class="logoContainer">
                <div class="logo">
                    <img src="Images/bookmyshow1.png"/>                    
                </div>
            </div>
            <div class="search_container">
                <form id="search_form">
                    <input type="text" Placeholder="Search for Products brands and more" id="search_input">
                </form>
                <i class="fa fa-search" aria-hidden="true"></i>
                <div class="recent_search">
                    
                </div>
            </div>
            <div class="loginBtn_container">
                    <a href="javascript:showLoginPopup()" class="loginBtn" id="loginBtn">Sign in</a>
            </div>
        </header>
        <main>  
        <!--Image Slider-->
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
            <div class="bestofElectronic_Container">                
                <div class="bestofElectronic_list">
                    <div class="bestofElectronic_product_item">
                        
                    </div>
                </div>
            </div>            
        </main>
        <script src="js/javascript.js" type="module"></script>   
        <script src="js/scripts.js"></script>         
    </body> 
</html>