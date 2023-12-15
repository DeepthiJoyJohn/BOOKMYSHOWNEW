<cfcomponent> 
	<cffunction name="checkuser" access="remote" returntype="numeric">
		<cfargument name="username" required="true">
		<cfargument name="password" required="true">
		<cfargument name="btnValue" required="true">
		<cfquery name="qcheckuser" datasource="#application.datasoursename#">
			SELECT userid,userroleid,username
			from user
			WHERE
			username=<cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar">
			<cfif arguments.btnValue NEQ "signup">
				AND pwd=<cfqueryparam value="#arguments.password#" cfsqltype="cf_sql_varchar">
			</cfif>
		</cfquery>
		<cfif qcheckuser.recordCount>
			<cfloop query="qcheckuser">
				<cfset session.username = "#qcheckuser.username#">
				<cfset session.userid = "#qcheckuser.userid#">
				<cfset session.userrole = "#qcheckuser.userroleid#">
			</cfloop>		
		</cfif>
		<cfreturn qcheckuser.recordCount>
	</cffunction>
	<cffunction name="signUpSignIn" access="remote" returntype="numeric">
		<cfargument name="username" required="true">
		<cfargument name="password" required="true">
		<cfargument name="signupemail" required="true">
		<cfargument name="btnValue" required="true">
		<cfset local.check=0>
		<cfset local.check=checkuser(arguments.username,arguments.password,arguments.btnValue)>
		<cfif arguments.btnValue EQ "signup" AND local.check EQ 0>
			<cfquery name="qSignUp" datasource="#application.datasoursename#">
				INSERT
				INTO 
				user (username,email,pwd,userroleid)
				VALUES (<cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar">,
					    <cfqueryparam value="#arguments.signupemail#" cfsqltype="cf_sql_varchar">,
						<cfqueryparam value="#arguments.password#" cfsqltype="cf_sql_varchar">,
						<cfqueryparam value="1000" cfsqltype="cf_sql_integer">					
					   ) 
			</cfquery>
			<cfset local.check1=checkuser(arguments.username,arguments.password,arguments.btnValue)>
		</cfif>
		<cfreturn local.check>
	</cffunction>

	<cffunction name="loginwithgoogle" access="remote">
		<cfset clientID = "400423422631-l90j1ifd983of6q6pah5vvsseiumpn49.apps.googleusercontent.com">
		<cfset clientSecret = "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">
		<cfset redirectURI = "http://localhost:8500/BOOKMYSHOWNEW/index.cfm">
		<cfset authURL = "https://accounts.google.com/o/oauth2/auth">
		<cfset responseType = "code">		
		<cfset scope = "https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile">
		<cfset local.url="#authURL#?client_id=#clientID#&redirect_uri=#redirectURI#&scope=#scope#&response_type=#responseType#">
		<cfreturn local.url>
	</cffunction>

	<cffunction name="clearSessionData" access="remote" returntype="string">        
        <cfset session.username="">
        <cfset session.userrole="">   
        <cfreturn "1"> 
    </cffunction>

	<cffunction name="setEventSession" access="remote" returntype="string">  
		<cfargument name="eventId">  
		<cfargument name="eventTypeId">   
        <cfset session.eventid="#arguments.eventId#">
		<cfset session.eventTypeId="#arguments.eventTypeId#">        
        <cfreturn "1"> 
    </cffunction>

	<cffunction name="setDateSession" access="remote" returntype="string"> 
        <cfset session.todayDate = now()> 
		<cfset session.selectedDate = now()>   
        <cfreturn "1"> 
    </cffunction>

	<cffunction name="setTheartreSession" access="remote" returntype="string"> 
		<cfargument name="hallid">
		<cfargument name="showId">
        <cfset session.Hallid = arguments.hallid>
		<cfset session.showId = arguments.showId>   
        <cfreturn "1"> 
    </cffunction>
</cfcomponent>

