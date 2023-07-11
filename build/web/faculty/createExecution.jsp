<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="helpers.*" %>
<%
    String subject = request.getParameter("subject");
    examindb db = new examindb();
    if(subject.equals("group")){
        String gname = request.getParameter("name");
        String gdescription = request.getParameter("description");
        String sql = "insert into groups(gname,gdescription,active) values ('"+gname+"','"+gdescription+"',1)";
        int reply = db.returnableStatement(sql);
        out.println(reply);
    }else if(subject.equals("user")){
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        int role = Integer.parseInt(request.getParameter("role"));
        int group = Integer.parseInt(request.getParameter("group"));
        int status = Integer.parseInt(request.getParameter("status"));
        String gdescription = request.getParameter("description");
        String sql = "insert into user(uname,password,typeOfUser,gid,active) values ('"+name+"','"+password+"','"+role+"','"+group+"','"+status+"')";
        int reply = db.returnableStatement(sql);
        out.println(reply);
    }else if(subject.equals("paperset")){
        int ques = Integer.parseInt(request.getParameter("question"));
        String sql = "insert into paperset (psname,uid,gid,active) values ('"+request.getParameter("papername")+"',"+session.getAttribute("uid")+","+request.getParameter("gid")+","+request.getParameter("status")+")";
//        out.print(sql);
        long reply = db.returnId(sql);
            sql = "insert into question (question,opt1,opt2,opt3,opt4,answer,psid) values";
            for(int i=0;i<ques;i++){
                if(i == 0){
                    sql = sql +"(";
                }else{
                    sql = sql +",(";
                }
                String que = "q"+i;
                String question = "'"+request.getParameter(que)+"'";
                sql = sql+question;
                for(int j = 0; j<4;j++){
                    String opt = i+"opt"+j;
                    String optvalue = "'"+request.getParameter(opt)+"'";
                    sql = sql + "," + optvalue;
                }
                String a = "ans"+i;
                String ans = request.getParameter(a);
                sql = sql+","+ans+","+reply;
                sql += ")";
            }
//        out.print(sql);
        int answer = db.returnableStatement(sql);
        out.print(answer);
    }
%>
