<%-- 
    Document   : Subcategory
    Created on : May 5, 2021, 2:10:22 PM
    Author     : Pro-TECH
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Subcategory</title>
        
        <%@include file="Header.jsp" %>
    </head>

    <%        String id = "", name = "", dis = "";

        if (request.getParameter("edit") != null) {

            id = request.getParameter("edit");
            name = request.getParameter("name");
            dis = request.getParameter("id");

        }

        if (request.getParameter("btn_save") != null) {

            if (request.getParameter("hid").equals("")) {
                String insQry = "insert into tbl_subcategory(category_id,subcategory_name)values('" + request.getParameter("sel_category") + "','" + request.getParameter("txt_subcategory") + "')";
                con.executeCommand(insQry);
                response.sendRedirect("Subcategory.jsp");
            } else {
                String upQry = "update tbl_subcategory set category_id='" + request.getParameter("sel_category") + "',subcategory_name='" + request.getParameter("txt_subcategory") + "' where subcategory_id='" + request.getParameter("hid") + "'";
                con.executeCommand(upQry);
                System.out.println(upQry);
                response.sendRedirect("Subcategory.jsp");
            }
        }

        if (request.getParameter("del") != null) {
            String delQry = "delete from tbl_subcategory where subcategory_id='" + request.getParameter("del") + "'";
            con.executeCommand(delQry);
            response.sendRedirect("Subcategory.jsp");
        }


    %>
    <body>


        <section class="main_content dashboard_part">

            <!--/ menu  -->
            <div class="main_content_iner ">
                <div class="container-fluid p-0">
                    <div class="row justify-content-center">
                        <div class="col-12">
                            <div class="QA_section">
                                <!--Form-->
                                <div class="white_box_tittle list_header">
                                    <div class="col-lg-12">
                                        <div class="white_box mb_30">
                                            <div class="box_header ">
                                                <div class="main-title">
                                                    <h3 class="mb-0" >Table Subcategory</h3>
                                                </div>
                                            </div>
                                            <form>
                                                <div class="form-group">
                                                    <label for="sel_category">Select Category</label>
                                                    <select required="" class="form-control" name="sel_category" id="sel_category">
                                                        <option value="" >Select</option>
                                                        <%                                                            String disQry = "select * from tbl_category";
                                                            ResultSet rs1 = con.selectCommand(disQry);
                                                            while (rs1.next()) {
                                                        %>
                                                        <option value="<%=rs1.getString("category_id")%>" <%if (dis.equals(rs1.getString("category_id"))) {
                                                                out.println("selected");
                                                            }%>><%=rs1.getString("category_name")%></option>
                                                        <%
                                                            }

                                                        %>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txt_subcategory">Subcategory Name</label>
                                                    <input required="" type="text" class="form-control" value="<%=name%>" id="txt_subcategory" name="txt_subcategory">
                                                    <input type="hidden" name="hid" value="<%=id%>">
                                                </div>
                                                    <div class="form-group" align="center">
                                                    <input type="submit" class="btn-dark" name="btn_save" style="width:100px; border-radius: 10px 5px " value="Save">
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                                <div class="QA_table mb_30">
                                    <!-- table-responsive -->
                                    <table class="table lms_table_active">
                                        <thead>
                                            <tr style="background-color: #74CBF9">
                                                <td align="center" scope="col">Sl.No</td>
                                                <td align="center" scope="col">Category</td>
                                                <td align="center" scope="col">Subcategory</td>
                                                <td align="center" scope="col">Action</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%                                                int i = 0;
                                                String selQry = "select * from tbl_subcategory p inner join tbl_category d on d.category_id=p.category_id";
                                                ResultSet rs = con.selectCommand(selQry);
                                                while (rs.next()) {

                                                    i++;

                                            %>
                                            <tr>    
                                                <td align="center"><%=i%></td>
                                                <td align="center"><%=rs.getString("category_name")%></td>
                                                <td align="center"><%=rs.getString("subcategory_name")%></td>
                                                <td align="center"> 
                                                    <a href="Subcategory.jsp?del=<%=rs.getString("subcategory_id")%>" class="status_btn">Delete</a> &nbsp;&nbsp;&nbsp;&nbsp; 
                                                    <a class="status_btn" href="Subcategory.jsp?edit=<%=rs.getString("subcategory_id")%>&name=<%=rs.getString("subcategory_name")%>&id=<%=rs.getString("category_id")%>">Edit</a>
                                                </td> 
                                            </tr>
                                            <%                      }


                                            %>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </section>
    </body>
    <%@include file="Footer.jsp" %>
</html>
