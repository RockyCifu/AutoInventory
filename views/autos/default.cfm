<table class="table table-striped table-dark">
  <thead>
    <tr>
      <th scope="col">Id</th>
      <th scope="col">Make</th>
      <th scope="col">Model</th>
      <th scope="col">VIN</th>
      <th scope="col">Edit</th>
      <th scope="col">Delete</th>
    </tr>
  </thead>
  <tbody>
    <cfloop array="#rc.vehicles#" index="vehicle">
      <cfoutput>
        <tr>
          <td>#vehicle.getId()#</td>
          <td>#vehicle.getMake()#</td>
          <td>#vehicle.getModel()#</td>
          <td>#vehicle.getVIN()#</td>
          <td>
            <a class="btn btn-secondary" href="">
              <i class="fa fa-pencil" aria-hidden="true"></i>
            </a>
          </td>
          <td>
            <a class="btn btn-secondary" href="">
              <i class="fa fa-times" aria-hidden="true"></i>
            </a>
          </td>
        </tr>
      </cfoutput>
    </cfloop>
  </tbody>
</table>