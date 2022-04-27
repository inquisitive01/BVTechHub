
<%@page import="java.sql.*" %> 
<%@page contentType="text/html"
        pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <link rel="stylesheet" href="../css/addQuestion.css">
        <title>BVTechHub | Ask Question Form</title>
    </head>

    <body>
        <header>
           <!--logo of BVTechHub--> 
           <div>
                <div class="left"><img src="../images/logobg.png" alt=""></div> 
            </div> 
        </header>  
        <!--HTML form to ask question -->
        <form>
            <div class="form-box">
                <!--Heading of the form-->
                <div class="header-text">Ask your Question!</div>
                <!--Text section where question will be typed-->
                <textarea id="share" name="Question" placeholder="Type your question here!!" maxlength="500"
                style="height:200px" rows="4" cols="50"></textarea>
                <!--button to submit the question-->
                <button type="submit" class="btn" name="Add">Submit Question</button>
            </div>
        </form>
          <!-- div for responsive footer-->
       
            <footer class="ct-footer" >     
            <div class="inner-right">
                <p>Copyright © 2022 BVTechHub.&nbsp; Privacy Policy Rights reserved to BVTechHub<br> Web Design by CS10 of Banasthali Vidyapith</p>
            </div>
        </footer>
    </body>

</html>
<%
    if (request.getParameter("Add") != null) 
    {
        String ques;
        
        ques = request.getParameter("Question");//question typed by the student
        
        try 
        {      //setting up connection with the database
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/BVTechHub", "root", "aadivyoma"); 
                Statement stmt = conn.createStatement();
                String semailid = (String) session.getAttribute("mailid"); //getting emailid through session attribute
               
                ResultSet rs= stmt.executeQuery("select * from discussion_forum");
               
                
                String query1 = "insert into discussion_forum(SEMAILID,QUES) VALUES('" + semailid + "','" + ques +"')";//inserting values in the discussion_forum table
               
                
                int i;
                Statement stmt2 = conn.createStatement();
                i = stmt2.executeUpdate(query1);
                
                if (i > 0) 
                {
                    out.println("<script>alert('Your question has been added.');</script>"); //pop-up to show success
                }
                else
                {
                    out.println("<script>alert('Error in adding your questions. Try again!');</script>");//pop-up to show error
                }
            conn.close();//connection closed
        
        }
        catch (Exception e) 
        {
            System.out.print(e);
            e.printStackTrace();
        }
    }
%>
