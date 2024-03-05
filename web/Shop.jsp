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
                            <h2>Seller Registration</h2>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="contact-form">
                            <form enctype="multipart/form-data" method="post" action="Assets/ActionPages/ShopUploadAction.jsp">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <fieldset>
                                            <input  type="text" class="form-control" name="txt_name" id="txt_name"  placeholder="Name" required="">
                                        </fieldset>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <fieldset>
                                            <input  type="text" class="form-control"  name="txt_contact" id="txt_contact" placeholder="Contact" required="">
                                        </fieldset>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <fieldset>
                                            <input  type="email" class="form-control" name="txt_email" id="txt_email" placeholder="E-Mail Address" required="">
                                        </fieldset>
                                    </div>
                                    <div class="col-lg-12">
                                        <fieldset>
                                            <textarea  rows="6" class="form-control" name="txt_address" id="txt_address" placeholder="Your Address" required=""></textarea>
                                        </fieldset>
                                    </div>
                                    
                                     <div class="col-lg-12 col-md-12 col-sm-12">
                                        <fieldset>
                                            <select class="form-control" name="sel_district" id="sel_district" onchange="getPlace(this.value)">
                                                <option value="">Select State</option>
                                                <%
                                                    String selQryj = "select * from tbl_state";
                                                    ResultSet rsj = con.selectCommand(selQryj);
                                                    while (rsj.next()) {
                                                %>
                                                <option value="<%=rsj.getString("state_id")%>"><%=rsj.getString("state_name")%></option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                        </fieldset>
                                        <br>
                                    </div>
                                    
                                    
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <fieldset>
                                            <select class="form-control" name="sel_district" id="sel_district" onchange="getPlace(this.value)">
                                                <option value="">Select District</option>
                                                <%
                                                    String selQry = "select * from tbl_district";
                                                    ResultSet rsd = con.selectCommand(selQry);
                                                    while (rsd.next()) {
                                                %>
                                                <option value="<%=rsd.getString("district_id")%>"><%=rsd.getString("district_name")%></option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                        </fieldset>
                                        <br>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <fieldset>
                                            <select class="form-control" name="sel_place" id="sel_place">
                                                <option value="">Select Place</option>
                                            </select>
                                        </fieldset>
                                        <br>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <fieldset>
                                            <input  type="file" style="background: white"  id="file_photo" name="file_photo"  required="">
                                        </fieldset>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <fieldset>
                                            <input  type="file" style="background: white" id="file_proof" name="file_proof"  required="">
                                        </fieldset>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <fieldset>
                                            <input  type="password" class="form-control" name="txt_password" id="txt_password"  placeholder="Password" required="">
                                        </fieldset>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <fieldset>
                                            <input  type="password" class="form-control"  name="txt_cpassword" id="txt_cpassword" placeholder="Confirm Password" required="">
                                        </fieldset>
                                    </div>
                                    <div class="col-lg-12">
                                        <fieldset>
                                            <button type="submit" id="form-submit" name="btn_submit" class="filled-button">Register</button>
                                        </fieldset>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="Assets/JQuery/jQuery.js"></script>
        <script>
                                                function getPlace(did)
                                                {
                                                    $.ajax({
                                                        url: "Assets/AjaxPages/AjaxPlace.jsp?did=" + did,
                                                        success: function(html) {
                                                            $("#sel_place").html(html);

                                                        }
                                                    });
                                                }</script>

        <%@include file="Foot.jsp" %>
    </body>
</html>
