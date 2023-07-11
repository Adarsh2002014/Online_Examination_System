<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="helpers.*" %>
<%
    String subject = request.getParameter("subject");
    if(subject.equals("group")){
        examindb db = new examindb();
        int id = Integer.parseInt(request.getParameter("id"));
        String sql = "update user set active=0 where gid="+id;
        int reply1 = db.returnableStatement(sql);
        sql = "update groups set active=0 where gid="+id;
        int reply2 = db.returnableStatement(sql);
        out.print(reply2);
    }else if(subject.equals("user")){
        examindb db = new examindb();
        int id = Integer.parseInt(request.getParameter("id"));
        String sql = "update user set active=0 where userId="+id;
        int reply = db.returnableStatement(sql);
        out.println(reply);
    }else if(subject.equals("exam")){
        examindb db = new examindb();
        int id = Integer.parseInt(request.getParameter("id"));
        String sql = "update paperset set active=0 where psid="+id;
        int reply = db.returnableStatement(sql);
        out.println(reply);
    }
%>