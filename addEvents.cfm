<html>
	<form id="form" name="form" method="post" action="" enctype="multipart/form-data">
		<head>	    
			<title> Movie Tickets, Plays, Sports, Events &amp; Cinemas near Delhi-NCR - BookMyShow Delhi-NCR.</title>
			<link href="show/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
			<link href="show/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
			<link href="show/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
			<link href="show/css/style.css" rel="stylesheet">		
			<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>		
			<script src="js/home.js" type="text/javascript"></script>			
			<link rel="shortcut icon" href="Images/Icon/icon1.png">
			<link rel="stylesheet" href="css/style.css">
			<link rel="stylesheet" href="css/styles.css"> 
			<link rel="stylesheet" href="css/eventfilter.css"> 
			<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">                      
			<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
			<script src="js/eventSeats.js"></script>
		</head>
		<cfset local.movieObject=createObject("component", "Components.events")>
		<cfset local.events=local.movieObject.getEventsAdmin()>
		<cfset local.eventTypes=local.movieObject.getEventTypes()>
        <cfset local.eventCategory=local.movieObject.getEventCategory()>
        <cfset local.languages=local.movieObject.getLanguages()>
        <cfset local.eventscreening=local.movieObject.getEventScreening()>        
		<body>
			<cfinclude template="header.cfm">	
			<cfoutput>	
				<section  class="d-flex flex-column justify-content-center align-items-center">				
				<form id="form" name="form" method="post" action="" enctype="multipart/form-data">
					<cfif isDefined("form.addbtn") AND (form.eventName neq "") AND (form.eventtype neq "")>
						<cfset local.movieObject.addEventsAdmin(form.eventName,form.eventtype,form)>
						<cflocation url="addEvents.cfm">
					</cfif> 
					<div class="container h-100 bodyclass">
						<div class="row d-flex justify-content-center align-items-center h-100">
							<div class="col-lg-12 col-xl-11">
								<div>
									<div>
										<div class="row justify-content-center">			            
											<div>
												<table class="custom-table">
													<tr>
														<th>
															<b>Sl:No</b>
														</th>														
														<th>
															<b>Event Type</b>
														</th>
                                                        <th>
															<b>Event Category</b>
														</th>
                                                        <th>
															<b>Event Language</b>
														</th>
														<th>
															<b>Event Name</b>
														</th>
                                                        <th>
                                                            <b>Event Image</b>
                                                        </th> 
                                                        <th>
                                                            <b>Event Rating</b>
                                                        </th>  
                                                        <th>
                                                            <b>Event Screening</b>
                                                        </th>                                                        
													</tr>
													<tr>
														<td></td>
														<td>															
															<select class="form-select-sm"  name="eventtype" id="eventtype" required="yes">
																<OPTION VALUE="">Select</OPTION>
																<cfloop query="local.eventTypes">
																	<OPTION VALUE="#eventtypeid#">#eventtype#</OPTION>
																</cfloop>
															</select>
														</td>
                                                        <td>
                                                            <select class="form-select-sm"  name="eventcategory" id="eventcategory" required="yes">
																<OPTION VALUE="">Select</OPTION>
																<cfloop query="local.eventCategory">
																	<OPTION VALUE="#eventcategoryid#">#eventcategoryname#</OPTION>
																</cfloop>
															</select>
                                                        </td>
                                                        <td>
                                                            <select class="form-select-sm"  name="eventlanguages" id="eventlanguages" required="yes">
																<OPTION VALUE="">Select</OPTION>
																<cfloop query="local.languages">
																	<OPTION VALUE="#languageid#">#language#</OPTION>
																</cfloop>
															</select>
                                                        </td>
														<td>
															<input type="text" class="form-control-sm small" id="eventName" name="eventName" required="yes"><br>
															<span id="errornamediv"></span>
														</td>
                                                        <td>
                                                            <input class="form-control-sm small" type="file" name="fileUpload" id="fileUpload" value="" required="yes">
                                                        </td>
                                                        <td>
                                                            <select class="form-select-sm"  name="eventrate" id="eventrate" required="yes">
                                                                <OPTION VALUE="">Select</OPTION>
                                                                <OPTION VALUE="1">1</OPTION>
                                                                <OPTION VALUE="2">2</OPTION>
                                                                <OPTION VALUE="3">3</OPTION>
                                                                <OPTION VALUE="4">4</OPTION>
                                                                <OPTION VALUE="5">5</OPTION>
                                                                <OPTION VALUE="6">6</OPTION>
                                                                <OPTION VALUE="7">7</OPTION>
                                                                <OPTION VALUE="8">8</OPTION>
                                                                <OPTION VALUE="9">9</OPTION>
                                                                <OPTION VALUE="10">10</OPTION>
                                                            </select>
                                                        </td>
                                                        <td>
                                                            <select class="form-select-sm"  name="eventscreening" id="eventscreening" required="yes">
																<OPTION VALUE="">Select</OPTION>
																<cfloop query="local.eventscreening">
																	<OPTION VALUE="#eventscreeningid#">#eventscreeningname#</OPTION>
																</cfloop>
															</select>
                                                        </td>
														<td>
															<button class="btn btn-primary btn-xs" onclick="checknulllan();" type="submit" id="addbtn" name="addbtn"><i class="bx bx-book-add"></i></button>
														</td>
													</tr>
													<cfset slno="1">																										
													<cfloop index="i" from="1" to="#local.events.RecordCount#">														
														<tr>
															<td>
																#slno#	
															</td>
															<td>
																#local.events.eventtypename[i]#
															</td>
															<td>
																<cfset local.eventCategoryDisplay=local.movieObject.getEventCategoryDisplay("#local.events.eventtype[i]#")>
                                                                #local.eventCategoryDisplay#
															</td>
                                                            <td>
                                                                <cfset local.eventLanguageDisplay=local.movieObject.getLanguageDisplay("#local.events.eventlanguage[i]#")>
																#local.eventLanguageDisplay#
															</td>
                                                            <td>
																#local.events.eventname[i]#
															</td>
                                                            <td>
                                                                <img class="imgthumpnail" src="Images/EventImages/#local.events.eventimg[i]#" alt="Thumbnail Image">
                                                            </td>
                                                            <td>
                                                                #local.events.eventratings[i]#
                                                            </td>
                                                            <td>
                                                                <cfset local.eventScreeningDisplay=local.movieObject.getEventScreeningDisplay("#local.events.eventdimension[i]#")>
                                                                #local.eventScreeningDisplay#                                                                
                                                            </td>
															<td>
																<a title="DETELE" href="Components/events.cfc?method=deleteEvents&id=#local.events.eventid[i]#">
																<i class="bx bx-trash" aria-hidden="true"></i>
															</td>
														</tr>
														<cfset #slno#=#slno#+1>
													</cfloop>
													</tr>
												</table>
											</div>											
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>			
				</form>		    
			</section>
			</cfoutput>
		</body>
		<cfinclude template="footer.cfm"> 
	</form>
	<script src="js/loginaction.js"></script> 
</html>