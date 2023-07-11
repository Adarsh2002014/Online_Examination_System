package helpers;
import java.util.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
public class examindb {
    Connection con;
    ResultSet rs,rs1;
    public String username,password;
    public int userid,usertype,gid,active;
    public void Connection(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/examin","root","");
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(examindb.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void ReleaseConnection(){
        try {
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(examindb.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void Statement(String sql){
        Connection();
        try {
            Statement stmt = con.createStatement();
            rs = stmt.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(examindb.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void Statement2(String sql){
        Connection();
        try {
            Statement stmt = con.createStatement();
            rs1 = stmt.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(examindb.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public int doStatement(String sql){
        Connection();
        try {
            Statement stmt = con.createStatement();
            if(stmt.executeUpdate(sql) == 1){
                return 1;
            }else{
                return 0;
            }
        } catch (SQLException ex) {
            Logger.getLogger(examindb.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    public long retStatement(String sql){
        Connection();
        try {
            Statement stmt = con.createStatement();
            int affectedRows = stmt.executeUpdate(sql);
            if (affectedRows == 0) {
                throw new SQLException("Creating user failed, no rows affected.");
            }

            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    long i = generatedKeys.getLong(1);
                    return i;
                }
                else {
                    throw new SQLException("Creating user failed, no ID obtained.");
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(examindb.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    public int login(String sql,String pass){
        Statement(sql);
        try{
            if(rs.next()){
                if(pass.equals(rs.getString("password"))){
                    if(rs.getInt("active")== 1){
                        userid = rs.getInt("userId");
                        username = rs.getString("uname");
                        password = rs.getString("password");
                        usertype = rs.getInt("typeOfUser");
                        gid = rs.getInt("gid");
                        active = rs.getInt("active");
                        return 1;
                    }
                }
            }
        }catch(SQLException e){
        }
        return 0;
    }
    public List fetchUserData(String sql) throws SQLException{
        List<user> list= new ArrayList<>();
        Statement(sql);
        ResultSetMetaData rsmd = rs.getMetaData();
        while(rs.next()){
            user u = new user();
            u.userId = rs.getInt(1);
            u.uname = rs.getString(2);
            u.password = rs.getString(3);
            u.typeOfUser = rs.getInt(4);
            u.gid = rs.getInt(5);
            u.active = rs.getInt(6);
            list.add(u);
        }
        return list;
    }
    public List fetchGroupData(String sql) throws SQLException{
        List<group> list= new ArrayList<>();
        Statement(sql);
        int i= 0;
        while(rs.next()){
            i++;
            group g = new group();
            g.gid = rs.getInt(1);
            g.gname = rs.getString(2);
            g.gdescription = rs.getString(3);
            g.active = rs.getInt(4);
            list.add(g);
        }
        if(i!=0){
            group g = new group();
            g.gid = 0;
            list.add(g);
        }
        return list;
    }
    public List fetchPapersetData(String sql) throws SQLException{
        List<paperset> list = new ArrayList<>();
        Statement(sql);
        int i=0;
        while(rs.next()){
            i++;
            paperset ps = new paperset();
            ps.psid = rs.getInt(1);
            ps.psname = rs.getString(2);
            ps.gid = rs.getInt(4);
            ps.uid = rs.getInt(3);
            ps.active = rs.getInt(5);
            list.add(ps);
        }
        if(i!=0){
            paperset ps = new paperset();
            ps.psid = 0;
            list.add(ps);
        }
        return list;
    }
    public List fetchQuestionData(String sql) throws SQLException{
        List<question> list= new ArrayList<>();
        Statement(sql);
        while(rs.next()){
            question q = new question();
            q.qid = rs.getInt(1);
            q.question = rs.getString(2);
            q.opt1 = rs.getString(3);
            q.opt2 = rs.getString(4);
            q.opt3 = rs.getString(5);
            q.opt4 = rs.getString(6);
            q.answer = rs.getInt(7);
            q.psid = rs.getInt(8);
            list.add(q);
        }
        return list;
    }
    public List fetchResultData(String sql) throws SQLException{
        List<result> list = new ArrayList<>();
        Statement(sql);
        int i=0;
        while(rs.next()){
            i++;
            result rst = new result();
            rst.uid = rs.getInt(2);
            rst.psid = rs.getInt(3);
            rst.result = rs.getInt(4);
            rst.date_time_ofSubmission = rs.getString(5);
            sql = "select * from paperset where psid="+rs.getInt(3);
            Statement2(sql);
            if(rs1.next()){
                rst.psname = rs1.getString(2);
            }
            list.add(rst);
        }
        if(i == 0){
            result rst = new result();
            rst.uid = 0;
            list.add(rst);
        }
        return list;
    }
    public List fetchPaper(String sql,int id) throws SQLException{
        List<paperset> list = new ArrayList<>();
        Statement(sql);
        while(rs.next()){
            sql = "select * from result where psid="+rs.getInt("psid")+" and uid="+id; 
            System.out.println(sql);
            Statement2(sql);
            if(!rs1.next()){
                paperset obj = new paperset();
                obj.psid = rs.getInt(1);
                obj.psname = rs.getString(2);
                obj.uid = rs.getInt(3);
                obj.gid = rs.getInt(4);
                obj.active = rs.getInt(5);
                list.add(obj);
            }
        }
        if(list.isEmpty()){
                paperset obj = new paperset();
                obj.psid = 0;
                list.add(obj);
            }
        return list;
    }
    public int returnableStatement(String sql){
        int i = doStatement(sql);
        return i;
    }
    public long returnId(String sql){
        long i = retStatement(sql);
        return i;
    }
    public int getQuestionCount(String sql) throws SQLException{
        Statement(sql);
        int i = 0;
        while(rs.next()){
            i++;
        }
        return i;
    }
}
