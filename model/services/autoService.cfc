<cfcomponent>

  <cffunction  name="getVehicles">

    <cfset vehicles = [] />

    <cfquery name="getVehicles">
      SELECT vehicles.id, make_name, model_name, VIN 
      FROM vehicles
      JOIN models ON vehicles.model_id = models.id
      JOIN makes ON models.make_id = makes.id
      ORDER BY id
    </cfquery>

    <cfloop query="getVehicles">
      <cfset vehicle = new model.beans.vehicle() />
      <cfset vehicle.setID(getVehicles.id) />
      <cfset vehicle.setMake(getVehicles.make_name) />
      <cfset vehicle.setModel(getVehicles.model_name) />
      <cfset vehicle.setVIN(getVehicles.VIN) />
      <cfset vehicles.append(vehicle) />
    </cfloop>

    <cfreturn vehicles/>  
  </cffunction>

</cfcomponent>