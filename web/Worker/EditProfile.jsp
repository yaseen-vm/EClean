<%-- 
    Document   : EditProfile
    Created on : Feb 12, 2024, 11:33:24 AM
    Author     : aakte
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EditProfile</title>
    </head>
    <body>
        <%
        String id = session.getAttribute("wid").toString();
        
        if(request.getParameter("btn_save") !=null){
            String name = request.getParameter("txt_name"); 
            String contact = request.getParameter("txt_contact");
            String email = request.getParameter("txt_email");

            String updt = "update tbl_worker set worker_name = '"+name+"', worker_contact = '"+contact+"' , worker_email = '"+email+"'";
            con.executeCommand(updt);
            
        }
       
        %>
        
        
        
        <%
          String wid = session.getAttribute("wid").toString();
          String name = "select * from tbl_worker where worker_id = '"+wid+"'";
          ResultSet rs=con.selectCommand(name);
          rs.next();
       
        %>
        <table border="1">
            <tr>
                <td>
                    Name
                </td>
                <td>
                    <input type="text" name="txt_name" value="<%=rs.getString("user_name")%>"> 
                </td>
            </tr>
            <tr>
                <td>
                    Contact
                </td>
                <td>
                    <input type="text" name="txt_contact" value="<%=rs.getString("user_contact")%>">
                </td>
            </tr>
            <tr>
                <td>
                    email
                </td>
                <td>
                    <input type="text" name="txt_email" value="<%=rs.getString("user_email")%>">
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" name="btn_save" value="Update">
                </td>
            </tr>
        </table>
    </body>
</html>
