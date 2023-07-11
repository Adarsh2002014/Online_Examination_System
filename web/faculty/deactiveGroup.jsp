<%@include file="FacultyHeader.jsp" %>
  <%@page import="helpers.*,java.util.*" %>
    <main id="main" class="main">
      <div class="pagetitle">
        <h1>Deactive Group</h1>
        <nav>
          <ol class="breadcrumb">
            <li class="breadcrumb-item">Group</li>
            <li class="breadcrumb-item active">Deactive Group</li>
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
              List reply=db.fetchGroupData("select * from groups where active=1");
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
                        <th scope="col"></th>
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
                            out.print("<td class='text-center'><button class='btn btn-primary' value='"+obj.gid+"' onclick='deactiveGroup(this)'>Deactive Group</button></td>");
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
      var element = document.getElementById("removeGroup");
      element.classList.remove("collapsed");
      function deactiveGroup(object){
        var confirmation = confirm("Are you sure to remove related to group and Group?");
        if (confirmation == true) {
          var xhttp = new XMLHttpRequest();
          var url = "deactivisionExecution.jsp?subject=group&id="+object.value;
          xhttp.open("GET",url, false);
          xhttp.send();
          var reply = xhttp.responseText;
          if(reply == 1){
           alert("Group record has been deactivated");
          }else{
           alert("Please try again, group deactivision falid");
          }
          location.reload();
        }

      }
    </script>