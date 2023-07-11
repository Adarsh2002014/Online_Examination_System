<%@include file="FacultyHeader.jsp" %>
  <%@page import="helpers.*,java.util.*" %>
    <main id="main" class="main">
      <div class="pagetitle">
        <h1>Edit Exam</h1>
        <nav>
          <ol class="breadcrumb">
            <li class="breadcrumb-item">Exam</li>
            <li class="breadcrumb-item active">Edit Exam</li>
          </ol>
        </nav>
      </div>
      <div class="card" >
        <div class="card-body">
          <div class="row">
            <div class="col-6"><h5 class="card-title">Exam Details</h5></div>
          </div>
          <div class="row">
            <% 
            try{ 
              examindb db = new examindb();
              List reply = db.fetchPapersetData("select * from paperset");
              List reply1 = db.fetchGroupData("select * from groups");
              paperset obj =(paperset)reply.get(0);
              int resultCount=reply.size();
              int resultCount1=reply1.size();
              if(obj.psid == 0){
                out.print("No Data");
              }else{
              //out.print(resultCount);
            %>
                <div class="ps-3 pe-3">
                  <table class="table table-bordered text-center">
                    <thead>
                      <tr>
                        <th scope="col">#</th>
                        <th scope="col">Exam Name</th>
                        <th scope="col">Group Name</th>
                        <th scope="col">Status</th>
                        <th scope="col"></th>
                      </tr>
                    </thead>
                    <tbody>
                      <%
                          resultCount--;
                          resultCount1--;
                        for(int i=0; i<resultCount;i++){
                            out.print("<tr>");
                            out.print("<th scope='row'>"+i+"</th>");
                            paperset obj1 = (paperset)reply.get(i);
                            out.print("<td>"+obj1.psname+"</td>");
                            int pass=0;
                            for(int j=0;j<resultCount1;j++){
                                group obj2 =(group)reply1.get(j);
                                int gid = obj1.gid;
                                int gid2 = obj2.gid;
                                if(gid == gid2){
                                    out.print("<td>"+obj2.gname+"</td>");
                                    pass=j;
                                }
                            }
                            if(obj1.active == 1){
                                out.print("<td>Active</td>");
                            }else{
                                out.print("<td>Deactive</td>");
                            }
                            int id = obj1.psid;
                            String psname = '"'+obj1.psname+'"';
                            int gid = obj1.gid;
                            int active = obj1.active;
                            String tablerow = "<td><button class='btn btn-primary' onclick='setValues("+id+","+psname+","+gid+","+active+","+pass+")' data-bs-toggle='modal' data-bs-target='#editexam' >Edit Exam</button></td>";
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
          <div class="modal fade" id="editexam" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title">Edit Exam</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  <div class="col-12">
                    <label for="yourUsername" class="form-label">Exam Name</label>
                    <div class="input-group has-validation">
                      <input type="text" name="examname" class="form-control" id="examName" required="true">
                      <div class="invalid-feedback">Please enter your Group Name.</div>
                    </div>
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
                            resultCount--;
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
                  <button type="button" class="btn btn-primary" onclick="editExam()">Save changes</button>
                </div>
              </div>
            </div>
          </div>
    </main>
    <script>
      var element = document.getElementById("editExam");
      element.classList.remove("collapsed");
      var paperId;
      function setValues(id,name,gid,active,i){
          document.getElementById("examName").value = name;
          document.getElementById("group").selectedIndex = i;
          if(active == 0){
            document.getElementById("status").selectedIndex = 1;
          }else{
            document.getElementById("status").selectedIndex = 0;
          }
          paperId = id;
          console.log(id,name,gid,active,i)
      }
       function editExam(){
         var confirmation = confirm("Are you sure to edit Exam?");
         if(confirmation == true){
           document.getElementById("close").click();
           var url = "updateExecution.jsp?subject=exam&id="+paperId+"&name="+document.getElementById("examName").value+"&group="+document.getElementById("group").value+"&status="+document.getElementById("status").value;
           console.log(url)
           const xhttp = new XMLHttpRequest();
           xhttp.open("GET",url, false);
           xhttp.send();
           var reply = xhttp.responseText;
           console.log(reply);
          if(reply == 1){
            alert("Exam has been edited");
          }else{
            alert("Please try again, exam editing falid");
          }
          location.reload();
         }  
       }
    </script>