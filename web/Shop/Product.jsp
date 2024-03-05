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
                            <h2>Product Registration</h2>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="contact-form">
                            <form enctype="multipart/form-data" method="post" action="../Assets/ActionPages/ProductUploadAction.jsp">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <fieldset>
                                            <input  type="text" class="form-control" name="txt_name" id="txt_name"  placeholder="Name" required="">
                                        </fieldset>
                                    </div>
                                    <div class="col-lg-12">
                                        <fieldset>
                                            <textarea  rows="6" class="form-control" name="txt_details" id="txt_address" placeholder="Details" required=""></textarea>
                                        </fieldset>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <fieldset>
                                            <select class="form-control" name="sel_category" id="sel_category" onchange="getSubcategory(this.value)">
                                                <option value="">Select Category</option>
                                                <%
                                                    String selQry = "select * from tbl_category";
                                                    ResultSet rsd = con.selectCommand(selQry);
                                                    while (rsd.next()) {
                                                %>
                                                <option value="<%=rsd.getString("category_id")%>"><%=rsd.getString("category_name")%></option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                        </fieldset>
                                        <br>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <fieldset>
                                            <select class="form-control" name="sel_subcat" id="sel_subcat">
                                                <option value="">Select Subcategory</option>
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
                                            <input  type="text" class="form-control" name="txt_rate" id="txt_rate"  placeholder="Offer Rate" required="">
                                        </fieldset>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <fieldset>
                                            <select class="form-control" name="sel_brand" id="sel_brand" >
                                                <option value="">Select Brand</option>
                                                <%
                                                    String selQry1 = "select * from tbl_brand";
                                                    ResultSet rsd1 = con.selectCommand(selQry1);
                                                    while (rsd1.next()) {
                                                %>
                                                <option value="<%=rsd1.getString("brand_id")%>"><%=rsd1.getString("brand_name")%></option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                        </fieldset>
                                        <br>
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
                                    <th>Product</th>
                                    <th>Brand</th>
                                    <th>Category</th>
                                    <th>Subcategory</th>
                                    <th>Rate</th>
                                    <th>MRP</th>
                                    <th colspan="3" style="text-align: center">Action</th>
                                </tr>
                                <%
                                    int i = 0;
                                    String selQryP = "select * from tbl_product p inner join tbl_brand b on b.brand_id=p.brand_id inner join tbl_subcategory sc on sc.subcategory_id=p.subcategory_id inner join tbl_category c on c.category_id=sc.category_id where shop_id='" + session.getAttribute("sid") + "'";
                                    ResultSet rsdP = con.selectCommand(selQryP);
                                    while (rsdP.next()) {
                                        i++;
                                %>
                                <tr>
                                    <td><%=i%></td>
                                    <td><a href="../Assets/Files/<%=rsdP.getString("product_photo")%>"><img src="../Assets/Files/<%=rsdP.getString("product_photo")%>" height="120" width="120" style="border-radius: 50%"/></a></td>
                                    <td><%=rsdP.getString("product_name")%></td>
                                    <td><%=rsdP.getString("brand_name")%></td>
                                    <td><%=rsdP.getString("category_name")%></td>
                                    <td><%=rsdP.getString("subcategory_name")%></td>
                                    <td><%=rsdP.getString("product_rate")%></td>
                                    <td><%=rsdP.getString("MRP")%></td>
                                    <td><a href="Product.jsp?id=<%=rsdP.getString("product_id")%>">Delete</a></td>
                                    <td><a href="Stock.jsp?id=<%=rsdP.getString("product_id")%>">Stock</a></td>
                                    <td><a href="Offer.jsp?id=<%=rsdP.getString("product_id")%>">Offer</a></td>
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
