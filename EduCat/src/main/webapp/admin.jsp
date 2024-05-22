<%@ page import="java.io.*,java.util.*,javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Login</title>
</head>
<style>
    *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Nunito', sans-serif;
            font-weight: 600;
        }
        body{
            background-color: #f9ffff;
        }
        .container{
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            position: relative;
        }
        .box{
            width: 350px; /* Adjusted width */
            height: 400px; /* Adjusted height */
            background: #fff;
            backdrop-filter: blur(20px);
            border-radius: 20px;
            padding: 30px;
            box-shadow: 2px 2px 15px 2px rgba(0,0,0,0.1),
                        -2px -0px 15px 2px rgba(0,0,0,0.1);
            z-index: 10;
        }
        .input-box{
            display: flex;
            flex-direction: column;
            margin: 10px 0;
            position: relative;
        }
        label{
            font-weight: 600;
            margin-bottom: 5px;
            color: #333;
        }
        input, button{
            height: 40px;
            border: 2px solid rgb(153,157,158);
            border-radius: 7px;
            margin: 7px 0;
            outline: none;
            padding: 0 10px;
            font-size: 17px;
            transition: all .3s ease-in-out;
        }
        input:focus, button:focus{
            border: 2px solid rgb(89,53,180);
        }
        button{
            background: #1e263a;
            border: none;
            color: #fff;
            cursor: pointer;
            transition: all .3s ease-in-out;
        }
        button:hover{
            background: #122b71;
        }
        .wrapper{
            position: absolute;
            width: 355px; 
            height: 400px; 
            border-radius: 20px;
            background: rgba(255,255,255,0.53);
            box-shadow: 2px 2px 15px 2px rgba(0,0,0,0.115),
                        -2px -0px 15px 2px rgba(0,0,0,0.054);
            transform: rotate(5deg);
            z-index: 0;
        }
        .header{
            margin-bottom: 30px;
        }
        .header p{
            font-size: 25px;
            font-weight: 800;
            margin-top: 10px;
        }
        .bottom{
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            margin-top: 20px;
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
                <p>Admin Login</p>
            </div>
            <form action="" method="get">
                <div class="input-box">
                    <label for="passkey">Admin Passkey</label>
                    <input type="password" class="input-field" id="passkey" name="passkey" required>
                </div>
                <div class="input-box">
                    <button type="submit" class="input-submit">Login</button>
                </div>
            </form>
        </div>
        <div class="wrapper"></div>
    </div>

    <%
    if ("GET".equalsIgnoreCase(request.getMethod())) {
        String passkey = request.getParameter("passkey");
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/edu", "root", "pass");
            String sql = "SELECT * FROM admin where passkey=? ";
            ps = conn.prepareStatement(sql);
            ps.setString(1, passkey);
            rs = ps.executeQuery();

            // Check if admin exists
            if (rs.next()) {
                response.sendRedirect("dashboard.jsp");
            } else {
                // Admin not found, display error message
                out.println("<h2>Error: Admin not found</h2>");
            }

        } catch (Exception e) {
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
</body>
</html>
