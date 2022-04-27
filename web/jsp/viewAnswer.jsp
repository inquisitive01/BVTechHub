<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Answer</title>
        <script>
            function myFunction() {
                var x = document.getElementById("mainnav");
                if (x.className === "navbar") {
                    x.className += "  responsive";
                } else {
                    x.className = "navbar";
                }
            }
        </script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Volkhov&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@500&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Potta+One&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Pangolin&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Eczar&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="../css/viewAnswer.css">
    </head>
    <body>
        <!---NavBar Starts--->
        <div class="navbar" id="mainnav">
            <div>
                <div class="left"><img src="../images/logobg.png" alt=""></div>
            </div>
            <nav>
                <div class="navbar-links">
                    <a href="../html/Home.html" class="active" style="margin-left: 75px">Home</a>
                    <div class="subnav">
                        <button class="subnavbtn">Experiences<i class="fa fa-caret-down"></i></button>
                        <div class="subnav-content">
                            <a href="../html/internshipLanding.html">Internship Experience</a>
                            <a href="../html/placementLanding.html">Placement Experience</a>
                        </div>
                    </div>
                    <div class="subnav">
                        <button class="subnavbtn">Suggestions <i class="fa fa-caret-down"></i></button>
                        <div class="subnav-content">
                            <a href="../html/seminar.html">Seminar</a>
                            <a href="../html/projectIdeas.html">Projects</a>
                            <a href="../html/resumeBuilding.html">Resume Building</a>
                        </div>
                    </div>
                    <div class="subnav">
                        <button class="subnavbtn">Roadmaps<i class="fa fa-caret-down"></i></button>
                        <div class="subnav-content">
                            <a href="../html/roadmapDSA.html">Data Structures and Algorithms</a>
                            <a href="../html/webDevelopment.html">Web Development</a>
                            <a href="../html/ai_mlRoadmap.html">AI/ML</a>
                            <a href="../html/androidRoadmap.html">Android Development</a>
                        </div>
                    </div>
                    <a href="../html/resourcesLandingPage.html">Resources</a>
                    <a href="../html/motivation.html">Motivation</a>
                    <a href="../jsp/discussionLandingPage.jsp">Discussion forum</a>
                    <div class="subnav">
                        <button class="subnavbtn" id="profile">You<i class="fa fa-caret-down"></i></button>
                        <div class="subnav-content" id="profile">
                            <a href="../jsp/studentProfile.jsp" target="_blank">View Profile</a>
                            <a href="../jsp/logout.jsp">Logout</a>
                        </div>
                    </div>
                    <a href="javascript:void(0);" class="icon" onclick="myFunction()">&#9776;</a>
                </div>
            </nav>
        </div>
        <!---------NavBar Ends----------->
        <section>
            <br> <br> 
            <!--Displaying question with date and time for which answers are displayed-->
            <h1>Question</h1>
            <div id="question">
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/BVTechHub", "root", "aadivyoma");
                        int id = Integer.parseInt(request.getParameter("id"));
                        Statement stmt2 = conn.createStatement();
                        String Queryques = "Select ques,date(date_time),time(date_time) from discussion_forum where quesid='" + id + "'";
                        ResultSet rs_q = stmt2.executeQuery(Queryques);
                        boolean status = rs_q.next();
                        if (status) {
                            out.print(rs_q.getString(1));
                %>
            </div>  
            <div id="date">
                <%
                    out.print(rs_q.getString(2));
                    /*}conn.close();

                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }*/
                %>
            </div>
            <div id="time">
                <%
                            out.print(" " + rs_q.getString(3));
                        }
                        conn.close();

                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                %>

            </div>   
                <!--Displaying answers for the question along with name of the student who has answered-->
            <h1>Answers</h1>
            <div class="tbl-header">
                <table style="width:100%" cellpadding="0" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Answered By</th>
                            <th>Answer</th>
                        </tr>
                    </thead>
                </table>
            </div>


            <div class="tbl-content">
                <%       int flag=0;
                    
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/BVTechHub", "root", "aadivyoma");
                        int id = Integer.parseInt(request.getParameter("id"));
                        Statement stmt = conn.createStatement();

                        String Query = "SELECT student.sname,stud_discussion.answer from stud_discussion INNER JOIN student ON student.semailid=stud_discussion.semailid WHERE stud_discussion.quesid=" + id;

                        ResultSet rs = stmt.executeQuery(Query);
                        out.println("<html><body><form name=ff>");

                        out.print("<table style=width:100% cellspacing=0 cellpadding=0>");

                        while (rs.next()) {
                            flag=1;
                            out.print("<tr><td> " + rs.getString(1) + "</td>");
                            out.print("<td> " + rs.getString(2) + "</td>");
                            out.print("</tr>");
                        }
                        out.print("</table>");
                        boolean status=rs.next();
                        if((status==false) &&(flag==0)){
                             out.println("<html><div id=error><p>Be the first one to answer this question</p></div></html>");
                             } 
                        out.println("</form></body></html>");
                        conn.close();

                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }

                %>
            </div>
        </section>
        <h4>BVTechHub provides all its users with a ‘Add Answer’ feature as we grow together by lifting others :)</h4>
        <div class="b">
            <button type="submit" class="btn1" name="Add" onclick="window.open('../jsp/addDiscussAnswer.jsp?quesid=<%=Integer.parseInt(request.getParameter("id"))%>');">Add Answer</button>
        </div> 
        <br> <br> <br> <br> <br> <br>
        <!-- HTML Code For Footer -->
        <div class="final">
        <!-- div for responsive footer-->
        <footer class="ct-footer">
            <div class="inner-right">
                <p>Copyright ©️ 2022 BVTechHub.&nbsp; Privacy Policy Rights reserved to BVTechHub<br> Web Design by
                    CS10
                    of Banasthali Vidyapith</p>
            </div>
        </footer>
    </div>
    </body>
</html>