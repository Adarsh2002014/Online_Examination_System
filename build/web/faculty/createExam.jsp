<%@include file="FacultyHeader.jsp" %>
<%@page import="helpers.*,java.util.*" %>
<main id="main" class="main">
  <div class="container">
      <section class="section register min-vh-100 align-items-center justify-content-center" style="padding-top:60px">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">
              <div class="card mb-3">
                <div class="card-body">
                  <div class="pt-2 pb-2">
                    <h5 class="card-title text-center pb-0 fs-4">Enter number of Question</h5>
                  </div>
                  <form class="row g-3 needs-validation" action="createExam1.jsp" method="post">
                    <div class="col-12">
                      <label for="yourPapersetname" class="form-label">Paperset Name</label>
                      <div class="input-group has-validation">
                        <input type="text" name="name" class="form-control" id="questions" name="name"
                          required="true">
                        <div class="invalid-feedback">Please enter name of exam.</div>
                      </div>
                    </div>
                    <div class="col-12">
                      <label for="noOfQuestion" class="form-label">No. Question</label>
                      <div class="input-group has-validation">
                        <input type="number" name="ques" class="form-control" id="questions" name="ques"
                          required="true">
                        <div class="invalid-feedback">Please enter no of question.</div>
                      </div>
                    </div>
                    <div class="col-12">
                      <label for="gid" class="form-label">Select Group</label>
                      <div class="input-group has-validation">
                        <select class="form-select" aria-label="Default select example" name="gid">
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
                    </div>
                    <div class="col-12">
                      <label for="yourStatus" class="form-label mt-2">Status of Exam</label>
                      <select class="form-select" aria-label="Default select example" name="status">
                        <option value="1">Active</option>
                        <option value="0">Deactive</option>
                      </select>
                    </div>    
                    <div class="col-12">
                      <button class="btn btn-primary w-100" type="submit">Submit</button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
</main>
<script>
  var element = document.getElementById("createExam");
  element.classList.remove("collapsed");
</script>