<div id="loginPopup" class="popup">
    <div class="popup-content">                
        <div class="right">
            <div class="input-group">
                <form id="loginform">
                    <cfoutput>
                        <div id="mainpopupdiv">
                            <div class="getstarted">Get Started <span class="close" onclick="closeLoginPopup()">&times;</span></div>
                            <div class="googlediv" onclick="loginwithgoogle()">
                                <span class="googlespan">
                                    <img alt="google logo" src="//in.bmscdn.com/webin/common/icons/googlelogo.svg">
                                </span>
                                Continue with Google
                            </div><br><br>
                            <div class="googlediv" onclick="displayemailpopup()">
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
                                <input id="pwd" name="pwd" type="password" value=""><br>
                                <span class="errortext" id="errorspanphone"></span>
                            </div>                                    
                            <div>
                                <button class="btncontinue" id="btncontinuephone" onclick="loginaction(`phone`)">Continue</button>
                            </div>
                        </div>
                        <div id="emailpopupdiv">
                            <div class="arrowleft" onclick="redirecttopopup()"><i class="fa fa-arrow-left" aria-hidden="true"></i></div>
                            <div class="ordiv">
                                <label class="popuplabel">Login With Email</label><br><br>
                                <label>Email</label><br>
                                <input id="email" name="email" type="text" value=""><br><br>
                                <label>Password</label><br><br>
                                <input id="pwdemail" name="pwdemail" type="password" value=""><br>
                                <span class="errortext" id="errorspanemail"></span>                                    
                            </div>
                            <div>
                                <button class="btncontinue" id="btncontinueemail" onclick="loginaction(`email`)">Continue</button>
                            </div>
                        </div>
                    </cfoutput>
                </form>
            </div>
        </div><br>                
    </div>
</div>        
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
    <cfif session.username EQ "">
        <div class="loginBtn_container">
            <a href="javascript:showLoginPopup()" class="loginBtn" id="loginBtn">Sign in</a>             
        </div>
    <cfelse>
        <div class="accdiv">
            <img src="//in.bmscdn.com/m6/images/my-profile/bms-user.png" alt="Profile"><span>Hi,Guest</span>
        </div>
    </cfif>
</header>        
    
