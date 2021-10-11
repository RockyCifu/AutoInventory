<cfoutput>
  <div class="container">
    <form action="?action=autos.save" method="post">
      <input type="hidden" id="id" name="id" value="#encodeForHTMLAttribute(rc.vehicle.getID())#">  

        <div class="form-group row">
          <label for="make" class="col-sm-2 col-form-label">Make</label>
          <div class="col-sm-6">
              <input id="make" name="make" type="text" class="form-control" placeholder="Make" value="#encodeForHTMLAttribute(rc.vehicle.getMake())#">
          </div>
        </div>

        <div class="form-group row">
          <label for="model" class="col-sm-2 col-form-label">Model</label>
          <div class="col-sm-6">
              <input id="model" name="model" type="text" class="form-control" placeholder="Model" value="#encodeForHTMLAttribute(rc.vehicle.getModel())#">
          </div>
        </div>

        <div class="form-group row">
          <label for="VIN" class="col-sm-2 col-form-label">VIN</label>
          <div class="col-sm-6">
              <input id="VIN" name="VIN" type="text" class="form-control" placeholder="VIN" value="#encodeForHTMLAttribute(rc.vehicle.getVIN())#">
          </div>
        </div>

        <div class="form-group row">
          <div class="col-sm-10">
            <button type="submit" class="btn btn-primary">Submit</button>
          </div>
        </div>  
      </form>
  </div>
</cfoutput>