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
                            <h2>Stock Registration</h2>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="contact-form">
                            <form >
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <fieldset>
                                            <input  type="date" class="form-control" name="txt_date" id="txt_date"  required="">
                                        </fieldset>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <fieldset>
                                            <input  type="text" class="form-control" name="txt_qty" id="txt_qty"  placeholder="Quatity" required="">
                                            <input  type="hidden" value="<%=request.getParameter("id")%>" name="txt_id">
                                        </fieldset>
                                    </div>
                                    <div class="col-lg-12">
                                        <fieldset>
                                            <button type="submit" id="form-submit" name="btn_submit"  value="save" class="filled-button">Submit</button>
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
                                    <th>Product</th>
                                    <th>Quatity</th>
                                    <th>Date</th>
                                    <th colspan="2" style="text-align: center">Action</th>
                                </tr>
                                <%

                                    if (request.getParameter("btn_submit") != "") {

                                        String insQry = "insert into tbl_stock(stock_qty,stock_date,product_id)values('" + request.getParameter("txt_qty") + "','" + request.getParameter("txt_date") + "','" + request.getParameter("txt_id") + "')";
//                                       System.out.println(insQry);
                                        if (con.executeCommand(insQry)) {
                                            response.sendRedirect("Stock.jsp?id=" + request.getParameter("txt_id"));
                                        }
                                    }

                                    int i = 0;
                                    String selQryP = "select * from tbl_stock s inner join tbl_product p on p.product_id=s.product_id where p.product_id='" + request.getParameter("id") + "'";
                                    ResultSet rsdP = con.selectCommand(selQryP);
                                    while (rsdP.next()) {
                                        i++;
                                %>
                                <tr>
                                    <td><%=i%></td>
                                    <td><%=rsdP.getString("product_name")%></td>
                                    <td><%=rsdP.getString("stock_qty")%></td>
                                    <td><%=rsdP.getString("stock_date")%></td>
                                    <td><a href="Stock.jsp?id=<%=rsdP.getString("product_id")%>&sid=<%=rsdP.getString("stock_id")%>">Delete</a></td>
                                </tr>
                                <%
                                    }

                                    if (request.getParameter("sid") != null) {
                                        String del = "delete from tbl_stock where stock_id='" + request.getParameter("sid") + "'";
                                        if (con.executeCommand(del)) {
                                            response.sendRedirect("Stock.jsp?id=" + request.getParameter("id"));
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
