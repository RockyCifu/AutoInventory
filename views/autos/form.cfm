<cfoutput>
  <div class="container mt-5">
    <form class="col-lg-6 offset-lg-3 " action="?action=autos.save" method="post">
      <input type="hidden" id="id" name="id" value="#encodeForHTMLAttribute(rc.vehicle.getID())#">  

        <div class="form-group row justify-content-center">
          <label for="make" class="col-sm-2 col-form-label">Make</label>
          <div class="col-sm-6">
              <input id="make" name="make" type="text" class="form-control" placeholder="Make" value="#encodeForHTMLAttribute(rc.vehicle.getMake())#">
          </div>
        </div>

        <div class="form-group row justify-content-center">
          <label for="model" class="col-sm-2 col-form-label">Model</label>
          <div class="col-sm-6">
              <input id="model" name="model" type="text" class="form-control" placeholder="Model" value="#encodeForHTMLAttribute(rc.vehicle.getModel())#">
          </div>
        </div>

        <div class="form-group row justify-content-center">
          <label for="VIN" class="col-sm-2 col-form-label">VIN</label>
          <div class="col-sm-6">
              <input id="VIN" name="VIN" type="text" class="form-control" placeholder="VIN" value="#encodeForHTMLAttribute(rc.vehicle.getVIN())#">
          </div>
        </div>

        <div class="form-group row justify-content-center">
          <div class="col-sm-6 text-center my-4">
            <button type="submit" class="btn btn-primary btn-lg btn-block">Submit</button>
          </div>
        </div>  
      </form>
  </div>
</cfoutput>