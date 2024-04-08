<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
         
<title>Admin || login</title>
</head>
<body>
   <form>
            <h1>Admin Login</h1>
               <div>
                    <label for="name">Name</label>
                    <input type="text" class="form-control" id="passkey" name="passkey" placeholder="Enter Passkey" required />
                </div> 
                  <button type="submit" class="btn btn-primary">Submit</button>
            </form>
         <%
         String passkey = request.getParameter("passkey");
    try{
                 	Class.forName("com.mysql.cj.jdbc.Driver");
         	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/edu","root","admin");     	
        	PreparedStatement ps = con.prepareStatement("Select * from admin where passkey=?");
        	  ps.setString(1,passkey);
        	  if(i>0){
        		  response.sendRedirect("main.jsp");
		       }
        	  else 
		       {
		        out.println("Not able to login");
		       }
        	  
         } 
	  catch(Exception e)
          {
		  e.printStackTrace();
           }
          %>
</body> 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</html>