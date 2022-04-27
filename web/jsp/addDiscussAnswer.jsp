<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="../css/addDiscussAnswer.css" />
    <link
      href="https://fonts.googleapis.com/css2?family=Mochiy+Pop+One&display=swap"
      rel="stylesheet"
    />
    <title>Add Answer</title>
  </head>
  <body>
    <header class="class">
      <!-- Left Box for logo -->
      <div class="left">
        <div class="left"><img src="../images/logobg.png" alt="" /></div>
      </div>
    </header>

    <!--HTML code for the form through which answer to a question can be added-->
    <form method="post">
      <div class="form-box">
        <div class="header-text">Your Answer</div>
        <textarea
          type="text"
          name="answer"
          rows="10"
          cols="50"
          placeholder="Type your answer"
        ></textarea>
        <button type="submit" name="add">Add answer</button>
      </div>
    </form>

    <!-- HTML Code for the Footer -->
    <footer class="ct-footer">
      <div class="inner-right">
        <p>
          Copyright ©️ 2022 BVTechHub.&nbsp; Privacy Policy Rights reserved to
          BVTechHub<br />
          Web Design by CS10 of Banasthali Vidyapith
        </p>
      </div>
    </footer>
  </body>
</html>

<!--Java code to retrieve the question id and store the answer corresponding to that question id and the email ID of the student adding the answer to the database-->
<%
    if (request.getParameter("add") != null) {
        String ans, semailid;
        int quesid;
        ans = request.getParameter("answer"); // we get the answer entered by the student in the add answer form
        semailid = (String) request.getSession().getAttribute("mailid"); // we get the email id of the student set through session
        quesid = Integer.parseInt(request.getParameter("quesid")); // we get the question id which is set on the Add Answer button

        try {
//            Now, since a student cannot add more than one answer to a question so this constraint is checked here
            String queryToCheckDuplicates = "select * from stud_discussion where semailid='" + semailid + "' and quesid=" + quesid + "";
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/BVTechHub","root","aadivyoma");
            Statement st_check = conn.createStatement();
            ResultSet rs_dup = st_check.executeQuery(queryToCheckDuplicates); // we try to retrieve the result set corresponding to the student id and quesid from the stud_disscussion table where all the answers to the questions are stored
            boolean status = rs_dup.next(); // if the status is true then student has already answered else has not answered

            if (status) {
                out.println("<script>alert('You have already answered this question.');</script>");
            } else {
//                As the status is false this means answer corresponding to that question is not added by the student thus we insert the answer
                String queryText = "insert into stud_discussion(semailid,quesid,answer) values('" + semailid + "'," + quesid + ",'" + ans + "')";
                Statement st_insert = conn.createStatement();
                int i = st_insert.executeUpdate(queryText);
                if (i > 0) {
//                    A proper popup message is displayed when the answer is added
                    out.println("<script>alert('Your answer has been added successfully.');</script>");
                } else {
//                    Message when there is some error in adding the answer
                    out.println("<script>alert('Error in adding your answer please try again.');</script>");
                }
            }
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
%>
