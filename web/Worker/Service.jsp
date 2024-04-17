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
                            <h2>Service</h2>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="contact-form">
                            <form enctype="multipart/form-data" method="post" action="../Assets/ActionPages/ServiceUploadAction.jsp">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <fieldset>
                                            <input  type="text" class="form-control" name="txt_title" id="txt_title"  placeholder="Title" required="">
                                        </fieldset>
                                    </div>
                                    <div class="col-lg-12">
                                        <fieldset>
                                            <textarea  rows="6" class="form-control" name="txt_details" id="txt_address" placeholder="Details" required=""></textarea>
                                        </fieldset>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <fieldset>
                                            <input  type="file" style="background: white"  id="file_photo" name="file_photo"  required="">
                                        </fieldset>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <fieldset>
                                            <input  type="text" class="form-control" name="txt_rate" id="txt_rate"  placeholder="Offer Rate" required="">
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
                    <div class="col-md-6">
                        <div class="contact-form" id="tab">
                            <table>
                                <tr>
                                    <th>Sl.no</th>
                                    <th>Photo</th>
                                    <th>Title</th>
                                    <th>Details</th>
                                    <th>Rate</th>
                                    <th>MRP</th>
                                    <th colspan="3" style="text-align: center">Action</th>
                                </tr>
                                <%
                                    int i = 0;
                                    String selQryP = "select * from tbl_service where worker_id='" + session.getAttribute("wid") + "'";
                                    ResultSet rsdP = con.selectCommand(selQryP);
                                    while (rsdP.next()) {
                                        i++;
                                %>
                                <tr>
                                    <td><%=i%></td>
                                    <td><a href="../Assets/Files/<%=rsdP.getString("service_photo")%>"><img src="../Assets/Files/<%=rsdP.getString("service_photo")%>" height="120" width="120" style="border-radius: 50%"/></a></td>
                                    <td><%=rsdP.getString("service_title")%></td>
                                    <td><%=rsdP.getString("service_details")%></td>
                                    <td><%=rsdP.getString("service_amount")%></td>
          
                                    <td><a href="Service.jsp?id=<%=rsdP.getString("service_id")%>">Delete</a></td>
                                </tr>
                                <%
                                    }
                                    if (request.getParameter("id") != null) {
                                        String del = "delete from tbl_product where product_id='" + request.getParameter("id") + "'";
                                        if (con.executeCommand(del)) {
                                %>
                                <script>
                                    alert("deleted");
                                    window.location = "Product.jsp";
                                </script>
                                <%
                                        }
                                    }
                                %>
                            </table>
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
