<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="helpers.*" %>
<%
    String subject = request.getParameter("subject");
    if(subject.equals("group")){
        examindb db = new examindb();
        int id = Integer.parseInt(request.getParameter("id"));
        String name = "'"+request.getParameter("name")+"'";
        String desc = "'"+request.getParameter("desc")+"'";
        int status = Integer.parseInt(request.getParameter("status"));
        String sql = "update groups set gname="+name+" where gid="+id;
        int reply = db.returnableStatement(sql);
        if(reply == 1){
            sql = "update groups set gdescription="+desc+" where gid="+id;
            reply = db.returnableStatement(sql);
            if(reply == 1){
                sql = "update groups set active="+status+" where gid="+id;
                reply = db.returnableStatement(sql);
                if(reply == 1){
                    out.print("1");
                }else{
                    out.print("0");
                }
            }
        }
    }else if(subject.equals("user")){
        examindb db = new examindb();
        int id = Integer.parseInt(request.getParameter("id"));
        String name = "'"+request.getParameter("name")+"'";
        String pass = "'"+request.getParameter("password")+"'";
        int role = Integer.parseInt(request.getParameter("role"));
        int group = Integer.parseInt(request.getParameter("group"));
        int status = Integer.parseInt(request.getParameter("status"));
        String sql = "update user set uname="+name+" where userId="+id;
        int reply = db.returnableStatement(sql);
        if(reply == 1){
            sql = "update user set password="+pass+" where userId="+id;
            reply = db.returnableStatement(sql);
            if(reply == 1){
                sql = "update user set typeOfUser="+role+" where userId="+id;
                reply = db.returnableStatement(sql);
                if(reply == 1){
                    sql = "update user set gid='"+group+"' where userId="+id;
                    reply = db.returnableStatement(sql);
                    if(reply == 1){
                        sql = "update user set active="+status+" where userId="+id;
                        reply = db.returnableStatement(sql);
                        if(reply == 1){
                            out.print(reply);
                        }else{
                            out.print("0");
                        }
                    }
                }
            }
        }
    }else if(subject.equals("exam")){
        examindb db = new examindb();
        int id = Integer.parseInt(request.getParameter("id"));
        String name = "'"+request.getParameter("name")+"'";
        int group = Integer.parseInt(request.getParameter("group"));
        int status = Integer.parseInt(request.getParameter("status"));
        String sql = "update paperset set psname="+name+" where psid="+id;
        int reply = db.returnableStatement(sql);
        if(reply == 1){
            sql = "update paperset set gid='"+group+"' where psid="+id;
            reply = db.returnableStatement(sql);
            if(reply == 1){
                sql = "update paperset set active="+status+" where psid="+id;
                reply = db.returnableStatement(sql);
                if(reply == 1){
                    out.print(reply);
                }else{
                    out.print("0");
                }
            }
        }
    }
%>