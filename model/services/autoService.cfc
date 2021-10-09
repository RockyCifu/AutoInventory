<cfcomponent>

  <cffunction  name="getCities">

    <cfquery name="qryCities">
      SELECT * FROM city
    </cfquery>

    <cfreturn qryCities/>
    
  </cffunction>

</cfcomponent>