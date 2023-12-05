<cfcomponent> 	
	<cffunction name="getSeatTypes" access="public" returntype="query">		
		<cfquery name="qGetSeatTypes" datasource="#application.datasoursename#">
			SELECT *
			FROM SEATTYPES 						
		</cfquery>
		<cfreturn qGetSeatTypes> 		
	</cffunction>
</cfcomponent>

