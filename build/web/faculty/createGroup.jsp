<%@include file="FacultyHeader.jsp" %>
  <%@page import="helpers.*,java.util.*" %>
    <main id="main" class="main">
      <div class="pagetitle">
        <h1>Create Group</h1>
        <nav>
          <ol class="breadcrumb">
            <li class="breadcrumb-item">Group</li>
            <li class="breadcrumb-item active">Create Group</li>
          </ol>
        </nav>
      </div>
      <div class="card" >
        <div class="card-body">
          <div class="row">
            <div class="col-6"><h5 class="card-title">Group Details</h5></div>
            <div class="col-6">
              <div class="d-flex flex-row-reverse p-2">
                <button class="btn btn-primary mt-1" data-bs-toggle="modal" data-bs-target="#creategroup">Create Group</button>
                <div class="modal fade" id="creategroup" tabindex="-1">
                  <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title">Create Group</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body">
                        <div class="col-12">
                          <label for="yourUsername" class="form-label">Group Name</label>
                          <div class="input-group has-validation">
                            <input type="text" name="groupname" class="form-control" id="groupName" required="true">
                            <div class="invalid-feedback">Please enter your username.</div>
                          </div>
                        </div>
                        <div class="col-12">
                          <label for="yourPassword" class="form-label mt-1">Description</label>
                          <input type="text" name="description" class="form-control" id="groupDescription" required="true">
                          <div class="invalid-feedback">Please enter your password!</div>
                        </div>
                      </div>
                      <div class="modal-footer">
                        <button type="button" id="close" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" onclick="createGroup()">Save changes</button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <% 
              try{ 
              examindb db=new examindb();
              List reply=db.fetchGroupData("select * from groups");
              group obj =(group)reply.get(0);
              int resultCount=reply.size();
              resultCount--;
              if(obj == null){
                out.print("No Data");
              }else{
              //out.print(resultCount);
            %>
                <div class="ps-3 pe-3">
                  <table class="table table-bordered text-center">
                    <thead>
                      <tr>
                        <th scope="col">#</th>
                        <th scope="col">Name</th>
                        <th scope="col">Description</th>
                        <th scope="col">Status</th>
                      </tr>
                    </thead>
                    <tbody>
                      <%
                        for(int i=0; i<resultCount;i++){
                            out.print("<tr>");
                            out.print("<th scope='row'>"+i+"</th>");
                            obj = (group)reply.get(i);
                            out.print("<td>"+obj.gname+"</td>");
                            out.print("<td>"+obj.gdescription+"</td>");
                            if(obj.active == 1){
                                out.print("<td>Active</td>");
                            }else if(obj.active == 0){
                                out.print("<td>Deactive</td>");
                            }
                            out.print("</tr>");
                        } 
                      %>
                    </tbody>
                  </table>
                </div>
                <% } }catch(Exception e){ out.println(e); } %>
              </div>
            </div>
          </div>
    </main>
    <script>
      var element = document.getElementById("createGroup");
      element.classList.remove("collapsed");
      function createGroup(){
        var confirmation = confirm("Are you sure to create Group?");
        if(confirmation == true){
          document.getElementById("close").click();
          var url = "createExecution.jsp?subject=group&name="+document.getElementById("groupName").value+"&description="+document.getElementById("groupDescription").value;
          console.log(url)
          const xhttp = new XMLHttpRequest();
          xhttp.open("GET",url, false);
          xhttp.send();
          var reply = xhttp.responseText;
          console.log(reply);
         if(reply == 1){
           alert("Group Has been recorded");
         }else{
           alert("Please try again, group creation falid");
         }
         location.reload();
        }  
      }
    </script>