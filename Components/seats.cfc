<cfcomponent> 	
	<cffunction name="getSeatTypes" access="public" returntype="query">		
		<cfquery name="qGetSeatTypes" datasource="#application.datasoursename#">
			SELECT *
			FROM SEATTYPES 						
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
</cfcomponent>

