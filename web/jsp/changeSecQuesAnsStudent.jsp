<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <link rel="stylesheet" href="../css/changeSecQuesAnsStudent.css">
        <link href="https://fonts.googleapis.com/css2?family=Mochiy+Pop+One&display=swap" rel="stylesheet">
        <title>Change Security QnA</title>
    </head>

    <body>
        <header class="class">
            <div class="left">
                <div class="left"><img src="../images/logobg.png" alt=""></div> 
            </div>
        </header>
        <form>
            <div class="form-box">
                <div class="header-text">Change security question and answer</div>


                <select name="newSecurityQuesID">
                    <option id="one" value="" disabled selected>Choose new security question</option>
                    <option value="What is the name of your college?">
                        What is the name of your college?
                    </option>
                    <option value="What was your first school?">
                        What was your first school?
                    </option>
                    <option value="What is the last name of your father?">
                        What is the last name of your father?
                    </option>
                    <option value="Which city do you live in?">
                        Which city do you live in?
                    </option>
                </select>
                <input type="text" name="newSecurityAns" placeholder="Enter new Security Answer" />
                <button type="submit" class="btn" name="save">Save</button>
            </div>
        </form>
        <footer class="ct-footer">
            <div class="inner-right">
                <p>Copyright © 2022 BVTechHub.&nbsp; Privacy Policy Rights reserved to BVTechHub<br> Web Design by CS10
                    of Banasthali Vidyapith</p>
            </div>
        </footer>
    </body>

</html>
<%
    if (request.getParameter("save") != null) {
        String newSecQues, newSecAns, emailId;
        newSecQues = request.getParameter("newSecurityQuesID");
        newSecAns = request.getParameter("newSecurityAns");
        emailId = (String) session.getAttribute("mailid");
        String query = "Select * from student";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/BVTechHub", "root", "aadivyoma");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            boolean status = rs.next();
            if (status) {
                String updateQuery = "Update student set ssecurityques='" + newSecQues + "',ssecurityans='" + newSecAns + "' where semailid='" + emailId + "'";
                Statement stmt_update = conn.createStatement();
                int i = stmt_update.executeUpdate(updateQuery);
                if (i > 0) {
                    out.println("<script>alert('Profile upated with new security question and answer.');</script>");
                } else {
                    out.println("<script>alert('Error in updating security question and answer.');</script>");
                }
                return;
            }
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
%>