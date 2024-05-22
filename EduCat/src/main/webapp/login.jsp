<%@ page import="java.io.*,java.util.*,javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Student Application Form</title>
    <link href="./all.css">
</head>
<style>
    *{
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'nunito', sans-serif;
        font-weight: 600;
    }
    body{
        background-color:#f9ffff;
    }
    .container{
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        position: relative;
    }
    .box{
        width: 450px;
        height: 500px;
        background: #fff;
        backdrop-filter: blur(20px);
        border-radius: 30px;
        padding: 40px;
        box-shadow: 2px 2px 15px 2px rgba(0,0,0,0.1),
                    -2px -0px 15px 2px rgba(0,0,0,0.1);
        z-index: 10;
    }
    .wrapper{
        position: absolute;
        width: 455px;
        height: 500px;
        border-radius: 30px;
        background: rgba(255,255,255,0.53);
        box-shadow: 2px 2px 15px 2px rgba(0,0,0,0.115),
                    -2px -0px 15px 2px rgba(0,0,0,0.054);
        transform: rotate(5deg);
    }
    .header{
        margin-bottom: 50px;
    }
    .header header{
        display: flex;
        justify-content: right;
    }
    header img{
        width: 25px;
    }
    .header p{
        font-size: 25px;
        font-weight: 800;
        margin-top: 10px;
    }
    .input-box{
        display: flex;
        flex-direction: column;
        margin: 10px 0;
        position: relative;
    }
    i{
        font-size: 22px;
        position: absolute;
        top: 35px;
        right: 12px;
        color: #595b5e;
    }
    input{
        height: 40px;
        border: 2px solid rgb(153,157,158);
        border-radius: 7px;
        margin: 7px 0;
        outline: none;
    }
    .input-field{
        font-weight: 500;
        padding: 0 10px;
        font-size: 17px;
        color: #333;
        background: transparent;
        transition: all .3s ease-in-out;
    }
    .input-field:focus{
        border:2px solid rgb(89,53,180);
    }
    .input-field:focus ~ i{
        color: rgb(89,53,180);
    }
    .input-submit{
        margin-top: 20px;
        background: #1e263a;
        border: none;
        color: #fff;
        cursor: pointer;
        transition: all .3s ease-in-out;
    }
    .input-submit:hover{
        background: #122b71;
    }
    .bottom{
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        margin-top: 25px;
    }
    .bottom span a{
        color: #727374;
        text-decoration: none;
    }
    .bottom span a:hover{
        text-decoration: underline;
    }
</style>

<body>
   <div class="container">
          <div class="box">
              <div class="header">
                  <p>Student Login</p>
              </div>
              <form action="" method="get">
                  <div class="input-box">
                      <label for="rollnumber">ROLL NUMBER</label>
                      <input type="text" class="input-field" name="rollnumber" id="rollnumber" required>
                  </div>
                  <div class="input-box">
                      <button type="submit" class="input-submit">Signin</button>
                  </div>
              </form>
              <div class="bottom">
                  <span><a href="<%= response.encodeRedirectURL("register.jsp") %>" >Sign Up</a></span>
              </div>
          </div>
          <div class="wrapper"></div>
      </div>

    <% if ("GET".equalsIgnoreCase(request.getMethod())) {
        String rollnum = request.getParameter("rollnumber");
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/edu", "root", "pass");
            String sql = "SELECT * FROM marks WHERE rollnumber=?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, rollnum);
            rs = ps.executeQuery();

    %>
    <div class="container">
        <div class="box"> 
             <h2>Results for Roll Number <%= rollnum %> :</h2>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th scope="col">Subject</th>
                        <th scope="col">Marks</th>
                        <th scope="col">CGPA</th>
                    </tr>
                </thead>
                <tbody>
                <% while (rs.next()) {
                    String rollnumber = rs.getString("rollnumber");
                    int marks = rs.getInt("marks");
                    int cgpa = rs.getInt("CGPA");
                %>
                     <tr>
                        <td><%= rollnumber %></td>
                        <td><%= marks %></td>
                        <td><%= cgpa %></td>
                    </tr>
                <% } %>
                </tbody>
            </table>
        </div>
        <div class="wrapper"></div>
    </div>
        <% } catch (Exception e) {
            out.println("<h2>Error e: " + e.getMessage() + "</h2>");
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                out.println("<h2>Error SQL Exception: " + ex.getMessage() + "</h2>");
            }
        }
    }
    %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
