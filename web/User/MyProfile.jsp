<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body>
        <%@include file="Head.jsp" %>

        <div class="send-message">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-heading">
                            <h2>My Profile</h2>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="contact-form">
                            <%
                                String sel = "select * from tbl_user where user_id='" + session.getAttribute("uid") + "'";
                                ResultSet rs = con.selectCommand(sel);
                                if (rs.next()) {
                            %>
                            <form  method="post" >
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <img src="../Assets/Files/<%=rs.getString("user_photo")%>" width="150" height="120" style="border-radius: 50%">
                                    </div>
                                    <div class="col-lg-12">
                                      Name :  <%=rs.getString("user_name")%>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                     Contact :   <%=rs.getString("user_contact")%>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                     Email :   <%=rs.getString("user_email")%>
                                    </div>
                                    <div class="col-lg-12">
                                        <fieldset>
                                            <a href='EditProfile.jsp' class="filled-button" style="color: white">Edit Profile</a>
                                            <a href='ChangePassword.jsp' class="filled-button" style="color: white">Change Password</a>
                                        </fieldset>
                                    </div>
                                </div>
                            </form>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="../Assets/JQuery/jQuery.js"></script>
        <script>
            function getSubcategory(cid)
            {
                $.ajax({
                    url: "../Assets/AjaxPages/AjaxSubcategory.jsp?cid=" + cid,
                    success: function(html) {
                        $("#sel_subcat").html(html);

                    }
                });
            }</script>

        <%@include file="Foot.jsp" %>
    </body>
</html>
