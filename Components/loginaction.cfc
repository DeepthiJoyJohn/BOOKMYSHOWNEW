<cfcomponent> 
	<cffunction name="checkuser" access="remote">
		<cfargument name="mobileNo">
		<cfargument name="password">
		<cfquery name="checkuser" datasource="#application.datasoursename#">
			SELECT userid
			from user
			WHERE
			username=<cfqueryparam value="#arguments.mobileNo#" cfsqltype="cf_sql_varchar">
			AND pwd=<cfqueryparam value="#arguments.password#" cfsqltype="cf_sql_varchar">
		</cfquery>
		<cfreturn checkuser.recordCount>
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
</cfcomponent>

