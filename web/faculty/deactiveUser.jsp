<%@include file="FacultyHeader.jsp" %>
  <%@page import="helpers.*,java.util.*" %>
    <main id="main" class="main">
      <div class="pagetitle">
        <h1>Deactive User</h1>
        <nav>
          <ol class="breadcrumb">
            <li class="breadcrumb-item">User</li>
            <li class="breadcrumb-item active">Deactive User</li>
          </ol>
        </nav>
      </div>
      <div class="card" >
        <div class="card-body">
          <div class="row">
            <div class="col-6"><h5 class="card-title">User's Details</h5></div>
          </div>
          <div class="row">
            <% 
              try{ 
              examindb db=new examindb();
              List reply=db.fetchUserData("select * from user where active=1");
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
                        <th scope="col">Name</th>
                        <th scope="col">Role</th>
                        <th scope="col"></th>
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
                                out.print("<td>Member</td>");
                            }else{
                                out.print("<td>Student</td>");
                            }
                            out.print("<td><button class='btn btn-primary' value='"+obj.userId+"' onclick='deactiveUser(this)'>Deactive User</button></td>");
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
      var element = document.getElementById("removeUser");
      element.classList.remove("collapsed");
      function deactiveUser(object){
        var confirmation = confirm("Are you sure to deactive user and related details?");
        if (confirmation == true) {
          var xhttp = new XMLHttpRequest();
          var url = "deactivisionExecution.jsp?subject=user&id="+object.value;
          xhttp.open("GET",url, false);
          xhttp.send();
          var reply = xhttp.responseText;
          if(reply == 1){
           alert("User record has been deactivated");
          }else{
           alert("Please try again, user deletion falid");
          }
          location.reload();
        }

      }
    </script>