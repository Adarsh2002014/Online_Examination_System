<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="helpers.*" %>
<%
    examindb db = new examindb();
    String uid = request.getParameter("uid");
    String psid = request.getParameter("psid");
    String marks = request.getParameter("marks");
    String sub = request.getParameter("subject");
    if(sub.equals("insertmarks")){
        String sql = "insert into result (uid,psid,result,date_time_ofSubmission) values ("+uid+","+psid+","+marks+",CURRENT_TIMESTAMP)";
        int reply = db.returnableStatement(sql);
        out.print(reply);
    }
    
%>