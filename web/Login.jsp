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
            } else if (rsS.next()) {
                if (rsS.getString("shop_status").equals("1")) {
                    session.setAttribute("sname", rsS.getString("shop_name"));
                    session.setAttribute("sid", rsS.getString("shop_id"));
                    response.sendRedirect("Shop/");
                } else if (rsS.getString("shop_status").equals("0")) {
    %>
    <script>
        alert("Verification Pending");
        window.location="Login.jsp";
    </script>
    <%
    } else if (rsS.getString("shop_status").equals("2")) {
    %>
    <script>
        alert("Sorry Your Account Has Been Blocked");
        window.location="Login.jsp";
    </script>
    <%
        }
    } else {
    %>
    <script>
        alert("Invalid Credentials");
        window.location="Login.jsp";
    </script>
    <%
            }

        }
    %>
                                <form action="#" class="signin-form" method="post">
                                    <div class="form-group mb-3">
                                        <label class="label" for="name">Email</label>
                                        <input type="email" class="form-control" placeholder="Email" required name="txt_email">
                                    </div>
                                    <div class="form-group mb-3">
                                        <label class="label" for="password">Password</label>
                                        <input type="password" class="form-control" placeholder="Password" required name="txt_password">
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" name="btn_login" class="form-control btn btn-primary submit px-3">Sign In</button>
                                    </div>

                                </form>