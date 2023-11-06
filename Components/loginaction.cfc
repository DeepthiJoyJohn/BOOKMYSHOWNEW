
<cfcomponent displayname="Names" hint="ColdFusion Component for Names"> 
	<cffunction name="retrieveNames"
	hint="Gets all names from the database" access="remote">
		<cfquery name="getNames" datasource="cftask">
			select * from cftask12
		</cfquery>
   		<cfoutput><b>Table contents</b></cfoutput><br>
   		<cfoutput query="getNames">#getNames.firstname# #getNames.lastName#<br></cfoutput><br> 
   		<cfoutput><b>nth row firstname=#getNames.firstname[form.txtbox1]#</b></cfoutput><br>
	</cffunction>
</cfcomponent>

