<%@include file="StudentHeader.jsp" %>
<%@page import="helpers.*,java.util.*" %>
<main id="main" class="main" style="margin: 0;margin-top: 60px;">
  <div class="card mx-auto" style="width:1000px">
    <div class="card-body">
      <div class="row">
        <div class="col-6"><h5 class="card-title">Past Exam Result</h5></div>
        <div class="col-6 d-flex flex-row-reverse p-2">
            <a href="home.jsp"><button class="btn btn-primary mt-1" >Go Home</button></a>
        </div>
      </div>
    <div class="row">
      <div class="col-6"></div>
      <% 
              try{ 
              examindb db=new examindb();
              int id = (Integer)session.getAttribute("uid");
              String sql = "select * from result where uid="+id;
              List reply=db.fetchResultData(sql);
              result obj =(result)reply.get(0);
              int resultCount=reply.size();
              if(obj.uid == 0){
                out.print("<div class='text-center'>");
                out.print("<img src='../assets/img/sorryimg.jpg' style='height:510px'>");
                out.print("<h4>No, Data Found</h4>");
                out.print("<p class='mt-2 mb-1'><a href='home.jsp'><button class='btn btn-primary'>Go Back</button></a></p>");
                out.print("</div>");
              }else{
              //out.print(resultCount);
            %>
                <div class="ps-3 pe-3">
                  <table class="table table-bordered text-center">
                    <thead>
                      <tr>
                        <th scope="col">#</th>
                        <th scope="col">Paper Set Name</th>
                        <th scope="col">Result</th>
                        <th scope="col">Total Marks</th>
                        <th scope="col">Time of Submission</th>
                      </tr>
                    </thead>
                    <tbody>
                      <%
                        for(int i=0; i<resultCount;i++){
                            out.print("<tr>");
                            out.print("<th scope='row'>"+i+"</th>");
                            obj = (result)reply.get(i);
                            sql = "select * from question where psid="+obj.psid;
                            int totalMarks = db.getQuestionCount(sql);
                            out.print("<td>"+obj.psname+"</td>");
                            out.print("<td>"+obj.result+"</td>");
                            out.print("<td>"+totalMarks+"</td>");
                            out.print("<td>"+obj.date_time_ofSubmission+"</td>");
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

  <%@include file="../scripts.jsp" %>