<cfcomponent> 	
	<cffunction name="getEventsFromDb" access="public" returntype="query">
		<cfargument name="eventId">
		<cfargument name="eventtypeid">
		<cfquery name="qGetEvents" datasource="#application.datasoursename#">
			SELECT event.*,EXTRACT(HOUR FROM eventtime) AS "Hours",EXTRACT(MINUTE FROM eventtime) AS "Minutes",TIME_FORMAT(startdate, '%h:%i %p') AS eventstarttime,
			DATE_FORMAT(startdate, '%dth %b %Y') AS eventstartdatedisplay,DATE_FORMAT(enddate,'%Y-%m-%d') AS enddate1
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
			SELECT DATEDIFF(enddate,startdate) AS DateDifference,date(startdate) as startdate,date(enddate) as enddate
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
			AND shows.eventid=<cfqueryparam value="#session.eventid#" cfsqltype="cf_sql_integer">	
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

	<cffunction name="setDatesSession" access="remote" returntype="query">
		<cfargument name="btnName">	
		<cfargument name="selectedLanguage">	
		<cfargument name="selectedCategory">	
		<cfset local.date1="">
		<cfset local.date2="">
		<cfif Find("Today", "#arguments.btnName#")>
			<cfset local.date1= DateFormat(now(), "yyyy-mm-dd")>
		</cfif>
		<cfif Find("Tomorrow", "#arguments.btnName#")>
			<cfset local.newDate = DateAdd("d", 1, now())>
			<cfset local.date2= DateFormat(local.newDate, "yyyy-mm-dd")>
		</cfif>
		<cfquery name="qGetEventsFilter" datasource="#application.datasoursename#">
			SELECT event.*,EXTRACT(HOUR FROM eventtime) AS "Hours",EXTRACT(MINUTE FROM eventtime) AS "Minutes",TIME_FORMAT(startdate, '%h:%i %p') AS eventstarttime,
			DATE_FORMAT(startdate, '%dth %b %Y') AS eventstartdatedisplay,DATE_FORMAT(enddate,'%Y-%m-%d') AS enddate1,priceperseat
			FROM event 
			LEFT JOIN shows ON (event.eventid=shows.eventid),seattypes 			
			WHERE eventtypeid=<cfqueryparam value="#session.eventTypeId#" cfsqltype="cf_sql_integer"> 
			AND seattypes.seattypeid='3'
			<cfif session.eventid NEQ 0>
		    	AND event.eventid=<cfqueryparam value="#session.eventid#" cfsqltype="cf_sql_integer">
			</cfif>
			<cfif Find("Today", "#arguments.btnName#") OR  Find("Tomorrow", "#arguments.btnName#")>	
				AND DATE_FORMAT(shows.showDAte,'%Y-%m-%d') IN ('#local.date1#','#local.date2#')
			</cfif>
			<cfif Find("Free", "#arguments.btnName#")>	
				AND priceperseat IN ('0') 
			</cfif>	
			<cfif Find("0-500", "#arguments.btnName#")>	
				AND (priceperseat < 500 AND priceperseat > 0)
			</cfif>
			<cfif Find("lan", "#arguments.btnName#")>	
				AND event.eventlanguage IN (#arguments.selectedLanguage#)
			</cfif>
			<cfif Find("cat", "#arguments.btnName#")>	
				AND event.eventtype IN (#arguments.selectedCategory#)
			</cfif>			
		</cfquery>		
    	<cfreturn qGetEventsFilter>
	</cffunction>

	<cffunction name="getLAnguages" access="public" returntype="query">
		<cfquery name="qGetLanguages" datasource="#application.datasoursename#">
			SELECT *
			FROM languages			
		</cfquery>
		<cfreturn qGetLanguages> 		
	</cffunction>

	<cffunction name="getCategories" access="public" returntype="query">
		<cfquery name="qGetCategories" datasource="#application.datasoursename#">
			SELECT *
			FROM eventcategory			
		</cfquery>
		<cfreturn qGetCategories> 		
	</cffunction>

</cfcomponent>

