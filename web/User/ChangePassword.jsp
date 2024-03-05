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
        <%
            if (request.getParameter("btn_submit") != null) {
                System.out.println("Hai");
                String cp = request.getParameter("txt_cp");
                String np = request.getParameter("txt_np");
                String rp = request.getParameter("txt_rp");

                String sel = "select * from tbl_user where user_id='" + session.getAttribute("uid") + "'";
                ResultSet rsd = con.selectCommand(sel);
                rsd.next();
                if (cp.equals(rsd.getString("user_password"))) {
                    if (np.equals(rsd.getString("user_password"))) {
        %>
        <script>
            alert("new password must not be same as current password");
            window.location = "HomePage.jsp";
        </script>
        <%
        } else {
            if (np.equals(rp)) {
                String upQry = "update tbl_user set user_password='" + np + "' where user_id='" + session.getAttribute("uid") + "'";
                if (con.executeCommand(upQry)) {
        %>
        <script>
            alert("Updated");
            window.location = "../index.jsp";
        </script>
        <%
            }
        } else {
        %> <script>
            alert("new password must not be same as current password");
            window.location = "index.jsp";
        </script>
        <%
                }
            }

        } else {
        %>
        <script>
            alert("Current passwors is wrong");
            window.location = "index.jsp";
        </script>
        <%
                }
            }

        %>

        <div class="send-message">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-heading">
                            <h2>Product Registration</h2>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="contact-form">
                            <form method="post" >
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <fieldset>
                                            <input  type="text" class="form-control" name="txt_cp" id="txt_cp"  placeholder="Current Password" required="">
                                        </fieldset>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <fieldset>
                                            <input  type="text" class="form-control" name="txt_np" id="txt_np"  placeholder="New Password" required="">
                                        </fieldset>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <fieldset>
                                            <input  type="password" class="form-control" name="txt_rp" id="txt_rp"  placeholder="New Password" required="">
                                        </fieldset>
                                    </div>
                                    <div class="col-lg-12">
                                        <fieldset>
                                            <button type="submit" id="form-submit" name="btn_submit" class="filled-button">Submit</button>
                                        </fieldset>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <%@include file="Foot.jsp" %>
    </body>
</html>
