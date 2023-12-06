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

	<cffunction name="getEventHalls" access="public" returntype="query">
		<cfquery name="qGetEventHalls" datasource="#application.datasoursename#">
			SELECT DISTINCT(shows.eventHallId) AS eventHallId,eventHallName 
			FROM shows 
			INNER JOIN eventhall ON(shows.eventHallId=eventhall.eventHallId)
			WHERE DATE(showDate)="#dateFormat(session.selectedDate,"yyyy-mm-dd")#"	
			<cfif session.showId NEQ "">
				AND shows.showId=<cfqueryparam value="#session.showId#" cfsqltype="cf_sql_integer">
			</cfif>		
		</cfquery>		
		<cfreturn qGetEventHalls> 		
	</cffunction>

	<cffunction name="getShowTime" access="public" returntype="query">
		<cfargument name="hallid">
		<cfquery name="qGetShowTime" datasource="#application.datasoursename#">
			SELECT TIME_FORMAT(starttime, '%h:%i %p') AS showtime,showId,DATE_FORMAT(showDate,"%D-%M-%Y") AS showdate
			FROM SHOWS 
			WHERE eventid=<cfqueryparam value="#session.eventid#" cfsqltype="cf_sql_integer">
			AND eventHallId=<cfqueryparam value="#arguments.hallid#" cfsqltype="cf_sql_integer">			
		</cfquery>
		<cfreturn qGetShowTime> 		
	</cffunction>
</cfcomponent>

