<cfoutput>
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
            <cfloop query="#rc.vehicles#">
              <tr>
                <td>#id#</td>
                <td>#make_name#</td>
                <td>#model_name#</td>
                <td>#VIN#</td>
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
            </cfloop>
        </tbody>
    </table>
</cfoutput>