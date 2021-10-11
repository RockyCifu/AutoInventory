<p><a class="btn btn-primary" href="?action=autos.form">Add New</a></p>
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
          <td>#encodeForHTML(vehicle.getId())#</td>
          <td>#encodeForHTML(vehicle.getMake())#</td>
          <td>#encodeForHTML(vehicle.getModel())#</td>
          <td>#encodeForHTML(vehicle.getVIN())#</td>
          <td>
            <a class="btn btn-secondary" href="?action=autos.form&id=#vehicle.getId()#">
              <i class="fa fa-pencil" aria-hidden="true"></i>
            </a>
          </td>
          <td>
            <a class="btn btn-secondary" href="?action=autos.delete&id=#vehicle.getId()#">
              <i class="fa fa-times" aria-hidden="true"></i>
            </a>
          </td>
        </tr>
      </cfoutput>
    </cfloop>
  </tbody>
</table>