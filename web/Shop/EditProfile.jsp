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
                            <h2>Edit Profile</h2>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="contact-form">
                            <%

                                if (request.getParameter("btn_submit") != null) {
                                    String up = "update tbl_shop set shop_name='" + request.getParameter("txt_name") + "',shop_contact='" + request.getParameter("txt_contact") + "', shop_email='" + request.getParameter("txt_email") + "' where shop_id='" + session.getAttribute("sid") + "'";
                                    con.executeCommand(up);
                                }

                                String sel = "select * from tbl_shop where shop_id='" + session.getAttribute("sid") + "'";
                                ResultSet rs = con.selectCommand(sel);
                                if (rs.next()) {
                            %>
                            <form method="post">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <fieldset>
                                            <input  type="text" class="form-control" name="txt_name" id="txt_name" value="<%=rs.getString("shop_name")%>" required="">
                                        </fieldset>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <fieldset>
                                            <input  type="text" class="form-control" name="txt_contact" id="txt_contact" value="<%=rs.getString("shop_contact")%>" required="">
                                        </fieldset>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <fieldset>
                                            <input  type="email" class="form-control" name="txt_email" id="txt_email" value="<%=rs.getString("shop_email")%>" required="">
                                        </fieldset>
                                    </div>
                                    <div class="col-lg-12">
                                        <fieldset>
                                            <button type="submit" id="form-submit" name="btn_submit" class="filled-button">Update</button>
                                        </fieldset>
                                    </div>
                                </div>
                            </form>
                            <%}%>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <%@include file="Foot.jsp" %>
    </body>
</html>
