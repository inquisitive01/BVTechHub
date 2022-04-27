<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css2?family=El+Messiri&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Potta+One&display=swap" rel="stylesheet">
        <title>Placement Experience</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Volkhov&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@500&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Potta+One&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Pangolin&display=swap" rel="stylesheet">
        <!-- Load an icon library to show a hamburger menu (bars) on small screens -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Eczar&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="../css/expCompanyInternship.css">
    </head>
    <body>
    <!---Navbar starts--->
    <div class="navbar" id="mainnav">
        <div>
            <div class="left"><img src="../images/logobg.png" alt=""></div>
        </div>
        <nav>
            <div class="navbar-links">
                <a href="../html/AHome.html" class="active" style="margin-left: 75px">Home</a>
                <div class="subnav">
                    <button class="subnavbtn">Experiences<i class="fa fa-caret-down"></i></button>
                    <div class="subnav-content">
                        <a href="../html/AinternshipLanding.html">Internship Experience</a>
                        <a href="../html/AplacementLanding.html">Placement Experience</a>

                    </div>
                </div>
                <div class="subnav">
                    <button class="subnavbtn">Suggestions <i class="fa fa-caret-down"></i></button>
                    <div class="subnav-content">
                        <a href="../html/Aseminar.html">Seminar</a>
                        <a href="../html/AprojectIdeas.html">Projects</a>
                        <a href="../html/AresumeBuilding.html">Resume Building</a>
                    </div>
                </div>
                <div class="subnav">
                    <button class="subnavbtn">Roadmaps<i class="fa fa-caret-down"></i></button>
                    <div class="subnav-content">
                        <a href="../html/AroadmapDSA.html">Data Structures and Algorithms</a>
                        <a href="../html/AwebDevelopment.html">Web Development</a>
                        <a href="../html/Aai_mlRoadmap.html">AI/ML</a>
                        <a href="../html/AandroidRoadmap.html">Android Development</a>
                    </div>
                </div>

                <a href="../html/AresourcesLandingPage.html">Resources</a>
                <a href="../html/Amotivation.html">Motivation</a>
                <a href="../jsp/AdiscussionLandingPage.jsp">Discussion forum</a>

                <div class="subnav">
                    <button class="subnavbtn" id="profile">You<i class="fa fa-caret-down"></i></button>

                    <div class="subnav-content" id="profile">
                        <a href="../jsp/adminProfile.jsp" target="_blank">View Profile</a>
                        <a href="../jsp/changeStudPassByAdmin.jsp" target="_blank">Change Student Password</a>
                        <a href="../jsp/adminRegister.jsp" target="_blank">Register New Admin</a>
                        <a href="../jsp/logout.jsp">Logout</a>
                    </div>
                </div>
                <a href="javascript:void(0);" class="icon" onclick="myFunction()">&#9776;</a>
            </div>
        </nav>
    </div>
    <!----------NAVBAR DONE----------->
        <br> <br>
        <section>
           <!--Heading of the page--> 
           <h1>Placement Experiences</h1>
            <div class="tbl-header">
                <!--Placement experience table-->
                <table style="width:100%" cellpadding="0" cellspacing="0">
                    <thead>
                        <tr>
                            <!--Table row headings-->
                            <th>No.</th>
                            <th>NAME</th>
                            <th>COMPANY</th>
                            <th>POSITION</th>
                            <th>VERDICT</th>
                            <th>READ MORE</th>
                        </tr>
                    </thead>
                </table>
            </div>
           <!--Table content being shown from the database-->
            <div class="tbl-content">
                <% int m=1,flag=0;
                    try {
                        
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/BVTechHub", "root", "aadivyoma");
                        String cn = (String)request.getParameter("cname");//company name taken from the landing page for which the user has chosen the card
                        String ct = request.getParameter("category"); //category is 'Placement' taken from the landing page 
                        Statement stmt = conn.createStatement();
                        
                      if(cn.contains("Others")) //if the company name is different from the cards made by default
                       {
                           
                      
                        String query1="SELECT e.semailid,e.eid, e.description, e.Company, e.Position, e.verdict, s.sname FROM  experience e INNER JOIN student s  ON e.semailid = s.semailid WHERE e.Company <>"+"'Cisco'"+"and e.Company <>"+"'IBM'"+"and e.Company <>"+"'Myntra'"+"and e.Company <>"+"'McKinsey'"+
                                       "and e.Company <>"+"'Walmart'"+"and e.Company <>"+"'Infosys'"+"and e.Company <>"+"'HSBC'"+"and e.Company <>"+"'PayTM'"+"and e.Company <>"+"'MakeMyTrip'"+"and e.Company <>"+"'Accenture'"+"and e.Company <>"+"'JP Morgan and Chase'"+"and e.Company <>"+"'TCS'"+"and e.Company <>"+"'Oracle'"+"and e.Company <>"+"'Beckton Dickinson'"
                                       +"and e.Company <>"+"'Barclays'"+"and e.Company <>"+"'American Express'"+"and e.Company <>"+"'Goldman Sachs'"+"and e.Company <>"+"'Flipkart'"+"and e.Company <>"+"'UBS'"+"and e.category="+ct;
                        ResultSet rs1 = stmt.executeQuery(query1);
                        out.print("<table style=width:100% cellspacing=0 cellpadding=0>");
                        while (rs1.next()) {
                            flag=1;
                            out.print("<tr><td>" + m + "</td>");  //for the serial number to be displayed
                            out.print("<td> " + rs1.getString(7) + "</td>");//student name 
                            out.print("<td> " + rs1.getString(4) + "</td>");//company name
                            out.print("<td> " + rs1.getString(5) + "</td>");//position 
                            out.print("<td> " + rs1.getString(6) + "</td>");//verdict
                            m++; //incrementing m for every row
                %>
                <!--emailid and description sent to expDescriptionPlacement.jsp page-->
                <td><a href="expDescriptionPlacement.jsp?sid=<%=rs1.getString(1)%>&des=<%=rs1.getString(3)%>&eid=<%=rs1.getInt(2)%>"><input type="hidden" name="Read More" class="change">Read more</a></td>
                        <%
                                    out.print("</tr>");
                                }
                                out.print("</table>");
                                boolean status=rs1.next();
                           if((status==false) &&(flag==0)){
                             out.println("<html><div id=error><p>Currently, no experience exists for this company.</p></div></html>");
                             } 
                        }
                       
                     else{
                        
                        String query = "SELECT EXPERIENCE.semailid,EXPERIENCE.eid, EXPERIENCE.description, EXPERIENCE.company, EXPERIENCE.position, EXPERIENCE.verdict, STUDENT.sname FROM EXPERIENCE INNER JOIN STUDENT ON EXPERIENCE.semailid = Student.semailid WHERE EXPERIENCE.company=" + cn + " and EXPERIENCE.category=" + ct;
                        ResultSet rs = stmt.executeQuery(query);
                       out.print("<table style=width:100% cellspacing=0 cellpadding=0>");
                        while (rs.next()) {
                            flag=1;
                            out.print("<tr><td>" + m + "</td>");//for the serial number to be displayed
                            out.print("<td> " + rs.getString(7) + "</td>");//student name 
                            out.print("<td> " + rs.getString(4) + "</td>");//company name
                            out.print("<td> " + rs.getString(5) + "</td>");//position 
                            out.print("<td> " + rs.getString(6) + "</td>");//verdict
                            m++;//incrementing m for every row
                %>
                 <!--emailid and description sent to expDescriptionPlacement.jsp page-->
                <td><a href="expDescriptionPlacement.jsp?sid=<%=rs.getString(1)%>&des=<%=rs.getString(3)%>&eid=<%=rs.getInt(2)%>"><input type="hidden" name="Read More" class="change">Read more</a></td>
                        <%
                                    out.print("</tr>");
                                }
                                out.print("</table>");
                                boolean status=rs.next();
                           if((status==false) &&(flag==0)){
                             out.println("<html><div id=error><p>Currently, no experience exists for other companies.</p></div></html>");
                             } 
                            }
                            } catch (Exception ex) {
                                ex.printStackTrace();
                            }
                        %> </div>
        </section>
        <!-- div for responsive footer-->
        <br> <br> <br> <br> 
        <footer class="ct-footer" >     
            <div class="inner-right">
                <p>Copyright © 2022 BVTechHub.&nbsp; Privacy Policy Rights reserved to BVTechHub<br> Web Design by CS10 of Banasthali Vidyapith</p>
            </div>
        </footer>
    </body>
</html>
<!--javascript for responsive navbar-->
<script>
    
        /* Toggle between adding and removing the "responsive" class to navbar when the user clicks on the icon */
        function myFunction() {
            var x = document.getElementById("mainnav");
            if (x.className === "navbar") {
                x.className += "  responsive";
            } else {
                x.className = "navbar";
            }




        }
    </script> 
