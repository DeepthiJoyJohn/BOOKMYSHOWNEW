<cfcomponent> 	
	<cffunction name="getEventsFromDb" access="public" returntype="query">
		<cfargument name="eventId">
		<cfargument name="eventtypeid">
		<cfquery name="qGetEvents" datasource="#application.datasoursename#">
			SELECT event.*,EXTRACT(HOUR FROM eventtime) AS "Hours",EXTRACT(MINUTE FROM eventtime) AS "Minutes"
			FROM event 
			WHERE eventtypeid=<cfqueryparam value="#arguments.eventtypeid#" cfsqltype="cf_sql_integer">
			<cfif arguments.eventId NEQ 0>
				AND eventid=<cfqueryparam value="#arguments.eventId#" cfsqltype="cf_sql_integer">
			<cfelse>
				LIMIT 6	
			</cfif>
		</cfquery>
		<cfreturn qGetEvents>
	</cffunction>	
	
	<cffunction name="getDateRangeOfEvents" access="public" returntype="array">			
		<cfquery name="qDateRangeOfEvents" datasource="#application.datasoursename#">
			SELECT DATEDIFF(enddate,startdate) AS DateDifference,startdate,enddate
			FROM EVENT
			WHERE eventid=<cfqueryparam value="#session.eventid#" cfsqltype="cf_sql_integer">
		</cfquery>
		<cfset local.arrayOfDates = []>
		<cfloop query="qDateRangeOfEvents">
			<cfset local.startdate=qDateRangeOfEvents.startdate>
			<cfset local.enddate=qDateRangeOfEvents.enddate>
			<cfset local.DateDifference=qDateRangeOfEvents.DateDifference>				
		</cfloop>
		<cfset local.newDate=local.startdate>		
		<cfloop from="1" to="#local.DateDifference+1#" index="i">		
			<cfif local.newDate GTE dateFormat(#session.todaydate#, "yyyy-mm-dd")>
				<cfset arrayAppend(local.arrayOfDates, local.newDate)>
			</cfif>	
			<cfset local.newDate = dateAdd('d', 1, local.newDate)>			
		</cfloop>		
		<cfreturn local.arrayOfDates>
	</cffunction>

	<cffunction name="getEventTypes" access="public" returntype="query">
		<cfquery name="qGetEventTypes" datasource="#application.datasoursename#">
			SELECT *
			FROM EVENTTYPE			
		</cfquery>
		<cfreturn qGetEventTypes> 		
	</cffunction>
</cfcomponent>

