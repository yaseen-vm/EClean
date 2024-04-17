<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <style>
            .custom-alert-box{
                width: 20%;
                height: 10%;
                position: fixed;
                bottom: 0;
                right: 0;
                left: auto;
                z-index: 1;
            }

            .success {
                color: #3c763d;
                background-color: #dff0d8;
                border-color: #d6e9c6;
                display: none;
            }

            .failure {
                color: #a94442;
                background-color: #f2dede;
                border-color: #ebccd1;
                display: none;
            }

            .warning {
                color: #8a6d3b;
                background-color: #fcf8e3;
                border-color: #faebcc;
                display: none;
            }
        </style>
    </head>

    <%

        if (request.getParameter("id") != null) {
            String insQry = "insert into tbl_servicebooking(booking_date,service_id,user_id)values(curdate(),'" + request.getParameter("id") + "','" + session.getAttribute("uid") + "')";
     //out.println(insQry);
            //out.println(InsQry);
            if (con.executeCommand(insQry)) {
                response.sendRedirect("Pay.jsp");
            }
        }

    %>
    <body>

        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-9">
                    <h5 class="text-center" id="textChange">All Products</h5>
                    <hr>
                    <div class="text-center">
                        <img src="../Assets/Template/loader.gif" id='loder' width="200" style="display: none"/>
                    </div>
                    <div class="row" id="result">

                        <%                            String selProduct = "select * from tbl_service";
                            ResultSet rsP = con.selectCommand(selProduct);
                            while (rsP.next()) {
                        %>

                        <div class="col-md-3 mb-2">
                            <div class="card-deck">
                                <div class="card border-secondary">
                                    <img src="../Assets/Files/<%=rsP.getString("service_photo")%>" class="card-img-top" height="250">
                                    <div class="card-img-secondary">
                                        <h6  class="text-light bg-info text-center rounded p-1"><%=rsP.getString("service_title")%></h6>
                                        <a href="ViewService.jsp?id=<%=rsP.getString("service_id")%>" class="btn btn-warning btn-block">BOOK SERVICE</a>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>

                </div>

            </div>
        </div>

        <script>

            function addCart(id)
            {
                $.ajax({
                    url: "../Assets/AjaxPages/AjaxAddCart.jsp?id=" + id,
                    success: function(response) {
                        if (response.trim() === "Added to Cart")
                        {
                            $("div.success").fadeIn(300).delay(1500).fadeOut(400);
                        }
                        else if (response.trim() === "Already Added to Cart")
                        {
                            $("div.warning").fadeIn(300).delay(1500).fadeOut(400);
                        }
                        else
                        {
                            $("div.failure").fadeIn(300).delay(1500).fadeOut(400);
                        }
                    }
                });
            }
            function buyNow(id, amt)
            {
                $.ajax({
                    url: "../Assets/AjaxPages/AjaxBuy.jsp?id=" + id + "&amt=" + amt,
                    success: function(response) {
                        if (response !== "false")
                        {
                            window.location = "Payment.jsp";
                        }

                    }
                });
            }
            $(document).ready(function() {

                $(".product_check").click(function() {
                    $("#loder").show();

                    var action = 'data';
                    var category = get_filter_text('category');
                    var subcategory = get_filter_text('subcategory');

                    $.ajax({
                        url: "../Assets/AjaxPages/AjaxSearch.jsp?action=" + action + "&category=" + category + "&subcategory=" + subcategory,
                        success: function(response) {
                            $("#result").html(response);
                            $("#loder").hide();
                            $("#textChange").text("Filtered Products");
                        }
                    });


                });

                function get_filter_text(text_id)
                {
                    var filterData = [];

                    $('#' + text_id + ':checked').each(function() {
                        filterData.push($(this).val());
                    });
                    return filterData;
                }
            });
        </script>
    </body>
</html>

