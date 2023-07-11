<%@include file="FacultyHeader.jsp" %>
  <%@page import="helpers.*,java.util.*" %>
    <main id="main" class="main">
      <div class="pagetitle">
        <h1>Edit User</h1>
        <nav>
          <ol class="breadcrumb">
            <li class="breadcrumb-item">User</li>
            <li class="breadcrumb-item active">Edit User</li>
          </ol>
        </nav>
      </div>
      <div class="card" >
        <div class="card-body">
          <div class="row">
            <div class="col-6"><h5 class="card-title">User Details</h5></div>
          </div>
          <div class="row">
            <% 
            try{ 
              examindb db = new examindb();
              List reply = db.fetchUserData("select * from user"); 
              user obj =(user)reply.get(0);
              int resultCount=reply.size();
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
                        <th scope="col">Id</th>
                        <th scope="col">Name</th>
                        <th scope="col">Role</th>
                        <th scope="col">Status</th>
                        <th scope="col">Edit</th>
                      </tr>
                    </thead>
                    <tbody>
                      <%
                        for(int i=0; i<resultCount;i++){
                            out.print("<tr>");
                            out.print("<th scope='row'>"+i+"</th>");
                            obj = (user)reply.get(i);
                            out.print("<td>"+obj.userId+"</td>");
                            out.print("<td>"+obj.uname+"</td>");
                            if(obj.typeOfUser == 1){
                                out.print("<td>Faculty</td>");
                            }else{
                                out.print("<td>Student</td>");
                            }
                            if(obj.active == 1){
                                out.print("<td>Active</td>");
                            }else{
                                out.print("<td>Deactive</td>");
                            }
                            int id = obj.userId;
                            String uname = '"'+obj.uname+'"';
                            String password = '"'+obj.password+'"';
                            int typeOfUser = obj.typeOfUser;
                            int gid = obj.gid;
                            int active = obj.active;
                            String tablerow = "<td><button class='btn btn-primary' onclick='setValues("+id+","+uname+","+password+","+typeOfUser+","+gid+","+active+","+i+")' data-bs-toggle='modal' data-bs-target='#edituser' >Edit Details</button></td>";
                            out.print(tablerow);
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
          <div class="modal fade" id="edituser" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title">Edit User</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  <div class="col-12">
                    <label for="yourUsername" class="form-label">User Name</label>
                    <div class="input-group has-validation">
                      <input type="text" name="username" class="form-control" id="userName" required="true">
                      <div class="invalid-feedback">Please enter your Group Name.</div>
                    </div>
                  </div>
                  <div class="col-12">
                    <label for="yourPassword" class="form-label mt-1">Password</label>
                    <input type="text" name="password" class="form-control" id="password" required="true">
                    <div class="invalid-feedback">Please enter your Password!</div>
                  </div>
                  <div class="col-12">
                    <label for="role" class="form-label mt-2">Role</label>
                    <select class="form-select" aria-label="Default select example" id="role">
                      <option value="1">Faculty</option>
                      <option value="2">Student</option>
                    </select>
                  </div>
                  <div class="col-12">
                    <label for="role" class="form-label mt-2">Group</label>
                    <select class="form-select" aria-label="Default select example" id="group">
                      <%
                        try{
                            examindb db = new examindb();
                            List reply=db.fetchGroupData("select * from groups");
                            group obj =(group)reply.get(0);
                            int resultCount=reply.size();
                            if(obj == null){
                                out.print("No Data");
                            }else{
                                for(int i=0;i<resultCount;i++){
                                    obj = (group)reply.get(i);
                                    out.print("<option value="+obj.gid+">"+obj.gname+"</option>");
                                }
                            }
                        }catch(Exception e){
                            out.print(e);
                        }
                      %>
                    </select>
                  </div>
                  <div class="col-12">
                    <label for="yourStatus" class="form-label mt-2">Status</label>
                    <select class="form-select" aria-label="Default select example" id="status">
                      <option value="1">Active</option>
                      <option value="0">Deactive</option>
                    </select>
                  </div>
                </div>
                <div class="modal-footer">
                  <button type="button" id="close" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                  <button type="button" class="btn btn-primary" onclick="editUser()">Save changes</button>
                </div>
              </div>
            </div>
          </div>
    </main>
    <script>
      var element = document.getElementById("editUser");
      element.classList.remove("collapsed");
      var userId;
      function setValues(id,name,password,type,gid,active,i){
          document.getElementById("userName").value = name;
          document.getElementById("password").value = password;
          document.getElementById("role").selectedIndex = type-1;
          document.getElementById("group").selectedIndex = i;
          if(active == 0){
            document.getElementById("status").selectedIndex = 1;
          }else{
            document.getElementById("status").selectedIndex = 0;
          }
          userId = id;
          console.log(id,name,password,type,gid,active,i)
      }
       function editUser(){
         var confirmation = confirm("Are you sure to edit User?");
         if(confirmation == true){
           document.getElementById("close").click();
           var url = "updateExecution.jsp?subject=user&id="+userId+"&name="+document.getElementById("userName").value+"&password="+document.getElementById("password").value+"&role="+document.getElementById("role").value+"&group="+document.getElementById("group").value+"&status="+document.getElementById("status").value;
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