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
		<cfset languages=local.movieObject.getLanguages()>
		<body>
			<cfinclude template="header.cfm">	
			<cfoutput>	
				<section  class="d-flex flex-column justify-content-center align-items-center">				
				<form id="form" name="form" method="post" action="">
					<cfif isDefined("form.addbtn") AND (form.languagename neq "")>
						<cfset local.movieObject.addLanguage(form.languagename)>
						<cflocation url="languages.cfm">
					</cfif> 
					<div class="container h-100 bodyclass heightdiv">
						<div class="row d-flex justify-content-center align-items-center h-100">
							<div class="col-lg-12 col-xl-11">
								<div>
									<div>
										<div class="row justify-content-center">			            
											<div>
												<table class="custom-table">
													<tr>
														<td>
															<b>Sl:No</b>
														</td>														
														<td>
															<b>Language Name</b>
														</td>
														<td>
															<input type="text" class="form-control-sm small" id="languagename" name="languagename"><br>
															<span id="errornamediv"></span>
														</td>
														<td>
															<button class="btn btn-primary btn-xs" onclick="checknulllan();" type="submit" id="addbtn" name="addbtn"><i class="bx bx-book-add"></i></button>
														</td>
													</tr>
													<cfset slno="1">																										
													<cfloop index="i" from="1" to="#languages.RecordCount#">														
														<tr>
															<td>
																#slno#	
															</td>
															<td>
																#languages.language[i]#
															</td>
															<td></td>
															<td>
																<a title="DETELE" href="Components/events.cfc?method=deleteLanguages&id=#languages.languageid[i]#">
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