<%@include file="FacultyHeader.jsp" %>
  <%@page import="helpers.*,java.util.*" %>
    <main id="main" class="main">
      <div class="pagetitle">
        <h1>Add User</h1>
        <nav>
          <ol class="breadcrumb">
            <li class="breadcrumb-item">User</li>
            <li class="breadcrumb-item active">Add User</li>
          </ol>
        </nav>
      </div>
      <div class="card" >
        <div class="card-body">
          <div class="row">
            <div class="col-6"><h5 class="card-title">User Details</h5></div>
            <div class="col-6">
              <div class="d-flex flex-row-reverse p-2">
                <button class="btn btn-primary mt-1" data-bs-toggle="modal" data-bs-target="#creategroup">Add User</button>
                <div class="modal fade" id="creategroup" tabindex="-1">
                  <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title">Add User</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body">
                        <div class="col-12">
                          <label for="yourUsername" class="form-label">User Name</label>
                          <div class="input-group has-validation">
                            <input type="text" name="groupname" class="form-control" id="userName" required="true">
                            <div class="invalid-feedback">Please enter your username.</div>
                          </div>
                        </div>
                        <div class="col-12">
                          <label for="yourPassword" class="form-label mt-2">Password</label>
                          <input type="text" name="description" class="form-control" id="userPassword" required="true">
                          <div class="invalid-feedback">Please enter your password!</div>
                        </div>
                        <div class="col-12">
                          <label for="yourGroup" class="form-label mt-2">Select Role</label>
                          <select class="form-select" aria-label="Default select example" id="role">
                              <option value="1">Faculty</option>
                              <option value="2">Student</option>
                          </select>
                        </div>
                        <div class="col-12">
                           <label for="yourGroup" class="form-label mt-2">Select Groups</label>
                          <select class="form-select" aria-label="Default select example" id="group">
                          <%
                            List reply = null;  
                            List replygroup = null;  
                            user obj = null;
                            group obj2 = null;
                            int resultCount = 0;
                            int resultCount2 = 0;
                            try{ 
                              examindb db = new examindb();
                              reply = db.fetchUserData("select * from user");
                              replygroup = db.fetchGroupData("select * from groups");
                              obj = (user)reply.get(0);
                              obj2 = (group)replygroup.get(0);
                              resultCount = reply.size();
                              resultCount2 = replygroup.size();
                            }catch(Exception e){ out.println(e); }

                            for(int i=0; i<resultCount2;i++){
                              obj2 = (group)replygroup.get(i);
                              out.print("<option value='"+obj2.gid+"'>");
                              out.print(obj2.gname);
                              out.print("</option>");
                          } 
                            %>
                            </select>
                        </div>
                        <div class="col-12">
                          <label for="yourGroup" class="form-label mt-2">Status</label>
                          <select class="form-select" aria-label="Default select example" id="status">
                            <option value="1">Active</option>
                            <option value="0">Deactive</option>
                          </select>
                        </div>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" id="close" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" onclick="addUser()">Save changes</button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <% 
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
                        <th scope="col">Role</th>
                      </tr>
                    </thead>
                    <tbody>
                      <%
                        for(int i=0; i<resultCount;i++){
                            out.print("<tr>");
                            out.print("<th scope='row'>"+i+"</th>");
                            obj = (user)reply.get(i);
                            out.print("<td>"+obj.uname+"</td>");
                            if(obj.typeOfUser == 1){
                                out.print("<td>Faculty</td>");
                            }else{
                                out.print("<td>Student</td>");
                            }
                            out.print("</tr>");
                        } 
                      %>
                    </tbody>
                  </table>
                </div>
                <% } %>
              </div>
            </div>
          </div>
    </main>
    <script>
      var element = document.getElementById("addUser");
      element.classList.remove("collapsed");
      function addUser(){
        var confirmation = confirm("Are you sure to add User?");
        if(confirmation == true){
          document.getElementById("close").click();
          var url = "createExecution.jsp?subject=user&name="+document.getElementById("userName").value+"&password="+document.getElementById("userPassword").value+"&role="+document.getElementById("role").value+"&group="+document.getElementById("group").value+"&status="+document.getElementById("status").value;
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