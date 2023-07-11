<%@include file="FacultyHeader.jsp" %>
  <%@page import="helpers.*,java.util.*" %>
    <main id="main" class="main">
      <div class="pagetitle">
        <h1>Demolish Exam</h1>
        <nav>
          <ol class="breadcrumb">
            <li class="breadcrumb-item">Exam</li>
            <li class="breadcrumb-item active">Demolish Exam</li>
          </ol>
        </nav>
      </div>
      <div class="card" >
        <div class="card-body">
          <div class="row">
            <div class="col-6"><h5 class="card-title">Past Exams</h5></div>
          </div>
          <div class="row">
            <% 
              try{ 
              examindb db = new examindb();
              int id = (Integer)session.getAttribute("uid"); 
              List reply = db.fetchPapersetData("select * from paperset where uid="+id+" and active=1");
              int resultCount = reply.size();
              if(resultCount == 0){
                out.print("<div class='text-center'>");
                out.print("<img src='../assets/img/sorryimg.jpg' style='height:510px'>");
                out.print("<h4>No, Data Found</h4>");
                out.print("</div>");
              }else{
//              out.print(resultCount);
            %>
                <div class="ps-3 pe-3">
                  <table class="table table-bordered text-center">
                    <thead>
                      <tr>
                        <th scope="col">#</th>
                        <th scope="col">Paper Name</th>
                        <th scope="col">Active</th>
                        <th scope="col"></th>
                      </tr>
                    </thead>
                    <tbody>
                      <%
                        resultCount--;  
                        for(int i=0; i<resultCount;i++){
                            paperset obj =(paperset)reply.get(i);
                            out.print("<tr>");
                            out.print("<th scope='row'>"+i+"</th>");
                            obj = (paperset)reply.get(i);
                            out.print("<td>"+obj.psname+"</td>");
                            if(obj.active == 1){
                                out.print("<td>Active</td>");
                            }else{
                                out.print("<td>Deactive</td>");
                            }
                            out.print("<td><button class='btn btn-primary' value='"+obj+"' onclick='deactiveUser("+obj.psid+")'>Deactive User</button></td>");
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
      var element = document.getElementById("demolishExam");
      element.classList.remove("collapsed");
      function deactiveUser(id){
        var confirmation = confirm("Are you sure to deactive user and related details?");
        if (confirmation == true) {
          var xhttp = new XMLHttpRequest();
          var url = "deactivisionExecution.jsp?subject=exam&id="+id;
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
