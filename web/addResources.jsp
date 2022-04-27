<%@page import= "java.sql.*"%>
<%@page import= "java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Resource Upload form</title>
        <style>
            * 
            {
                /*It allows us to include the padding and border 
                 in an element's total width and height.*/
                box-sizing: border-box;
                margin: 0;
                padding: 0;
            }

            body 
            {
                font-family: poppins;
                font-size: 16px;
                color: #fff;
            }

            /*CSS for the add resource form box*/
            .form-box 
            {
                background-color: rgba(0, 0, 0, 0.5);
                margin: auto auto;
                padding: 40px;
                border-radius: 5px;
                box-shadow: 0 0 10px #000;
                position: absolute;
                top: 0;
                bottom: 0;
                left: 0;
                right: 0;
                width: 500px;
                height: 500px;
            } 
            /*CSS for the background of the webpage*/
            .form-box:before 
            {
                background: rgb(154,113,166);
                background: linear-gradient(90deg, rgba(154,113,166,1) 0%, rgba(198,161,209,1) 46%, rgba(140,201,214,1) 100%);
                width: 100%;
                height: 100%;
                background-size: cover;
                content: "";
                position: fixed;
                left: 0;
                right: 0;
                top: 0;
                bottom: 0;
                z-index: -1;
                display: block;
                filter: blur(2px);
            } 

            /*CSS for the header: Share your experience*/
            .form-box .header-text 
            {
                font-size: 32px;
                font-weight: 600;
                padding-bottom: 30px;
                text-align: center;
            } 

            /*CSS for the input fields of the form*/
            .form-box input 
            {
                margin: 10px 0px;
                border: none;
                padding: 10px;
                border-radius: 5px;
                width: 100%;
                font-size: 18px;
                font-family: poppins;
            } 

            .form-box label 
            {
                margin: 10px 0px;
                border: none;
                padding: 10px;
                border-radius: 5px;
                width: 100%;
                font-size: 24px;
                font-family: poppins;
            } 


            #btn1
            {
                background-color: whitesmoke;
                color: black;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                width: 100%;
                font-size: 20px;
                padding: 10px;
                margin: 20px 0px;
            }
            /*CSS for Add resource button*/
            #btn {
                background-color:skyblue;
                color: black;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                width: 100%;
                font-size: 18px;
                padding: 10px;
                margin: 20px 0px;
                font-weight: bold;
            }
            /*CSS for the drop-down list in category and verdict*/
            .form-box select 
            {
                margin: 10px 0px;
                border: none;
                padding: 10px;
                border-radius: 5px;
                width: 100%;
                font-size: 20px;
                font-family: poppins;
            } 

            /*CSS for textarea in description*/
            .form-box textarea 
            {
                margin: 10px 0px;
                border: none;
                padding: 10px;
                border-radius: 5px;
                width: 100%;
                font-size: 18px;
                font-family: poppins;
                resize: none;
            } 
            /* CSS for logo */
            .left{
                display: inline-block;
                position: absolute;
                left: 10px;
                top: 20px;
            }
            #one{
                color: grey;
            }
            .left img 
            {
                width: 170px;
            }
            /*to target the footer*/
            .inner-right{
                margin-top: auto;
                text-align: center;
                font-weight: bold;
                color: white;
                background-color: black;
                position: absolute;
                width: 100%;
                left:0;
                bottom:0;
            }
            .inner-right a{
                text-decoration: none;

            }
            .inner-right p {
                font-family: 'Acme', san-serif;
                margin-left: 50px;
                margin-right: 50px;
                font-size: large;
                font-weight: bold;
            }        

        </style>

    </head>

    <body>
        <div class="left">
            <img src="images/logobg.png" alt="" />
        </div>
        <!--HTML form to add resources of student-->
        <form action="resourceUpload" method="POST" enctype="multipart/form-data">
            <div class="form-box">
                <div class="header-text">Add your Resource</div>
                <!--<input type="text" name="txt_sub" value="" placeholder="Enter the subject"><br><br> --> 	
                <select name="txt_sub">
                    <option id="one" value="" disabled selected>Choose the subject</option>
                    <option value="DSA">
                        DSA
                    </option>
                    <option value="CN">
                        CN
                    </option>
                    <option value="OOP">
                        OOP
                    </option>
                    <option value="DBMS">
                        DBMS
                    </option>
                    <option value="OS">
                        OS
                    </option>
                </select>
                <br><br>
                <input type="text" name="txt_eid" value="" placeholder="Enter the topic"><br><br>  	
                <label>Upload Your Resource:</label><br>
                <input type="file" id="btn1" name="img"  size='50'><br><br>
                <input type="submit" id="btn" name="btn_add" value="ADD" >
            </div>
        </form>
        <!-- HTML Code For Footer -->
        <footer class="ct-footer" >     
            <div class="inner-right">
                <p>Copyright © 2022 BVTechHub.&nbsp; Privacy Policy Rights reserved to BVTechHub<br> Web Design by CS10 of Banasthali Vidyapith</p>
            </div>
        </footer>
    </body>
</html>