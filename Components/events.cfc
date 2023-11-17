<cfcomponent> 
	<cffunction name="getEventsFromDb" access="public" returntype="query">
		<cfquery name="qGetEvents" datasource="#application.datasoursename#">
			SELECT *
			FROM event
			LIMIT 6
		</cfquery>
		<cfreturn qGetEvents>
	</cffunction>	
</cfcomponent>

