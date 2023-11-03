<html>
    <head>
        <title>Online Shopping Site for Mobiles, Electronics, Furniture, Grocery, Lifestyle, Books & More. Best Offers!</title>
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
                            <div class="getstarted">Get Started <span class="close" onclick="closeLoginPopup()">&times;</span></div>
                            <div class="googlediv">
                                <span class="googlespan">
                                    <span>
                                        <img alt="google logo" src="//in.bmscdn.com/webin/common/icons/googlelogo.svg">
                                    </span>
                                </span>
                                Continue with Google
                            </div><br><br>
                            <div class="googlediv">
                                <span>
                                    <span class="googlespan">
                                        <img alt="google logo" src="https://in.bmscdn.com/webin/common/icons/email.svg">
                                    </span>
                                </span>
                                Continue with Email
                            </div>
                            <div class="ordiv">OR</div>
                            <div>
                                <img alt="indian flag" src="//in.bmscdn.com/webin/common/icons/indianflag.svg">
                                <input id="mobileNo" type="tel" pattern="[0-9]*" placeholder="Continue with mobile number" class="bwc__sc-dh558f-21 fFQlzG" value="">
                            </div>
                            
                            <span id="errorText" class="errortext"></span><br>
                            <span id="errorText1" class="errortext"></span>   
                            <span id="errorText3" class="errortext"></span>            
                                                                      
                                                        
                            <div class="signupview" id="signupview">
                                <button id="signupbtn" class="loginbtn" type="Submit">Continue</button> 
                                <a class="exeusrlink" href="javascript:hideSignupPopup()">
                                    <span class="exelink">Existing User? Log in</span>
                                </a>  
                            </div>                            
                            <div class="newsignup" id="newsignup">
                                <a href="https://in.bookmyshow.com/terms-and-conditions">
                                    I agree to the Terms & Conditions & Privacy Policy
                                </a>
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
                    <a href="javascript:showLoginPopup()" id="loginBtn">Sign in</a>
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
            <!--Best Of Electronics-->
            <div class="bestofElectronic_Container">
                <div class="bestofElectronic_list">
                    <div class="bestofElectronic_items">
                        <div class="bestofElectronic_bigText">
                            Best Of Electronics
                        </div>
                        <a href="#" class="viewallBtn">View All</a>
                        <div class="bestofElectronicmoreOption">
                            <img src="https://rukminim1.flixcart.com/fk-p-flap/278/278/image/7593e7b6640822c1.jpg?q=90">
                        </div>                        
                    </div>
                    <div class="bestofElectronic_product_item">
                        
                    </div>
                </div>
            </div>            
        </main>
        <script src="js/javascript.js" type="module"></script>   
        <script src="js/scripts.js"></script>         
    </body> 
</html>