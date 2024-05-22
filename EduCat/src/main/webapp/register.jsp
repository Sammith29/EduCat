<%@ page import="java.io.*,java.util.*,javax.servlet.*" %>
    <%@ page import="javax.servlet.http.*" %>
        <%@ page contentType="text/html;charset=UTF-8" language="java" %>
            <%@ page import="java.sql.*" %>
                <%@ page contentType="text/html;charset=UTF-8" language="java" %>
                    <html>
                    <head>
                        <meta charset="UTF-8">
                        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
                            rel="stylesheet"
                            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                            crossorigin="anonymous">
                        <link href="./all.css">
                        <title>Student Application Form</title>
                    </head>
                    <style>
                        * {
                            margin: 0;
                            padding: 0;
                            box-sizing: border-box;
                            font-family: 'nunito', sans-serif;
                            font-weight: 600;
                        }
                
                        body {
                            background-color:#f9ffff;
                        }
                
                        .container {
                            display: flex;
                            justify-content: center;
                            align-items: center;
                            min-height: 100vh;
                            position: relative;
                        }
                
                        .box {
                            width: 450px;
                            height:599px;
                            margin:2%;
                            background: #fff;
                            backdrop-filter: blur(20px);
                            border-radius: 30px;
                            padding: 40px;
                            box-shadow: 2px 2px 15px 2px rgba(0, 0, 0, 0.1),
                                -2px -0px 15px 2px rgba(0, 0, 0, 0.1);
                            z-index: 10;
                        }
                
                        .wrapper {
                            position: absolute;
                            width: 455px; 
                            height: 608px;
                            border-radius: 30px;
                            background: rgba(255, 255, 255, 0.53);
                            box-shadow: 2px 2px 15px 2px rgba(0, 0, 0, 0.115),
                                -2px -0px 15px 2px rgba(0, 0, 0, 0.054);
                            transform: rotate(5deg);
                        }
                
                        .header {
                            margin-bottom: 15px;
                        }
                
                        .header p {
                            font-size: 25px;
                            font-weight: 800;
                            margin-top: 10px;
                        }
                
                        form label {
                            font-size: 16px;
                
                        }
                
                        .input-box {
                            display: flex;
                            flex-direction: column;
                            margin: 3px 0;
                            position: relative;
                        }
                
                        .input-row {
                            display: flex;
                            flex-direction: row;
                            align-items: center;
                            /* Align items vertically */
                            margin: 2px 0;
                            position: relative;
                        }
                
                        .input-row label {
                            margin-right: 10px;
                            /* Add some spacing between label and radio button */
                        }
                
                        .input-row .form-check {
                            display: flex;
                            align-items: center;
                            /* Align items vertically */
                        }
                
                        .input-box label {
                            margin-bottom: 5px;
                            font-weight: bold;
                        }
                
                        .input-box input {
                            padding: 8px;
                            border: 1px solid #ccc;
                            border-radius: 5px;
                            transition: border-color 0.3s ease;
                        }
                
                        .input-box input:focus {
                            border-color: rgb(89, 53, 180);
                        }
                
                        i {
                            font-size: 22px;
                            position: absolute;
                            top: 35px;
                            right: 12px;
                            color: #595b5e;
                        }
                
                        input {
                            height: 40px;
                            border: 2px solid rgb(153, 157, 158);
                            border-radius: 7px;
                            margin: 7px 0;
                            outline: none;
                        }
                
                        .input-field {
                            font-weight: 500;
                            padding: 0 10px;
                            font-size: 17px;
                            color: #333;
                            background: transparent;
                            transition: all .3s ease-in-out;
                        }
                
                        .input-field:focus {
                            border: 2px solid rgb(89, 53, 180);
                        }
                
                        .input-field:focus~i {
                            color: rgb(89, 53, 180);
                        }
                
                        .input-submit {
                            margin-top: 20px;
                            padding: 12px 24px;
                            /* Adjust padding for better button size */
                            background-color: #1e263a;
                            border: none;
                            color: #fff;
                            cursor: pointer;
                            transition: background-color 0.3s ease-in-out;
                            /* Smooth transition for hover effect */
                            border-radius: 6px;
                            /* Rounded corners */
                            font-size: 16px;
                            /* Adjust font size */
                            font-weight: bold;
                            /* Make text bold */
                        }
                
                        .input-submit:hover {
                            background-color: #122b71;
                            /* Darker background color on hover */
                        }
                
                
                        .bottom {
                            display: flex;
                            flex-direction: row;
                            justify-content: space-between;
                            margin-top: 25px;
                        }
                
                        .bottom span a {
                            color: #727374;
                            text-decoration: none;
                        }
                
                        .bottom span a:hover {
                            text-decoration: underline;
                        }
                
                        #course {
                            height: 40px;
                            border: 2px solid rgb(153, 157, 158);
                            border-radius: 7px;
                            padding: 0 10px;
                            font-size: 17px;
                            color: #333;
                            background-color: #fff;
                            transition: border-color 0.3s ease-in-out;
                            /* Smooth transition for hover/focus effect */
                        }
                
                        #course:hover,
                        #course:focus {
                            border-color: rgb(89, 53, 180);
                            /* Change border color on hover/focus */
                            outline: none;
                            /* Remove default outline */
                        }
                        .bottom{
                            display: flex;
                            flex-direction: row;
                            justify-content: space-between;
                            margin-top: 25px;
                        }
                        .bottom span a{
                                           text-decoration: underline;
                        }
                    </style>
                    <body>
                        <div class="container">
                            <div class="box">
                                <div class="header">
                                    <p>REGISTER FORM </p>
                                </div>
                            <form action="" method="post">
                            <div class="input-box">
                                <label for="name">Name</label>
                                <input type="text" class="input-field" id="name" name="name" placeholder="Enter name"
                                    required />
                            </div>
                            <div class="input-box">
                                <label for="email">Email</label>
                                <input type="email" class="input-field" id="email" name="email"
                                    placeholder="Enter email" required />
                            </div>
                            <div class="input-box">
                                <label for="dob">Date of Birth</label>
                                <input type="date" class="input-field" id="dob" name="dob" required />
                            </div>
                            <div class="input-row">
                                <label for="gender">Gender</label>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="gender" id="male" value="male"
                                        required />
                                    <label class="form-check-label" for="male">Male</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="gender" id="female"
                                        value="female" required />
                                    <label class="form-check-label" for="female">Female</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="gender" id="Other" value="Other"
                                        required />
                                    <label class="form-check-label" for="Other">Other</label>
                                </div>
                            </div>
                            <div class="input-row">
                                <label 
                                for="course">Selected Course Diploma in</label>
                                <select id="course" name="course" required>
                                    <option value="ADFT">ADFT</option>
                                    <option value="CSE">CSE</option>
                                    <option value="ECE">ECE</option>
                                    <option value="MEC">MEC</option>
                                </select>
                            </div>
                            <button type="submit" class="input-submit">Submit</button>
                            <div class="bottom">
                                <span>Account Exist Click to&nbsp;<a href="<%= response.encodeRedirectURL("login.jsp") %>">Login</a></span>
                            </div>
                        </form>
                    </div>
                    <div class="wrapper"></div>
                </div>
                        <%-- Java code to handle form submission --%>
                            <% 
                            if ("POST".equalsIgnoreCase(request.getMethod())) {
                             String
                                name=request.getParameter("name");
                                 String email=request.getParameter("email");
                                  String
                                dob=request.getParameter("dob");
                                String gender=request.getParameter("gender"); String
                                course=request.getParameter("course"); Connection conn=null; PreparedStatement
                                pstmt=null; try { Class.forName("com.mysql.cj.jdbc.Driver");
                                conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/edu", "root" , "pass" );
                                String
                                sql="INSERT INTO students (name, email, dob, gender, course) VALUES (?, ?, ?, ?, ?)" ;
                                pstmt=conn.prepareStatement(sql); pstmt.setString(1, name); pstmt.setString(2, email);
                                pstmt.setString(3, dob);
                                
                                pstmt.setString(4, gender); pstmt.setString(5, course); int
                                rowsAffected=pstmt.executeUpdate(); if (rowsAffected> 0) {
                                out.println("<h2>Data successfully inserted!</h2>");
                                response.sendRedirect("login.jsp");
                                } 
                                else {
                                out.println("<h2>Error: Failed to insert data.</h2>");
                                }
                                } catch (Exception e) {
                                out.println("<h2>Error: " + e.getMessage() + "</h2>");
                                } finally {
                                try {
                                if (pstmt != null) {
                                pstmt.close();
                                }
                                if (conn != null) {
                                conn.close();
                                }
                                } catch (SQLException ex) {
                                out.println("<h2>Error: " + ex.getMessage() + "</h2>");
                                }
                                }
                                }
                                %>
                                <script
                                    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                                    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                                    crossorigin="anonymous"></script>
                    </body>
                    </html>