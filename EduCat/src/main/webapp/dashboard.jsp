<%@ page import="java.sql.*" %>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <html>

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link href='https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;800&display=swap' rel='stylesheet'>
            <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
            <title>EduCat || Dashboard Page</title>
            <style>
                * {
                    margin: 0;
                    padding: 0;
                    box-sizing: border-box;
                    font-family: 'Nunito', sans-serif;
                    font-weight: 600;
                }

                body {
                    background-color: #f9ffff;
                }

                .container {
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    min-height: 100vh;
                    position: relative;
                }

                .box {
                    width: 1300px;
                    height: 600px;
                    background: #fff;
                    backdrop-filter: blur(20px);
                    border-radius: 20px;
                    padding: 30px;
                    box-shadow: 2px 2px 15px 2px rgba(0, 0, 0, 0.1),
                        -2px -0px 15px 2px rgba(0, 0, 0, 0.1);
                    z-index: 10;
                }
                .header {
                    margin-bottom: 30px;
                }

                .header p {
                    font-size: 25px;
                    font-weight: 800;
                    margin-top: 10px;
                    text-align: center;
                }

                table {
                    width: 100%;
                    border-collapse: collapse;
                    margin-bottom: 4%;
                }

                th,
                td {
                    border: 1px solid #dddddd;
                    text-align: left;
                    padding: 8px;
                }

                tr:nth-child(even) {
                    background-color: #f2f2f2;
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

                .input-submit {
                    margin-top: 20px;
                    padding: 12px 24px;
                    /* Adjust padding for better button size */
                    background-color: #1e263a;
                    border: none;
                    color: #ed4a4a;
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
            </style>
        </head>

        <body>
            <div class="container">
                <div class="box">
                    <div class="header">
                        <p> All Student Details</p>
                    </div>
                    <h2>Student Applicatoin Data</h2>


                    <table>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Date of Birth</th>
                            <th>Gender</th>
                            <th>Course</th>
                        </tr>
                        <% Connection conn=null; 
                        Statement stmt=null;
                         ResultSet rs=null;
                          try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/edu", "root" , "pass" );
                            stmt=conn.createStatement();
                             String sql="SELECT * FROM students" ;
                            rs=stmt.executeQuery(sql);
                             while (rs.next()) {
                            String id=rs.getString("id"); String
                            name=rs.getString("name"); 
                            String email=rs.getString("email"); 
                            String  dob=rs.getString("dob");
                             String gender=rs.getString("gender");
                              String course=rs.getString("course"); %>
                            <tr>
                                <td>
                                    <%= id %>
                                </td>
                                <td>
                                    <%= name %>
                                </td>
                                <td>
                                    <%= email %>
                                </td>
                                <td>
                                    <%= dob %>
                                </td>
                                <td>
                                    <%= gender %>
                                </td>
                                <td>
                                    <%= course %>
                                </td>
                            </tr>

                            <% } } catch (Exception e) { out.println("<h2>Error: " + e.getMessage() + "</h2>");
                                } finally {
                                try {
                                if (rs != null) {
                                rs.close();
                                }
                                if (stmt != null) {
                                stmt.close();
                                }
                                if (conn != null) {
                                conn.close();
                                }
                                } catch (SQLException ex) {
                                out.println("<h2>Error closing resources: " + ex.getMessage() + "</h2>");
                                }
                                }
                                %>
                    </table>
                    <h2>Delete Student Application</h2>
                    <form action="" method="delete">
                        <div class="input-box">
                            <label for="email">Email</label>
                            <input type="email" class="input-field" id="email" name="email" placeholder="Enter email"
                                required />
                            <button type="submit" class="input-submit">Submit</button>
                        </div>
                    </form>
                    <form id="studentForm">
                        <div class="form-group">
                            <label for="rollNo">Roll No:</label>
                            <input type="text" id="rollNo" name="rollNo" required>
                        
                            <label for="marks">Marks:</label>
                            <input type="text" id="marks" name="marks" required>
                        
                            <label for="cpga">CGPA:</label>
                            <input type="text" id="cpga" name="cpga" required>
                            <button type="submit" class="input-submit">Submit</button>
                        </div>
                        
                    </form>
                </div>
            </div>
        </body>

        </html>