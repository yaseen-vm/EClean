<%-- 
    Document   : ChangePassword
    Created on : Feb 12, 2024, 2:04:05 PM
    Author     : aakte
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ChangePassword</title>
    </head>
   
        <%
            if (request.getParameter("btn_save")!=null){
            String wid=session.getAttribute("wid").toString();
            String user="select * from tbl_worker where worker_id = '"+wid+"'";
            ResultSet rs=con.selectCommand(user);
            rs.next();
            
            String dbpassword = rs.getString("worker_password");
            String npassword = request.getParameter("txt_newpswd");
            String cpassword = request.getParameter("txt_crntpswd");
            
            if(dbpassword.equals(cpassword)){
                String updt = "update tbl_worker set worker_password = '"+npassword+"' where worker_id = '"+wid+"'";
                if(con.executeCommand(updt)){
                    %>
                    <script>
                        alert("password Changed");
                        window.location = "ChangePassword.jsp";
                    </script>
                    <%
                } else {
                    %>
                    <script>
                        alert("Check confirm Password");
                        window.location = "ChangePassword.jsp";
                    </script>
                    <%
                }
            } else {
                    %>
                    <script>
                        alert("Incorrect Current Password ");
                        window.location("ChangePassword.jsp");
                    </script>
                    <%
            }
            }
                    %>
            
            
            
        <body>     
        <form method="post">
            <table border="1" >
                <tr>
                    <td>
                        Current password
                    </td>
                    <td>
                        <input type="password" name="txt_crntpswd" >
                    </td>
                </tr>
                <tr>
                    <td>
                        new password
                    </td>
                    <td>
                        <input type="password" name="txt_newpswd">
                    </td>
                </tr>
                <tr>
                    <td>
                        repassword
                    </td>
                    <td>
                        <input type="password" name="txt_repswd">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btn_save" value="update">
                    </td>
                </tr>
                
            </table>
        </form>
        
        
        
        
        
        
    </body>
</html>
