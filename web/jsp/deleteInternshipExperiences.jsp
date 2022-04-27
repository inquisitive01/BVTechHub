<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<!--we get the email ID of the student through the session set-->
<% String name = (String) session.getAttribute("mailid"); %> 
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="../css/deleteResources.css?version9" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link
      href="https://fonts.googleapis.com/css2?family=El+Messiri&display=swap"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Potta+One&display=swap"
      rel="stylesheet"
    />
    <title>Delete Experience</title>
    
    <!--JavaScript code so that all checkboxes are selected when the checkbox in table header is selected-->
    <script type="text/javascript">
      $(document).ready(function () {
        $("#checkAll").click(function () {
          if ($(this).is(":checked")) {
            $(".deletecheck").prop("checked", true);
          } else {
            $(".deletecheck").prop("checked", false);
          }
        });
      });
    </script>
  </head>
  <body>
    <header class="class">
      <!-- Left Box for logo -->
      <div class="left">
        <div class="left"><img src="../images/logobg.png" alt="" /></div>
      </div>
    </header>
    <!--HTML code for the delete internship experiences-->
    <div class="delete">
        <!--HTML code for the search box--> 
        <div class="searchBox">
            <form method="post">
                <input type="text" placeholder="Search by Email ID" name="emailid" />
                <button type="submit" name="search" value="Search">SEARCH</button>
            </form>
        </div>
        <!--HTML code to display the internship experiences added by the students-->
        <section>
            <div class="tbl-header">
                <table style="width: 100%" cellpadding="0" cellspacing="0">
                    <thead>
                        <tr>
                            <th><input type="checkbox" id="checkAll" /></th>
                            <th>S No.</th>
                            <th>NAME</th>
                            <th>COMPANY</th>
                            <th>POSITION</th>
                            <th>VERDICT</th>
                        </tr>
                    </thead>
                </table>
            </div>
            <div class="tbl-content">
                <!--Code to display records when the search bar is not used-->
                 <%
                        int k = 0, s_no = 1;
                        if (request.getParameter("search") == null) {
                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/BVTechHub","root","aadivyoma");
                                Statement stmt = conn.createStatement();
                                ResultSet rs = stmt.executeQuery("select e.eid, s.sname, e.company,e.position, e.verdict from student s, experience e where s.semailid = e.semailid and category='Internship' order by s.sname ASC");
                                out.println("<html><body><form name=ff>");
                                out.print("<table style=width:100% cellspacing=0 cellpadding=0>");

                                while (rs.next()) {
                    %>
                    <tr><td> <input type="checkbox" class="deletecheck" name="eid" value="<%=rs.getInt(1)%>"></td>
                            <%
                                    out.print("<td> " + s_no + "</td>");
                                    out.print("<td> " + rs.getString(2) + "</td>");
                                    out.print("<td> " + rs.getString(3) + "</td>");
                                    out.print("<td> " + rs.getString(4) + "</td>");
                                    out.print("<td> " + rs.getString(5) + "</td>");
                                    out.print("</tr>");
                                    s_no++;
                                }
                                out.print("</table>");
                            %>
                    <input type="submit" name="delete" value="Delete" onclick="return confirm('Are you sure you want to delete!')">
                    <%
                                out.println("</form></body></html>");
                            } catch (Exception ex) {
                                ex.printStackTrace();
                            }
                        }

                   //code to delete selected records (when delete button is clicked)

                        if (request.getParameter("delete") != null) {
                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/BVTechHub","root","aadivyoma");
                                Statement stmt = conn.createStatement();
                                ResultSet rs = stmt.executeQuery("select * from experience");
                                String[] values = request.getParameterValues("eid");
                                if (values.length == 0) {
                                    out.println("<script>alert('No row has been selected');</script>");
                                } else {

                                    for (int i = 0; i < values.length; i++) {
                                        k = stmt.executeUpdate("delete from experience where eid= " + values[i]);
                                    }
                                    if (k > 0) {
                                        out.println("<script>alert('Experience deleted successfully')</script>");
                                        response.sendRedirect("deleteInternshipExperiences.jsp");
                                    }
                                }
                                conn.close();
                            } catch (Exception ex) {
                                ex.printStackTrace();
                            }
                        }
                    %>
                   <!--code to display searched records according to student emailid-->
                    <%
                                      int s = 1,flag=0;
                            if (request.getParameter("search") != null) {

                                String emailid;
                                emailid = request.getParameter("emailid");

                               String query1="select e.eid,s.sname,e.company,e.position,e.verdict from experience e , student s where s.semailid=e.semailid and e.semailid='" + emailid + "' and e.category='Internship'";  
                                    
                               
                                try {
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/BVTechHub","root","aadivyoma");
                                    
                                    Statement stmt = conn.createStatement();
                                    //ResultSet rs = stmt.executeQuery(query);
                                   
                                    ResultSet rs1 = stmt.executeQuery(query1);
                                   out.println("<html><body><form name=ff>"); %>
                        <table id="myTable" style=width:100% cellspacing=0 cellpadding=0>

                            <%    
                                while (rs1.next()){
                                  flag=1;
                                
                                    
                            %>   

                            <tr><td><input type="checkbox" class="checkresource" name="rid" value="<%=rs1.getInt(1)%>"></td>

                                <%      
                                        out.print("<td> " + s + "</td>");
                                        out.print("<td> " + rs1.getString(2) + "</td>");
                                        out.print("<td> " + rs1.getString(3) + "</td>");
                                        out.print("<td> " + rs1.getString(4) + "</td>");
                                        out.print("<td> " + rs1.getString(5) + "</td>");
                                 
                                %>
                                 </tr>
                                
                                 
                                 <%
                                        s++;
                                    }
                               boolean status=rs1.next();
                                if((status==false) && (flag==0)){
                                    out.println("<html><div id=error><p>No record exists for the entered email id</p></div></html>");
                                    }

                                   

                                %>
                        </table>
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
