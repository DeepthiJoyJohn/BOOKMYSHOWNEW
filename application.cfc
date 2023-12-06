<cfcomponent>    
    <cfset this.name = "BOOKMYSHOWNEW"> 
    <cfset this.applicationTimeout = createTimeSpan(0, 0, 60, 0)> 
    <cfset this.sessionManagement = true> <!--- Enable session management --->
    <cfset this.sessionTimeout = createTimeSpan(0, 0, 50, 0)> 
    <cffunction name="onApplicationStart" returnType="boolean" output="false">
        <cfset application.datasoursename="bookmyshownew">
        <cfreturn true>
    </cffunction>
    <cffunction name="onSessionStart" returnType="boolean" output="false">        
        <cfset session.username = "">
        <cfset session.userrole = "">
        <cfset session.eventid = "">
        <cfset session.todayDate = now()>
        <cfset session.selectedDate = now()>
        <cfset session.showId="">
        <cfreturn true>
    </cffunction>
    <cffunction name="onRequestStart" returnType="boolean" output="false">
        
        <cfreturn true>
    </cffunction>
    <cffunction name="onRequest" returnType="boolean" output="true">
        <cfargument name="targetPage" type="string" required="true">
        <cfinclude template="#arguments.targetPage#">
        
        <cfreturn true>
    </cffunction>
    <cffunction name="onRequestEnd" returnType="void" output="false">    
         
    </cffunction>
    <cffunction name="onSessionEnd" returnType="void" output="false">       
    </cffunction>
    <cffunction name="onApplicationEnd" returnType="void" output="false">       
    </cffunction>
</cfcomponent>
