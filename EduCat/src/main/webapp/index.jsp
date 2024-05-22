<%@ page import="java.io.*,java.util.*,javax.servlet.*" %>
    <%@ page import="javax.servlet.http.*" %>
        <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <!DOCTYPE html>
        <html lang="en">
        
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Student Management</title>
            <style>
                /* Reset default margin and padding */
                body,
                h1,
                h2,
                h3,
                ul,
                li {
                    margin: 0;
                    padding: 0;
                }
        
                /* Basic styling */
                body {
                    font-family: Arial, sans-serif;
                    background-color: #fff;
                    color: #333;
                }
        
                header {
                    background-color: #2979af;
                    padding: 10px 20px;
                    text-align: center;
                    display: flex;
                    align-items: center;
                }
        
                .logo img {
                    width: 120px;
                    height: auto;
                }
        
                .header-content {
                    flex: 1;
                    padding-left: 20px;
                    color: #fff;
                }
        
                nav {
                    background-color: #2979af;
                    padding: 10px;
                }
        
                nav ul {
                    list-style-type: none;
                    display: flex;
                    justify-content: center;
                    font-size: 16px;
                }
        
                nav ul li {
                    margin: 0 10px;
                }
        
                nav ul li a {
                    color: #fff;
                    text-decoration: none;
                    padding: 10px 15px;
                    transition: background-color 0.3s ease;
                }
        
                nav ul li a:hover,
                nav ul li a.active {
                    background-color: #1e5f8f;
                }
        
                main {
                    margin: 20px;
                    text-align: center;
                }
        
                .hero {
                    background-image: url('./swami.png');
                    background-size: cover;
                    background-position: center;
                    padding: 100px;
                    color: #fff;
                }
        
                .hello {
                    padding: 50px;
                    color: #333;
                }
        
                footer {
                    background-color: #333;
                    color: #fff;
                    text-align: center;
                    padding: 10px;
                }
                ::-webkit-scrollbar{
                    display:none;
                }
            </style>
        </head>
        
        <body>
            <header>
                <div class="logo">
                    <img src="./logo1.png" alt="Logo">
                </div>
                <div class="header-content">
                    <h1><b>INDIRA SHIVA RAO POLYTECHNIC, UDUPI</b></h1>
                </div>
            </header>
        
            <nav>
                <ul>
                    <li><a href="#">Home</a></li>
                    <li><a href="<%= response.encodeRedirectURL("register.jsp") %>">Students Application Form</a></li>
                    <li><a href="<%= response.encodeRedirectURL("login.jsp") %>">Marks</a></li>
                    <li><a href="<%= response.encodeRedirectURL("admin.jsp") %>">Admin</a></li>
                </ul>
            </nav>
        
            <main>
                <section class="hero">
                    <!-- Content for hero section -->
                </section>
        
                <section class="hello">
                    <h2>Welcome to Indira Shiva Rao Polytechnic</h2>
                    <p>Indira Shiva Rao Polytechnic is an institution run by Sri Krishna Shikshana Prathisthana Trust, Sri Krishnapura Mutt, Car Street, Udupi, under the able guidance of Sri Sri Vidyasagara Theertha Swamiji, who is the President of the Trust. The polytechnic started functioning in the year 1997 as the first and only Private Women's Polytechnic in the entire undivided Dakshina Kannada district. Due to popular demand from the parents for admission of boys, it was subsequently converted into a co-ed polytechnic in the year 1999.</p>
                </section>
        
                <section class="hello">
                    <h2>AVAILABLE BRANCHES</h2>
                    <a href="http://www.isrpolytechnic.com/ComputerScience.html">Computer Science & Engineering</a><br>
                    <a href="http://www.isrpolytechnic.com/Electroinics_engineering.html">Electronics & Communication Engineering</a><br>
                    <a href="http://www.isrpolytechnic.com/Mechanical_engg.html">Mechanical Engineering</a><br>
                    <a href="http://www.isrpolytechnic.com/Apparel_design&fabrication_technology.html">Apparel Design & Fabrication Technology</a>
                </section>
            </main>
        
            <footer>
                <p>© 2024 Student Management System</p>
            </footer>
        </body>
        
        </html>