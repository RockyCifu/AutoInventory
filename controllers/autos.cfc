component accessors = "true" {
  
  property autoService;

  default = (struct rc) => {
    rc.title = "Auto Page";
    rc.cities = variables.autoService.getCities();
  }
  
}