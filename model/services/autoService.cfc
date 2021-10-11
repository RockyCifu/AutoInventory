<cfcomponent>

  <!--- FUNCTION - Get One Vehicle By Id --->
  <cffunction name="get">
    <cfargument name="id" type="numeric" />

    <cfset vehicle = new model.beans.vehicle() />

    <cfquery name="query">
      SELECT vehicles.id, make_name, model_name, VIN 
      FROM vehicles
      JOIN models ON vehicles.model_id = models.id
      JOIN makes ON models.make_id = makes.id
      WHERE vehicles.id = <cfqueryparam value="#id#" cfsqltype="cf_sql_integer" />
      ORDER BY id
    </cfquery>

    <cfif query.RecordCount GT 0>
        <cfset vehicle.setID(query.id) />
        <cfset vehicle.setMake(query.make_name) />
        <cfset vehicle.setModel(query.model_name) />
        <cfset vehicle.setVIN(query.VIN) />
    </cfif>

    <cfreturn vehicle>

  </cffunction>


  <!--- FUNCTION - Get All Vehicles --->
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


  <!--- FUNCTION - Persist To Database --->
  <cffunction  name="saveVehicle">
    
    <cfargument  name="vehicle">
    
    <!--- Find Make By Name --->
    <cfquery name="getMake">
      SELECT id 
      FROM makes 
      WHERE make_name = <cfqueryparam value="#vehicle.getMake()#" cfsqltype="cf_sql_varchar" />
    </cfquery>

    <!--- Persist Make To Database If Not Exists --->
    <cfif getMake.RECORDCOUNT eq 0>
      <cfquery result="res">
        INSERT INTO makes (make_name) VALUES (<cfqueryparam value="#vehicle.getMake()#" cfsqltype="cf_sql_varchar" />)
      </cfquery>
      <cfset makeId = res.generatedKey>
    <cfelse>
      <cfset makeId = getMake.id>
    </cfif>

    <!--- Find Model By Name --->
    <cfquery name="getModel">
      SELECT id 
      FROM models 
      WHERE make_id = <cfqueryparam value="#makeId#" cfsqltype="cf_sql_varchar" /> 
      AND model_name = <cfqueryparam value="#vehicle.getModel()#" cfsqltype="cf_sql_varchar" />
    </cfquery>

    <!--- Persist Model To Database If Not Exists --->
    <cfif getModel.RECORDCOUNT eq 0>
      <cfquery result="res">
        INSERT INTO models (model_name, make_id) 
        VALUES 
          (
            <cfqueryparam value="#vehicle.getModel()#" cfsqltype="cf_sql_varchar" />,
            <cfqueryparam value="#makeId#" cfsqltype="cf_sql_integer" />
          )
      </cfquery>
      <cfset modelId = res.generatedKey />
    <cfelse>
      <cfset modelId = getModel.id />
    </cfif>

    <!--- Persist Vehicle To Database If Not Exists --->
    <cfif vehicle.getID() eq 0>
      <cfquery result="res">
        INSERT INTO vehicles (VIN, model_id)
        VALUES (
          <cfqueryparam value="#vehicle.getVIN()#" cfsqltype="cf_sql_varchar" />,
          <cfqueryparam value="#modelId#" cfsqltype="cf_sql_integer" />
        )
      </cfquery>
      <cfset vehicle.setID(res.generatedKey) />

     <!--- Update Vehicle If Exists ---> 
     <cfelse>
      <cfquery name="query">
        UPDATE vehicles SET 
          VIN = <cfqueryparam value="#vehicle.getVIN()#" cfsqltype="cf_sql_varchar" />,
          model_id = <cfqueryparam value="#modelId#" cfsqltype="cf_sql_integer" />
        WHERE id = <cfqueryparam value="#vehicle.getID()#" cfsqltype="cf_sql_integer" />
      </cfquery>   
    </cfif>

    <cfreturn vehicle />

  </cffunction>

  <!--- Delete Vehicle In Database --->
  <cffunction name="delete">
    <cfargument name="id" type="numeric" />

    <cfquery>
      DELETE FROM vehicles
      WHERE id = <cfqueryparam value="#id#" cfsqltype="cf_sql_integer" />
    </cfquery>

  </cffunction>

  
</cfcomponent>