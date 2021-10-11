<div class="container">
  <p><a class="btn btn-primary btn-lg btn-block mb-2 py-2 px-4" href="?action=autos.form">Add New</a></p>
  <table class="table table-striped table-dark">
    <thead>
      <tr justify-content-center>
        <th scope="col" class="text-center">Id</th>
        <th scope="col" class="text-center">Make</th>
        <th scope="col" class="text-center">Model</th>
        <th scope="col" class="text-center">VIN</th>
        <th scope="col" class="text-center">Edit</th>
        <th scope="col" class="text-center">Delete</th>
      </tr>
    </thead>
    <tbody>
      <cfloop array="#rc.vehicles#" index="vehicle">
        <cfoutput>
          <tr>
            <td class="text-center align-middle">#encodeForHTML(vehicle.getId())#</td>
            <td class="text-center align-middle">#encodeForHTML(vehicle.getMake())#</td>
            <td class="text-center align-middle">#encodeForHTML(vehicle.getModel())#</td>
            <td class="text-center align-middle">#encodeForHTML(vehicle.getVIN())#</td>
            <td class="text-center align-middle">
              <a class="btn btn-secondary" href="?action=autos.form&id=#vehicle.getId()#">
                <i class="fa fa-pencil" aria-hidden="true"></i>
              </a>
            </td>
            <td class="text-center align-middle">
              <a class="btn btn-secondary" href="?action=autos.delete&id=#vehicle.getId()#">
                <i class="fa fa-times" aria-hidden="true"></i>
              </a>
            </td>
          </tr>
        </cfoutput>
      </cfloop>
    </tbody>
  </table>
</div>
