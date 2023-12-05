<cfcomponent> 
	<cffunction name="checkuser" access="remote">
		<cfargument name="mobileNo" required="true">
		<cfargument name="password" required="true">
		<cfquery name="qcheckuser" datasource="#application.datasoursename#">
			SELECT userid,userroleid,username
			from user
			WHERE
			username=<cfqueryparam value="#arguments.mobileNo#" cfsqltype="cf_sql_varchar">
			AND pwd=<cfqueryparam value="#arguments.password#" cfsqltype="cf_sql_varchar">
		</cfquery>
		<cfif qcheckuser.recordCount GT 0>
			<cfloop query="qcheckuser">
				<cfset session.username = "#qcheckuser.username#">
				<cfset session.userrole = "#qcheckuser.userroleid#">
			</cfloop>		
		</cfif>
		<cfreturn qcheckuser.recordCount>
	</cffunction>

	<cffunction name="loginwithgoogle" access="remote">
		<cfset clientID = "400423422631-l90j1ifd983of6q6pah5vvsseiumpn49.apps.googleusercontent.com">
		<cfset clientSecret = "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">
		<cfset redirectURI = "http://localhost:8500/BOOKMYSHOWNEW/home.cfm">
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
        <cfset session.eventid="#arguments.eventId#">        
        <cfreturn "1"> 
    </cffunction>

	<cffunction name="setDateSession" access="remote" returntype="string"> 
        <cfset session.todayDate = now()>   
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

