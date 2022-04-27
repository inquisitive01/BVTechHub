<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%

    String name = (String) session.getAttribute("mailid");


%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=El+Messiri&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Potta+One&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="../css/deleteResources.css">
        <!--<link rel="stylesheet" href="../css/search.css">-->
        <title> Delete Resources</title>

    </head>
    <!--Javascript to select all checkboxes when the one in the heading is chosen-->
    <script type="text/javascript">
        $(document).ready(function () {
            $("#checkAll").click(function () {

                if ($(this).is(":checked")) {
                    $(".checkresource").prop('checked', true);
                } else {
                    $(".checkresource").prop('checked', false);
                }



            });
        });
    </script>
    <body>
        <header class="class">
            <!-- Left Box for logo -->
            <div class="left">
                <div class="left"><img src="../images/logobg.png" alt=""></div> 
            </div>
        </header>
        <div class="delete">
            <!--search box to search using student emailid-->
            <div class="searchBox">
                <form method="post">
                    <input type="text" placeholder="Search by Email ID" name="emailid">
                    <button type="submit" name="search" value="Search">SEARCH</button>

                </form>
            </div>
        </div>

        <section>

            <div class="tbl-header">
                <table id="myTable" style="width:100%" cellpadding="0" cellspacing="0" >
                    <thead>
                        <tr>
                            <th><input type="checkbox" id="checkAll"></th>
                            <th>S.No</th>
                            <th>NAME</th>
                            <th>TOPIC</th>
                            <th>SUBJECT</th>


                        </tr>
                    </thead>
                </table>
            </div>

            <!--displaying table content fetching data from the database-->

            <div class="tbl-content">


                <%                    int k = 0, m = 1;
                    if (request.getParameter("search") == null) { //if search button is not clicked
                        try {
                            String semailid = request.getParameter("emailid");//emailid entered to be searched
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            String query = "Select * from resources where semailid='" + semailid + "'";
                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/BVTechHub", "root", "aadivyoma");
                            Statement stmt = conn.createStatement();
                            ResultSet rs1 = stmt.executeQuery(query);
                            ResultSet rs = stmt.executeQuery("SELECT r.rid, s.sname,r.material,r.topic ,r.subject FROM BVTechHub.resources r,BVTechHub.student s where s.semailid=r.semailid");

                                out.println("<html><body><form name=ff>"); %>
                <table id="myTable" style=width:100% cellspacing=0 cellpadding=0>


                    <%    while (rs.next()) {
                            out.print("<tr>");
                    %>   
                    <!--value of checkbox assigned as rid-->
                    <tr><td><input type="checkbox" class="checkresource" name="rid" value="<%=rs.getInt(1)%>"></td>

                        <%
                                out.print("<td> " + m + "</td>"); //serial number for every row
                                out.print("<td id=email> " + rs.getString(2) + "</td>"); //emailid of student
                                out.print("<td> " + rs.getString(4) + "</td>");
                                out.print("<td> " + rs.getString(5) + "</td>");
                                out.print("</tr>");
                                m++;//incrementing m for every row
                            }
                              
                            out.print("</table>");

                        %>
                        <!--when delete button is pressed a pop up appears to confirm choice-->
                    <input type="submit" name="delete" value="Delete" onclick="return confirm('Are you sure you want to delete!')">   

                    <%    out.println("</form></body></html>");

                            } catch (Exception ex) {
                                ex.printStackTrace();
                            }
                        }

                        if (request.getParameter("delete") != null) { //when delete button is clicked
                            try {

                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/BVTechHub", "root", "aadivyoma");
                                Statement stmt = conn.createStatement();
                                ResultSet rs = stmt.executeQuery("select * from resources");
                                String[] values = request.getParameterValues("rid"); //an array for all the rid's associated with checkboxes selected 

                                if (values.length == 0) {
                                    out.println("<script>alert('No row has been selected');</script>"); //if no row is selected
                                } else {
                                    for (int i = 0; i < values.length; i++) {
                                        k = stmt.executeUpdate("delete from resources where rid= " + values[i]); //all the selected rows are deleted from database

                                    }
                                    if (k > 0) {
                                        out.println("<script>alert('Resource deleted successfully')</script>");
                                        response.sendRedirect("../jsp/deleteResources.jsp");

                                    }

                                    conn.close();
                                }
                            } catch (Exception ex) {
                                ex.printStackTrace();
                            }
                        }


                    %>



                    <%                    int s = 1, flag = 0;
                        if (request.getParameter("search") != null) { //when search button is clicked

                            String emailid;
                            emailid = request.getParameter("emailid");

                            String query1 = "SELECT r.rid,s.sname,r.material,r.topic ,r.subject FROM bvproject.resources r,bvproject.student s where s.semailid=r.semailid and r.semailid='" + emailid + "'";
                      try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/BVTechHub", "root", "aadivyoma");
                                Statement stmt = conn.createStatement();
                                ResultSet rs1 = stmt.executeQuery(query1);
                                out.println("<html><body><form name=ff>"); %>
                    <table id="myTable" style=width:100% cellspacing=0 cellpadding=0>

                        <%    while (rs1.next()) {
                                flag = 1;
                                out.print("<tr>");
                        %>   

                        <tr><td><input type="checkbox" class="checkresource" name="rid" value="<%=rs1.getInt(1)%>"></td>

                            <%
                                out.print("<td> " + s + "</td>");
                                out.print("<td> " + rs1.getString(2) + "</td>");
                                out.print("<td> " + rs1.getString(4) + "</td>");
                                out.print("<td> " + rs1.getString(5) + "</td>");
                               
                            %>
                        </tr>


                        <%                                         s++;
                            }
                            boolean status = rs1.next();
                            if ((status == false) && (flag == 0)) {
                                out.println("<html><div id=error><p>No record exists for the entered email id</p></div></html>");// incase of no record for entered email id
                            }


                        %>
                    </table>
                      <!--when delete button is pressed a pop up appears to confirm choice-->
                    <input type="submit" name="delete" value="Delete" onclick="return confirm('Are you sure you want to delete!')">   

                    <%    out.println("</form>");

                                conn.close();
                            } catch (Exception ex) {
                                ex.printStackTrace();
                            }
                        }
                    %>

                    </section>

                    </div>   
                    <br><br><br><br><br>

                    <div class="final">
                        <!-- div for responsive footer-->
                        <footer class="ct-footer">     
                            <div class="inner-right">
                                <p>Copyright ©️ 2022 BVTechHub.&nbsp; Privacy Policy Rights reserved to BVTechHub<br> Web Design by CS10 of Banasthali Vidyapith</p>
                            </div>
                        </footer>
                    </div>


                    </body>



                    </html>
