
<cfcomponent> 
	<cffunction name="checkuser" access="remote">
		<cfargument name="mobileNo">
		<cfargument name="password">
		<cfquery name="checkuser" datasource="#application.datasoursename#">
			SELECT userid
			form user
			WHERE
			phone=<cfqueryparam value="#arguments.mobileNo#" cfsqltype="cf_sql_varchar">
			AND pwd=<cfqueryparam value="#arguments.password#" cfsqltype="cf_sql_varchar">
		</cfquery>
	</cffunction>
</cfcomponent>

