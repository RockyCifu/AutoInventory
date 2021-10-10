<cfcomponent>

  <cffunction  name="getVehicles">

    <cfquery name="qryVehicles">
      SELECT make_name, model_name, VIN 
      FROM vehicles
      JOIN models ON vehicles.model_id = models.id
      JOIN makes ON models.make_id = makes.id
    </cfquery>

    <cfreturn qryVehicles/>
    
  </cffunction>

</cfcomponent>