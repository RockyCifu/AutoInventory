<cfcomponent accessors="true">

  <cfproperty  name="id">
  <cfproperty  name="make">
  <cfproperty  name="model">
  <cfproperty  name="VIN">

  <cffunction  name="init">
    <cfset variables.id = 0>
    <cfset variables.make = "">
    <cfset variables.model = "">
    <cfset variables.VIN = "">
    <cfreturn this />
  </cffunction>
  
</cfcomponent>