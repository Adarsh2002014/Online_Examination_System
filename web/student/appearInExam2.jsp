<%@include file="StudentHeader.jsp" %>
<%@page import="helpers.*,java.util.*" %>
<main id="main" class="main" style="margin: 0;margin-top: 60px;">
    <div class="card mx-auto" style="width:1000px">
      <div class="card-body">
        <div class="row">
            <div class="col-6"><h5 class="card-title">Exam : <% out.print(request.getParameter("psname")); %></h5></div>
        </div>
        <div class="row">
            <% 
                examindb db = new examindb();
                String sql = "select * from question where psid="+request.getParameter("id");
                int id = Integer.parseInt(request.getParameter("id"));
                List reply=db.fetchQuestionData(sql);
                question obj =(question)reply.get(0);
                int resultCount=reply.size();
                for(int i=0; i<resultCount;i++){
                   obj =(question)reply.get(i);
                   if(i==0){
                       out.print("<div>");
                       out.print("<p class='h5'>"+obj.question+"</p>");
                       out.print("</div>");
                       for(int j=0;j<4;j++){
                           out.print("<div>");
                           if(j==0){
                            out.print("<div class='form-check'>");
                            out.print("<input class='form-check-input' type='radio' name='ans"+i+"' id='radio"+i+"-"+j+"' value='"+(j+1)+"' checked>");
                            out.print("<label class='form-check-label' for='radio"+i+"-"+j+"'>");
                            out.print(obj.opt1);
                            out.print("</label></div>");
                           }else if(j==1){
                            out.print("<div class='form-check'>");
                            out.print("<input class='form-check-input' type='radio' name='ans"+i+"' id='radio"+i+"-"+j+"' value='"+(j+1)+"'>");
                            out.print("<label class='form-check-label' for='radio"+i+"-"+j+"'>");
                            out.print(obj.opt2);
                            out.print("</label></div>");
                           }else if(j==2){
                            out.print("<div class='form-check'>");
                            out.print("<input class='form-check-input' type='radio' name='ans"+i+"' id='radio"+i+"-"+j+"' value='"+(j+1)+"'>");
                            out.print("<label class='form-check-label' for='radio"+i+"-"+j+"'>");
                            out.print(obj.opt3);
                            out.print("</label></div>");
                           }else if(j==3){
                            out.print("<div class='form-check'>");
                            out.print("<input class='form-check-input' type='radio' name='ans"+i+"' id='radio"+i+"-"+j+"' value='"+(j+1)+"'");
                            out.print("<label class='form-check-label' for='radio"+i+"-"+j+"'>");
                            out.print(obj.opt4);
                            out.print("</label></div>");
                           }
                           out.print("</div>");
                       }
                   }else{
                       out.print("<div class='mt-5'>");
                       out.print("<p class='h5'>"+obj.question+"</p>");
                       out.print("</div>");
                       for(int j=0;j<4;j++){
                           out.print("<div>");
                           if(j==0){
                            out.print("<div class='form-check'>");
                            out.print("<input class='form-check-input' type='radio' name='ans"+i+"' id='radio"+i+"-"+j+"' value='"+(j+1)+"' checked>");
                            out.print("<label class='form-check-label' for='radio"+i+"-"+j+"'>");
                            out.print(obj.opt1);
                            out.print("</label></div>");
                           }else if(j==1){
                            out.print("<div class='form-check'>");
                            out.print("<input class='form-check-input' type='radio' name='ans"+i+"' id='radio"+i+"-"+j+"' value='"+(j+1)+"'>");
                            out.print("<label class='form-check-label' for='radio"+i+"-"+j+"'>");
                            out.print(obj.opt2);
                            out.print("</label></div>");
                           }else if(j==2){
                            out.print("<div class='form-check'>");
                            out.print("<input class='form-check-input' type='radio' name='ans"+i+"' id='radio"+i+"-"+j+"' value='"+(j+1)+"'>");
                            out.print("<label class='form-check-label' for='radio"+i+"-"+j+"'>");
                            out.print(obj.opt3);
                            out.print("</label></div>");
                           }else if(j==3){
                            out.print("<div class='form-check'>");
                            out.print("<input class='form-check-input' type='radio' name='ans"+i+"' id='radio"+i+"-"+j+"' value='"+(j+1)+"'>");
                            out.print("<label class='form-check-label' for='radio"+i+"-"+j+"'>");
                            out.print(obj.opt4);
                            out.print("</label></div>");
                           }
                           out.print("</div>");
                       }
                   }
                }
                out.print("<button class='btn btn-primary' type='button' onclick='checkans()'>Submit</button>"); 
            %>
        </div>
    </div> 
    </div>
  </main>
  
<%@include file="../scripts.jsp" %>
<script>
    function checkans(){
        <% 
            String array = "[";
            for(int i=0;i<resultCount;i++){
                question obj2 =(question)reply.get(i);
                if(i == 0){
                    array = array + obj2.answer;
                }else{
                    array = array + "," + obj2.answer;
                }
            }
            array = array + "]";
        %>
        var answer = <% out.print(array); %>;
        console.log(answer);
        var question = <% out.print(resultCount); %>;
        var marks = 0;  
        for(var i=0;i<question;i++){
            var selector = "ans"+i;
            var inputrad = document.getElementsByName(selector);
            var len = inputrad.length;
            for(j = 0; j < len; j++) {
                if(inputrad[j].checked){
                    var ans = inputrad[j].value;
                    var actualans = answer[i]
                    console.log(actualans)
                    console.log(ans);
                    if(ans == actualans){
                        marks++;
                    }
                }
            }
        }
        var id = <% out.print(session.getAttribute("uid")); %>
        var url = "insertDate.jsp?subject=insertmarks&uid="+id+"&psid="+<% out.print(id); %>+"&marks="+marks;
        const xhttp = new XMLHttpRequest();
        xhttp.open("GET",url, false);
        xhttp.send();
        var reply = xhttp.responseText;
        if(reply == 1){
            window.location.href = "http://localhost:8080/Online_Examination/student/pastExam.jsp";
        }else{
            window.location.href = "http://localhost:8080/Online_Examination/student/pastExam.jsp";
        }
        console.log(reply);
    }
</script>