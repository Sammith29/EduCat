<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<title>Login Student Page</title>
</head>
<body>
  <form>
            <h1>Student Application Form</h1>
               <div>
                    <label for="rollnumber">Name</label>
                    <input type="text" class="form-control" id="rollnumber" placeholder="Enter Rollnumber" required />
                </div>
                 <button type="submit" class="btn btn-primary">Submit</button>
  </form>
     <% 
             String studentrollnumber = request.getParameter("rollnumber");
                    		 if(studentrollnumber != null )
                             {
                             	try{
                             		Class.forName("com.mysql.cj.jdbc.Driver");
                             		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/edu","root","admin");     	
                             		PreparedStatement ps = con.prepareStatement("Select * from Marks where id = ?");
                             		  ps.setString(1,studentrollnumber);
                             	      ResultSet r = ps.executeQuery();
                           	        %>
                           	        <h5>Roll number:</h5><%r.getString("rollnumber"); %>
                           	        <h5>MARKS:</h5><h5><%r.getString("marks"); %></h5><br>
                           	        <h5>CGPA:</h5><h5><%r.getDouble("CGPA"); %></h5>
                           	 	   <%
                           	 	   } 
                             	  catch(Exception e)
                      		          {
                             		  e.printStackTrace();
                      		           }
                             }
                           else {
                        	   out.println("Enter the Roll number");
                              }
            %>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</html>