<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
 
<%
    if (request.getParameter("btn_login") != null) {
        String email = request.getParameter("txt_email");
        String password = request.getParameter("txt_password");

        String selQryA = "select * from tbl_admin where admin_email='" + email + "' and admin_password='" + password + "'";
        ResultSet rsA = con.selectCommand(selQryA);

        String selQryU = "select * from tbl_user where user_email='" + email + "' and user_password='" + password + "'";
        ResultSet rsU = con.selectCommand(selQryU);
        
        String selQryw = "select * from tbl_worker where worker_email='" + email + "' and worker_password='" + password + "'";
        ResultSet rsw = con.selectCommand(selQryw);

        String selQryS = "select * from tbl_shop where shop_email='" + email + "' and shop_password='" + password + "'";
        ResultSet rsS = con.selectCommand(selQryS);

        if (rsA.next()) {
            session.setAttribute("aname", rsA.getString("admin_name"));
            session.setAttribute("aid", rsA.getString("admin_id"));
            response.sendRedirect("Admin/HomePage.jsp");
        } else if (rsU.next()) {
            session.setAttribute("uname", rsU.getString("user_name"));
            session.setAttribute("uid", rsU.getString("user_id"));
            response.sendRedirect("User/");
            } else if (rsw.next()) {
            session.setAttribute("wname", rsw.getString("worker_name"));
            session.setAttribute("wid", rsw.getString("worker_id"));
            response.sendRedirect("Worker/");
             
        } else if (rsS.next()) {
           
            if (rsS.getString("shop_status").equals("1")) {
                session.setAttribute("sname", rsS.getString("shop_name"));
                session.setAttribute("sid", rsS.getString("shop_id"));
                response.sendRedirect("Shop/");
            } else if (rsS.getString("shop_status").equals("0")) {
%>
<script>
    alert("Verification Pending");
    window.location = "Login.jsp";
</script>
<%
} else if (rsS.getString("shop_status").equals("2")) {
%>
<script>
    alert("Sorry Your Account Has Been Blocked");
    window.location = "Login.jsp";
</script>
<%
    }
} else {
%>
<script>
    alert("Invalid Credentials");
    window.location = "Login.jsp";
</script>
<%
        }

    }
%>


<!doctype html>
<html lang="en">
    <head>
        <title>Login 07</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="Assets/Template/login/css/style.css">

    </head>
    <body>
        <%@include file="Head.jsp" %>
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <h2 class="heading-section">WELCOME TO ECLEAN</h2>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-12 col-lg-10">
                        <div class="wrap d-md-flex">
                            <div class="text-wrap p-4 p-lg-5 text-center d-flex align-items-center order-md-last">
                                <div class="text w-100">
                                    <h2>Welcome to login</h2>
                                    <p>Don't have an account?</p>
                                    <a href="User.jsp" class="btn btn-white btn-outline-white">Sign Up as USER</a>
                                    <a href="Worker.jsp" class="btn btn-white btn-outline-white">Sign Up as WORKER</a>
                                    <a style="margin-top: 10px" href="Shop.jsp" class="btn btn-white btn-outline-white">Sign Up as SHOP</a>
                                </div>
                            </div>
                            <div class="login-wrap p-4 p-lg-5">
                                <div class="d-flex">
                                    <div class="w-100">
                                        <h3 class="mb-4">Sign In</h3>
                                    </div>
                                    <div class="w-100">
                                        <p class="social-media d-flex justify-content-end">
                                            <a href="#" class="social-icon d-flex align-items-center justify-content-center"><span class="fa fa-facebook"></span></a>
                                            <a href="#" class="social-icon d-flex align-items-center justify-content-center"><span class="fa fa-twitter"></span></a>
                                        </p>
                                    </div>
                                </div>
                                <form action="#" method="post" class="signin-form">
                                    <div class="form-group mb-3">
                                        <label class="label" for="name">Email</label>
                                        <input type="text" class="form-control" name="txt_email" placeholder="Email" required>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label class="label" for="password">Password</label>
                                        <input type="password" class="form-control" name="txt_password" placeholder="Password" required>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" name="btn_login" class="form-control btn btn-primary submit px-3">Sign In</button>
                                    </div>
                                   
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script src="Assets/Template/login/js/jquery.min.js"></script>
        <script src="Assets/Template/login/js/popper.js"></script>
        <script src="Assets/Template/login/js/bootstrap.min.js"></script>
        <script src="Assets/Template/login/js/main.js"></script>
<%@include file="Foot.jsp" %>
    </body>
</html>

