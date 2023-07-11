<%@include file="FacultyHeader.jsp" %>
  <%@page import="helpers.*,java.util.*" %>
    <main id="main" class="main">
      <div class="pagetitle">
        <h1>Edit Group</h1>
        <nav>
          <ol class="breadcrumb">
            <li class="breadcrumb-item">Group</li>
            <li class="breadcrumb-item active">Edit Group</li>
          </ol>
        </nav>
      </div>
      <div class="card" >
        <div class="card-body">
          <div class="row">
            <div class="col-6"><h5 class="card-title">Group's Details</h5></div>
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
                        <th scope="col">Edit</th>
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
                            String gname = '"'+obj.gname+'"';
                            String desc = '"'+obj.gdescription+'"';
                            int activevalue;
                            if(obj.active == 1){
                                activevalue = 0;
                            }else{
                                activevalue = 1;
                            }
                            String table = "<td><button class='btn btn-primary' onclick='setValues("+obj.gid+","+gname+","+desc+","+activevalue+")' data-bs-toggle='modal' data-bs-target='#editgroup' >Edit Details</button></td>";
                            out.print(table);
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
          <div class="modal fade" id="editgroup" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title">Edit Group</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  <div class="col-12">
                    <label for="yourUsername" class="form-label">Group Name</label>
                    <div class="input-group has-validation">
                      <input type="text" name="groupname" class="form-control" id="groupName" required="true">
                      <div class="invalid-feedback">Please enter your Group Name.</div>
                    </div>
                  </div>
                  <div class="col-12">
                    <label for="yourPassword" class="form-label mt-1">Description</label>
                    <input type="text" name="description" class="form-control" id="groupDescription" required="true">
                    <div class="invalid-feedback">Please enter your Description!</div>
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
                  <button type="button" id="close" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                  <button type="button" class="btn btn-primary" onclick="editGroup()">Save changes</button>
                </div>
              </div>
            </div>
          </div>
    </main>
    <script>
      var element = document.getElementById("updateGroup");
      element.classList.remove("collapsed");
      var id;
      function setValues(ids,name,desc,active){
        document.getElementById("groupName").value = name;
        document.getElementById("groupDescription").value = desc;
        document.getElementById("status").selectedIndex = active;
        id = ids;
      }
      function editGroup(){
        var groupname = document.getElementById("groupName").value;  
        var groupdesc = document.getElementById("groupDescription").value;  
        var status = document.getElementById("status").value;
        console.log(groupname);
        console.log(groupdesc);
        console.log(status);
        var url = "updateExecution.jsp?subject=group&id="+id+"&name="+groupname+"&desc="+groupdesc+"&status="+status;
        const xhttp = new XMLHttpRequest();
        xhttp.open("GET",url, false);
        xhttp.send();
        var reply = xhttp.responseText;
        console.log(reply);
        if(reply == 1){
          alert("Group Has been updated");
        }else{
          alert("Please try again, group updation failed");
        }
        location.reload();
      }
    </script>