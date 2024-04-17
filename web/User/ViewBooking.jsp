<%-- 
    Document   : ViewBookings
    Created on : 21 Dec, 2021, 12:50:02 PM
    Author     : hp
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Bookings</title>
    </head>
    <body>
        <%@include file="Head.jsp" %>
        <br><br><br><br><br><br><br>
        <h2>Bookings</h2>
        <br> <br>
        <table align='center' border="1" width="50%" >
            <tr>
                <th>SL.No</th>

                <th>Service</th>
                <th>Date</th>
                <th>Status</th>
            </tr>
            <%                int i = 0;
                String selQry = "select * from tbl_servicebooking b inner join  tbl_service s on s.service_id=b.service_id inner join tbl_worker w on w.worker_id=s.worker_id where user_id='" + session.getAttribute("uid") + "'";
                ResultSet rs = con.selectCommand(selQry);
                while (rs.next()) {
                    i++;

            %>
            <tr>
                <td><%=i%></td>

                <td><%=rs.getString("service_title")%></td>
                <td><%=rs.getString("service_details")%></td>
                <td>
                    <%
                        if (rs.getString("booking_status").equals("0")) {
                            out.println("Pending");
                        } else if (rs.getString("booking_status").equals("1")) {
                            out.println("Accepted");
                        } else if (rs.getString("booking_status").equals("2")) {
                            out.println("Rejected");
                        }

                    %>
                </td>

            </tr>         
            <%                }


            %> 
        </table>
        <%@include file="Foot.jsp" %>
    </body>
</html>
