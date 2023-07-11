<%@include file="FacultyHeader.jsp" %>
<%@page import="helpers.*,java.util.*" %>
<main id="main" class="main">
      <div class="pagetitle">
        <h1>Questions</h1>
        <nav>
          <ol class="breadcrumb">
            <li class="breadcrumb-item">Exam</li>
            <li class="breadcrumb-item active">Create Exam</li>
          </ol>
        </nav>
      </div>
      <div class="card" >
        <div class="card-body">
            <h5 class="card-title">Write Questions</h5>
<!--          <div class="row">
            <div class="col-6"></div>
          </div>-->
          <div class="row">
                <div class="ps-3 pe-3">
                    <form class="needs-validation">
                    <div>
                    <%
                      int question = Integer.parseInt(request.getParameter("ques"));
                      for(int i=0;i<question;i++){
                          if(i==0){
                              out.print("<div class='input-group has-validation mb-3'>");
                          }else{
                              out.print("<div class='input-group has-validation mb-3 mt-5'>");
                          }
                          out.print("<input type='text' class='form-control' name='q"+i+"' id='q"+i+"' placeholder='Question "+(i+1)+"' aria-label='Username' aria-describedby='basic-addon1' required>");
                          out.print("</div>");
                          for(int j=0;j<4;j++){
                              out.print("<div class='input-group mb-3 w-50'>");
                              out.print("<input type='text' class='form-control' name='"+i+"opt"+j+"' id='"+i+"opt"+j+"' placeholder='Option "+(j+1)+"' aria-label='Username' aria-describedby='basic-addon1'>");
                              out.print("</div>");
                          }
                          out.print("<div>");
                          out.print("<select class='form-select w-50' aria-label='Default select example' id='ans"+i+"'>");
                          out.print("<option value='1'>Opt1</option>");
                          out.print("<option value='2'>Opt2</option>");
                          out.print("<option value='3'>Opt3</option>");
                          out.print("<option value='4'>Opt4</option>");
                          out.print("</select>");
                          out.print("</div>");
                      }
                    %>
                    <button class="btn btn-primary mt-1" type="button" onclick="insertQuestion()">Submit</button>
                    </div>
                    </form>
                </div>
              </div>
            </div>
          </div>
    </main>
    <script>
      var element = document.getElementById("createExam");
      element.classList.remove("collapsed");
      var papername = "+<% out.print(request.getParameter("name")); %>+";
      var gid = "+<% out.print(request.getParameter("gid")); %>+";
      var status = "+<% out.print(request.getParameter("status")); %>+";
      var url = "createExecution.jsp?subject=paperset&papername="+papername+"&gid="+gid+"&status="+status+"&question=";
      function insertQuestion(){
          var noOfQuestion = <% out.print(question); %>;
          url = url + noOfQuestion;
          for(var i=0;i<noOfQuestion;i++){
            var tempque = "q"+i;  
            var valuedata = document.getElementById(tempque).value;
            url = url + "&"+tempque+"="+valuedata;
            for(var j=0;j<4;j++){
                var tempopt = i+"opt"+j;
                var valueopt = document.getElementById(tempopt).value;
                url = url + "&"+tempopt+"="+valueopt;
            }
            var a = "ans"+i;
            var ans = document.getElementById(a).value;
            url = url+"&"+a+"="+ans;
          }    
          console.log(url);
          var conf = confirm("Are you sure to add Exam?");
          if(conf){
            const xhttp = new XMLHttpRequest();
            xhttp.open("GET",url, false);
            xhttp.send();
            var reply = xhttp.responseText;
            console.log(reply);
            confirmation(reply);
          }  
        }
        function confirmation(reply){
            if(reply == 1){
              alert("Exam is inserted");
              window.location.href = "http://localhost:8080/Online_Examination/faculty/createExam.jsp";
            }else{
              alert("Please try again, exam creation falid");
              window.location.href = "http://localhost:8080/Online_Examination/faculty/createExam.jsp";
            }
        }
    </script>
