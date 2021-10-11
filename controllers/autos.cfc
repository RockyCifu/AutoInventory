component accessors = "true" {
  
  property autoService;
  property framework;

  default = (struct rc) => {
    rc.vehicles = variables.autoService.getVehicles();
  }

  form = (struct rc) => {
    param name="rc.id" default="0";
    rc.vehicle = rc.id eq 0 ? new model.beans.vehicle() : autoService.get(rc.id);
  }

  save = (struct rc) => {
    param name="rc.id" default="0";
    param name="rc.make" default="";
    param name="rc.model" default="";
    param name="rc.VIN" default="";

    var vehicle = new model.beans.vehicle();
    
    if(IsNumeric(rc.id) and rc.id gt 0)
      vehicle.setID(rc.id)

    framework.populate(vehicle, "make, model, VIN")
    autoService.saveVehicle(vehicle);
    framework.redirect("autos");
  }

  delete = (struct rc) => {
    param name="rc.id" default="0";
    autoService.delete(rc.id);
    framework.redirect('autos');
  }
  
}