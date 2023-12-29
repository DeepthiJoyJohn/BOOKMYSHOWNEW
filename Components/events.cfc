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

    <cffunction name="addLanguage" access="public">
		<cfargument name="languagename">
		<cfquery name="qaddLanguage" datasource="#application.datasoursename#">
				INSERT INTO
					languages (language)
				VALUES 
					(<cfqueryparam value="#arguments.languagename#" cfsqltype="CF_SQL_VARCHAR">)
		</cfquery> 
	</cffunction>

	<cffunction name="deleteLanguages" access="remote">
		<cfargument name="id">
		<cfquery name="qdeleteLanguage" datasource="#application.datasoursename#">
				DELETE 
				FROM
					languages 
				WHERE 
					(languageid=<cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">)
		</cfquery> 
		<cflocation url="../languages.cfm">
	</cffunction>

	<cffunction name="getEventHall" access="public" returntype="query">
		<cfquery name="qGetEventHall" datasource="#application.datasoursename#">
			SELECT *
			FROM eventhall			
		</cfquery>
		<cfreturn qGetEventHall> 		
	</cffunction>

	<cffunction name="addEventHalls" access="public">
		<cfargument name="eventhallname">
		<cfquery name="qaddEventHalls" datasource="#application.datasoursename#">
			INSERT INTO
				eventhall (eventHallName)
			VALUES 
				(<cfqueryparam value="#arguments.eventhallname#" cfsqltype="CF_SQL_VARCHAR">)
		</cfquery> 
	</cffunction>

	<cffunction name="deleteEventHalls" access="remote">
		<cfargument name="id">
		<cfquery name="qdeleteEventHalls" datasource="#application.datasoursename#">
				DELETE 
				FROM
					eventhall 
				WHERE 
					(eventHallId=<cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">)
		</cfquery> 
		<cflocation url="../eventHalls.cfm">
	</cffunction>

	<cffunction name="getEventCategory" access="public" returntype="query">
		<cfquery name="qGetEventCategory" datasource="#application.datasoursename#">
			SELECT eventcategory.*,eventtype.eventtype as eventypename
			FROM eventcategory 
			INNER JOIN eventtype 
			ON (eventcategory.eventtype=eventtype.eventtypeid)		
		</cfquery>
		<cfreturn qGetEventCategory> 		
	</cffunction>

	<cffunction name="addEventCategory" access="public">
		<cfargument name="eventCategoryName">
		<cfargument name="eventType">
		<cfquery name="qaddEventCategory" datasource="#application.datasoursename#">
			INSERT INTO
				eventcategory (eventtype,eventcategoryname)
			VALUES 
				(<cfqueryparam value="#arguments.eventType#" cfsqltype="CF_SQL_INTEGER">,
					<cfqueryparam value="#arguments.eventCategoryName#" cfsqltype="CF_SQL_VARCHAR">)
		</cfquery> 
	</cffunction>

	<cffunction name="deleteEventCategory" access="remote">
		<cfargument name="id">
		<cfquery name="qdeleteEventCategory" datasource="#application.datasoursename#">
				DELETE 
				FROM
					eventcategory
				WHERE 
					(eventcategoryid=<cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">)
		</cfquery> 
		<cflocation url="../eventCategory.cfm">
	</cffunction>

	<cffunction name="getEventsAdmin" access="public" returntype="query">
		<cfquery name="qgetEventsAdmin" datasource="#application.datasoursename#">
			SELECT event.*,eventtype.eventtype as eventtypename
			FROM event 	
			INNER JOIN eventtype
			ON (event.eventtypeid=eventtype.eventtypeid)				
		</cfquery>
		<cfreturn qgetEventsAdmin> 		
	</cffunction>

	<cffunction name="addEventsAdmin" access="public">
		<cfargument name="eventName">
		<cfargument name="eventType">
		<cfargument name="form">	
		<cfset local.absolutePath = expandPath("Images\EventImages")>	
		<cffile action="upload" filefield="fileUpload" destination="#local.absolutePath#" accept="image/jpeg,image/png,image/gif" nameconflict="makeunique">
		<cfset local.filename="#cffile.serverFile#">
		<cfquery name="qaddEventsAdmin" datasource="#application.datasoursename#">
				INSERT INTO
					event (eventtypeid,eventname,eventtype,eventlanguage,eventimg,eventdimension,eventratings)
				VALUES 
					(<cfqueryparam value="#arguments.eventType#" cfsqltype="CF_SQL_INTEGER">,
					 <cfqueryparam value="#arguments.eventName#" cfsqltype="CF_SQL_VARCHAR">,
					 <cfqueryparam value="#arguments.form.eventcategory#" cfsqltype="CF_SQL_INTEGER">,
					 <cfqueryparam value="#arguments.form.eventlanguages#" cfsqltype="CF_SQL_INTEGER">,
					 <cfqueryparam value="#local.filename#" cfsqltype="CF_SQL_VARCHAR">,
					 <cfqueryparam value="#arguments.form.eventscreening#" cfsqltype="CF_SQL_VARCHAR">,
					 <cfqueryparam value="#arguments.form.eventrate#" cfsqltype="CF_SQL_NUMERIC">)
		</cfquery> 
	</cffunction>

	<cffunction name="deleteEvents" access="remote">
		<cfargument name="id">
		<cfquery name="qdeleteEvents" datasource="#application.datasoursename#">
				DELETE 
				FROM
					event 
				WHERE 
					(eventid=<cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">)
		</cfquery> 
		<cflocation url="../addEvents.cfm">
	</cffunction>

	<cffunction name="getLanguageDisplay" access="public">
		<cfargument name="languageid">
		<cfquery name="qgetLanguageDisplay" datasource="#application.datasoursename#">
	    	SELECT language
			FROM languages
			WHERE languageid=<cfqueryparam value="#arguments.languageid#" cfsqltype="CF_SQL_INTEGER">
		</cfquery> 
		<cfreturn qgetLanguageDisplay.language>
	</cffunction>

	<cffunction name="getEventCategoryDisplay" access="public">
		<cfargument name="eventCategoryId">
		<cfquery name="qgetEventCategoryDisplay" datasource="#application.datasoursename#">
	    	SELECT eventcategoryname
			FROM eventcategory
			WHERE eventcategoryid=<cfqueryparam value="#arguments.eventCategoryId#" cfsqltype="CF_SQL_INTEGER">
		</cfquery> 
		<cfreturn qgetEventCategoryDisplay.eventcategoryname>
	</cffunction>

	<cffunction name="getEventScreening" access="public" returntype="query">
		<cfquery name="qgetEventScreening" datasource="#application.datasoursename#">
			SELECT *
			FROM eventscreening	
		</cfquery>
		<cfreturn qgetEventScreening> 		
	</cffunction>

	<cffunction name="addEventScreening" access="public">
		<cfargument name="eventScreeningName">
		<cfquery name="qaddEventScreening" datasource="#application.datasoursename#">
			INSERT INTO
				eventscreening (eventscreeningname)
			VALUES 
				(<cfqueryparam value="#arguments.eventScreeningName#" cfsqltype="CF_SQL_VARCHAR">)				
		</cfquery>				
	</cffunction>

	<cffunction name="deleteEventScreening" access="remote">
		<cfargument name="id">
		<cfquery name="qdeleteEventScreening" datasource="#application.datasoursename#">
				DELETE 
				FROM
					eventscreening 
				WHERE 
					(eventscreeningid=<cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">)
		</cfquery> 
		<cflocation url="../movieScreening.cfm">
	</cffunction>

	<cffunction name="getEventScreeningDisplay" access="public">
		<cfargument name="eventScreeningId">
		<cfquery name="qgetEventScreeningDisplay" datasource="#application.datasoursename#">
	    	SELECT eventscreeningname
			FROM eventscreening
			WHERE eventscreeningid=<cfqueryparam value="#arguments.eventScreeningId#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn qgetEventScreeningDisplay.eventscreeningname>
	</cffunction>
</cfcomponent>
