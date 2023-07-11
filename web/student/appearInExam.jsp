<%@include file="StudentHeader.jsp" %>
<%@page import="helpers.*,java.util.*" %>
<main id="main" class="main" style="margin: 0;margin-top: 60px;">
    <div class="card mx-auto" style="width:1000px">
      <div class="card-body">
        <div class="row">
          <div class="col-6"><h5 class="card-title">Exam</h5></div>
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
                int gid = (Integer)session.getAttribute("gid");
                String sql = "select * from paperset where gid="+gid+" and active=1";
                List reply=db.fetchPaper(sql,id);
                paperset obj =(paperset)reply.get(0);
                int resultCount=reply.size();
                if(obj.psid == 0){
                  out.print("<div class='text-center'>");
                  out.print("<img src='../assets/img/sorryimg.jpg' style='height:510px'>");
                  out.print("<h4>No, Data Found</h4>");
                  out.print("<p class='mt-2 mb-1'><a href='home.jsp'><button class='btn btn-primary'>Go Back</button></a></p>");
                  out.print("</div>");
                }else{
              %>
                  <div class="ps-3 pe-3">
                    <table class="table table-bordered text-center">
                      <thead>
                        <tr>
                          <th scope="col">#</th>
                          <th scope="col">Paper Set Name</th>
                          <th scope="col"></th>
                        </tr>
                      </thead>
                      <tbody>
                      <form action="appearInExam2.jsp" method="post">
                          
                        <%
                            out.print("<input type='hidden' name='psname' value='"+obj.psname+"' >");
                          for(int i=0; i<resultCount;i++){
                              out.print("<tr>");
                              out.print("<th scope='row'>"+i+"</th>");
                              obj = (paperset)reply.get(i);
                              out.print("<td>"+obj.psname+"</td>");
                              out.print("<td class='text-center'><button class='btn btn-primary'name='id' value='"+obj.psid+"' type='submit'>Appear For Exam</button></td>");
                              out.print("</tr>");
                          } 
                        %>
                      </form>
                      </tbody>
                    </table>
                  </div>
                  <% } }catch(Exception e){ out.println(e); } %>
      </div>
    </div> 
    </div>
  </main>
  
    <%@include file="../scripts.jsp" %>