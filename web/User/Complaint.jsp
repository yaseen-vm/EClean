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
if(request.getParameter("btn_submit")!=null)
{
    String insQry = "insert into tbl_complaint(complaint_date,complaint_details,user_id)values(curdate(),'"+request.getParameter("txt_complaint")+"','"+session.getAttribute("uid")+"')";
    if(con.executeCommand(insQry))
    {
        response.sendRedirect("index.jsp");
    }
}

%>
        <div class="send-message">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-heading">
                            <h2>Complaint</h2>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="contact-form">
                            <form method="post">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <fieldset>
                                            <textarea  rows="6" class="form-control" name="txt_complaint" id="txt_complaint" placeholder="Enter Your Complaint" required=""></textarea>
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
                                    <th>Date</th>
                                    <th>Complaint</th>
                                    <th>Reply</th>
                                </tr>
                                <%
                                    int i = 0;
                                    String selQryP = "select * from tbl_complaint where user_id='" + session.getAttribute("uid") + "'";
                                    ResultSet rsdP = con.selectCommand(selQryP);
                                    while (rsdP.next()) {
                                        i++;
                                %>
                                <tr>
                                    <td><%=i%></td>
                                    <td><%=rsdP.getString("complaint_date")%></td>
                                    <td><%=rsdP.getString("complaint_details")%></td>
                                    <td><%=rsdP.getString("complaint_reply")%></td>
                                </tr>
                                <%
                                    }
                                   
                                %>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <%@include file="Foot.jsp" %>
    </body>
</html>
