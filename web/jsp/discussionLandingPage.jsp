<%@page import= "java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Discussion Forum</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/css2?family=Potta+One&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Mochiy+Pop+P+One&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@1,700&display=swap" rel="stylesheet"><!-- comment -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Volkhov&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@500&display=swap" rel="stylesheet">
        <!-- Load an icon library to show a hamburger menu (bars) on small screens -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Eczar&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="../css/discussionLandingPage.css">
    </head>
    <body>
        <!---Navbar starts--->
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
    <!----------NAVBAR DONE----------->
        <section>
            <h1>Discussion Forum</h1>
            <div class="tbl-header">
                <table cellpadding="0" cellspacing="0" border="0">
                    <thead>
                        <tr>
                            <th>NO.</th>
                            <th>QUESTION</th>
                        </tr>
                    </thead>
                </table>
            </div>
            <div class="tbl-content">
            <%
                try{
                        ResultSet rs;
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/BVTechHub","root","aadivyoma");
                        Statement stmt=conn.createStatement();
                        String query2="SELECT DISCUSSION_FORUM.quesid, DISCUSSION_FORUM.semailid, DISCUSSION_FORUM.ques FROM DISCUSSION_FORUM";
                        rs=stmt.executeQuery(query2);
                        String s,s1;
                        out.print("<table border=0 cellspacing=0 cellpadding=0>");
                        while(rs.next())
                        { 
                            out.print("<tr><td>"+rs.getInt(1)+"</td>");
                            s=rs.getString(2);
                            s1=rs.getString(3);
                            out.print("<td><a class='link1' href='viewAnswer.jsp?id="+rs.getInt(1)+" '>"+rs.getString(3)+"</a></td>");
                            out.print("</tr>");
                        } 
                        out.print("</table>");
                }
                catch(Exception ex){ex.printStackTrace();
                } %>
            </div>
        </section>
        <div class="b">
        <button type="submit" class="btn1" name="Add" onclick="window.open('../jsp/addQuestion.jsp');">ADD QUESTION</button>
        </div> 
    <!-- HTML Code For Footer 
        <footer class="ct-footer" >     
            <div class="inner-right">
                <p>Copyright © 2022 BVTechHub.&nbsp; Privacy Policy Rights reserved to BVTechHub<br> Web Design by CS10 of Banasthali Vidyapith</p>
            </div>
        </footer>-->
    <br> <br>
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
    <script>
        $(window).on("load resize ", function() {
            var scrollWidth = $('.tbl-content').width() - $('.tbl-content table').width();
            $('.tbl-header').css({'padding-right':scrollWidth});
        }).resize();
    </script>
</html>

