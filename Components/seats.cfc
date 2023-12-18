<cfcomponent> 	
	<cffunction name="getSeatTypes" access="public" returntype="query">	
		<cfargument name="seatTypeId">	
		<cfquery name="qGetSeatTypes" datasource="#application.datasoursename#">
			SELECT *
			FROM SEATTYPES 
			<cfif arguments.seatTypeId NEQ 0>
				WHERE seattypeid=<cfqueryparam value="#arguments.seatTypeId#" cfsqltype="cf_sql_integer">
			</cfif>						
		</cfquery>
		<cfreturn qGetSeatTypes> 		
	</cffunction>

	<cffunction name="booking" access="remote" returntype="numeric">	
		<cfargument name="noOfSeats">	
		<cfargument name="amt">	
		<cfquery name="qBookSeats" datasource="#application.datasoursename#">
			INSERT
			INTO 
			BOOKING (noofseats,timeofbooking,bookingstatus,userid,showid,bookingamt)
			VALUES (<cfqueryparam value="#arguments.noOfSeats#" cfsqltype="cf_sql_integer">,
					<cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp">,
					<cfqueryparam value="booked" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#session.userid#" cfsqltype="cf_sql_integer">,
					<cfqueryparam value="#session.showid#" cfsqltype="cf_sql_integer">,
					<cfqueryparam value="#arguments.amt#" cfsqltype="cf_sql_decimal">
					) 					
		</cfquery>		
		<cfreturn 1>
	</cffunction>

	<cffunction name="seatUpdation" access="remote">	
		<cfargument name="seatid">	
		<cfargument name="amt">	
		<cfquery name="qSeatUpdation" datasource="#application.datasoursename#">
			INSERT
			INTO 
			SHOWSEATDETAILS (showseatid,status,price,eventhallid,showid)
			VALUES (<cfqueryparam value="#arguments.seatid#" cfsqltype="cf_sql_integer">,
					<cfqueryparam value="sold" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#arguments.amt#" cfsqltype="cf_sql_decimal">,
					<cfqueryparam value="#session.Hallid#" cfsqltype="cf_sql_integer">,
					<cfqueryparam value="#session.showid#" cfsqltype="cf_sql_integer">						
					) 					
		</cfquery>			
	</cffunction>

	<cffunction name="getSoldSeats" access="remote" returntype="array">			
		<cfquery name="qSoldSeats" datasource="#application.datasoursename#">
			SELECT showseatid
			FROM SHOWSEATDETAILS
			WHERE showid=<cfqueryparam value="#session.showid#" cfsqltype="cf_sql_integer">							
		</cfquery>	
		<cfset local.soldSeats = []>
		<cfloop query="qSoldSeats">
			<cfset arrayAppend(local.soldSeats, qSoldSeats.showseatid)>
		</cfloop>	
		<cfreturn local.soldSeats> 	
	</cffunction>

	<cffunction name="getEventSeatCount" access="remote" returntype="numeric">
		<cfargument name="seatTypeId">
		<cfquery name="qEventSeatCount" datasource="#application.datasoursename#">
			SELECT IFNULL((seattypes.noofseats-COUNT(showseatdetailsid)),0) AS seatcount 
			FROM showseatdetails 
			INNER JOIN seattypes ON (seattypes.seattypeid=showseatdetails.seattypeid) 
			WHERE eventhallid=<cfqueryparam value="#session.Hallid#" cfsqltype="cf_sql_integer"> 
			AND showseatdetails.showid=<cfqueryparam value="#session.showId#" cfsqltype="cf_sql_integer"> 
			AND showseatdetails.seattypeid=<cfqueryparam value="#arguments.seatTypeId#" cfsqltype="cf_sql_integer">	
		</cfquery>
		<cfreturn qEventSeatCount.seatcount>
	</cffunction>

	<cffunction name="getEventSeatsSelected" access="public" returntype="numeric">
		<cfargument name="seatTypeId">
		<cfquery name="qEventSeatSelected" datasource="#application.datasoursename#">
			SELECT count(showseatdetailsid) as seatcount
			FROM showseatdetails
			WHERE seattypeid=<cfqueryparam value="#arguments.seatTypeId#" cfsqltype="cf_sql_integer">
			AND showseatdetails.status=<cfqueryparam value="selected" cfsqltype="cf_sql_varchar">
			AND userid=<cfqueryparam value="#session.userid#" cfsqltype="cf_sql_integer">
		</cfquery>
		<cfreturn qEventSeatSelected.seatcount>
	</cffunction>

	<cffunction name="addEventSeats" access="public">
		<cfargument name="seatTypeId">
		<cfargument name="seatPrice">
		<cfquery name="qAddSeats" datasource="#application.datasoursename#">
			INSERT
			INTO 
			SHOWSEATDETAILS (showseatid,seattypeid,status,price,eventhallid,showid,userid)
			VALUES (<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
					<cfqueryparam value="#arguments.seatTypeId#" cfsqltype="cf_sql_integer">,
					<cfqueryparam value="selected" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#arguments.seatPrice#" cfsqltype="cf_sql_decimal">,
					<cfqueryparam value="#session.Hallid#" cfsqltype="cf_sql_integer">,
					<cfqueryparam value="#session.showid#" cfsqltype="cf_sql_integer">,
					<cfqueryparam value="#session.userid#" cfsqltype="cf_sql_integer">						
					) 
		</cfquery>	
		<cfset local.seatcount=getEventSeatsSelected(arguments.seatTypeId)>
		<cflocation url="eventSeats.cfm">
		<cfreturn local.seatcount>
	</cffunction>

	<cffunction name="removeEventSeats" access="public" returntype="numeric">
		<cfargument name="seatTypeId">
		<cfquery name="qRemoveSeats" datasource="#application.datasoursename#">
			DELETE
			FROM 
			SHOWSEATDETAILS 
			WHERE seattypeid=<cfqueryparam value="#arguments.seatTypeId#" cfsqltype="cf_sql_integer">
			AND showseatid=<cfqueryparam value="0" cfsqltype="cf_sql_integer">
			AND SHOWSEATDETAILS.status=<cfqueryparam value="selected" cfsqltype="cf_sql_varchar">
			LIMIT 1
		</cfquery>	
		<cfset local.seatcount=getEventSeatsSelected(arguments.seatTypeId)>
		<cflocation url="eventSeats.cfm">
		<cfreturn local.seatcount>	
	</cffunction>

	<cffunction name="clearSelectedSeats" access="remote">
		<cfquery name="qclearSelectedSeats" datasource="#application.datasoursename#">
			DELETE
			FROM 
			SHOWSEATDETAILS 
			WHERE userid=<cfqueryparam value="#session.userid#" cfsqltype="cf_sql_integer">
			AND SHOWSEATDETAILS.status=<cfqueryparam value="selected" cfsqltype="cf_sql_varchar">
		</cfquery>	
	</cffunction>

	<cffunction name="bookEventSeats" access="remote">
		<cfquery name="qbookEventSeats" datasource="#application.datasoursename#">
			UPDATE
			SHOWSEATDETAILS 
			SET SHOWSEATDETAILS.status=<cfqueryparam value="booked" cfsqltype="cf_sql_varchar">
			WHERE userid=<cfqueryparam value="#session.userid#" cfsqltype="cf_sql_integer">
			AND SHOWSEATDETAILS.status=<cfqueryparam value="selected" cfsqltype="cf_sql_varchar">
		</cfquery>
	</cffunction>
</cfcomponent>

