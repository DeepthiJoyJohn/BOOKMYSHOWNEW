<cfcomponent> 	
	<cffunction name="getEventsFromDb" access="public" returntype="query">
		<cfargument name="eventId">
		<cfquery name="qGetEvents" datasource="#application.datasoursename#">
			SELECT event.*,EXTRACT(HOUR FROM eventtime) AS "Hours",EXTRACT(MINUTE FROM eventtime) AS "Minutes"
			FROM event
			<cfif arguments.eventId NEQ 0>
				WHERE eventid=<cfqueryparam value="#arguments.eventId#" cfsqltype="cf_sql_integer">
			<cfelse>
				LIMIT 6	
			</cfif>
		</cfquery>
		<cfreturn qGetEvents>
	</cffunction>	
</cfcomponent>

