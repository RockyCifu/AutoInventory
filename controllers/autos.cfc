component accessors = "true" {
  
  property autoService;

  default = (struct rc) => {
    rc.vehicles = variables.autoService.getVehicles();
  }
}