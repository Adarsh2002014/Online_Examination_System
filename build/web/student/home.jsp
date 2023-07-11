<%@include file="StudentHeader.jsp" %>
  <main id="main" class="main" style="margin: 0;margin-top: 60px;">
    <section class="section error-404 min-vh-100 d-flex flex-column align-items-center justify-content-center"
      style="min-height: 0vh!important;">
      <h1 style="font-size: 90px;line-height:50px;">Welcome</h1>
    </section>
    <div class="card mx-auto" style="width:1000px">
      <div class="row">
        <div class="col-6"><img src="../assets/img/exam-bg.png" width="500" height=""></div>
        <div class="col-6">
          <div class="row" style="min-height: 250px;">
            <div class="col-12">
              <div class="d-flex aligns-items-center justify-content-center" style="margin-top: 180px;">
                  <a href="appearInExam.jsp" style="text-decoration: none; ">  
                <button class="btn btn-outline-primary"
                  style="width:300px;height:60px;border-radius:50px;font-size: 22px;" type="button">Ongoing Exam</button>
                  </a>
              </div>
            </div>
          </div>
          <div class="row" style="min-height: 250px;">
            <div class="col-12">
              <div class="d-flex aligns-items-center justify-content-center" style="margin-top: 20px;">
                <a href="pastExam.jsp" style="text-decoration: none; ">
                    <button class="btn btn-outline-primary"
                      style="width:300px;height:60px;border-radius:50px;font-size: 22px;" type="button">Completed
                      Exam</button>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </main>
  <%@include file="../scripts.jsp" %>