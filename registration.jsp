<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
          <title>Student Application Form</title>
    </head>
    <body>
         <form>
            <h1>Student Application Form</h1>
               <div>
                    <label for="name">Name</label>
                    <input type="text" class="form-control" id="name" placeholder="Enter name" required />
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" placeholder="Enter email" required />
                </div>
                <div class="form-group">
                    <label for="dob">Date of Birth</label>
                    <input type="date" class="form-control" id="dob" required />
                </div>
                <div class="form-group">
                    <label for="gender">Gender</label>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="gender" id="male" value="male" required />
                        <label class="form-check-label" for="male">Male</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="gender" id="female" value="female"
                            required />
                        <label class="form-check-label" for="female">Female</label>
                    </div>
                     <div class="form-check">
                        <input class="form-check-input" type="radio" name="gender" id="Other" value="Other"
                            required />
                        <label class="form-check-label" for="Other">Other</label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="course">Selected Course Diploma in</label>
                    <select class="form-control" id="course" name="course" required>
                        <option value="ADFT">ADFT</option>
                        <option value="CSE">CSE</option>
                        <option value="ECE">ECE</option>
                        <option value="MEC">MEC</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
            <% 
             String studentname = request.getParameter("name");
             String studentemail = request.getParameter("email");
             String studentdob = request.getParameter("dob");
             String studentgender = request.getParameter("gender");
             String studentcourse = request.getParameter("course");
                    if(studentname != null && studentemail != null && studentdob != null &&
                    		studentgender != null && studentcourse!= null )
                    {
                   try{
                    	Class.forName("com.mysql.cj.jdbc.Driver");
                    	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/edu","root","admin");     	
                    	PreparedStatement ps = con.prepareStatement("INSERT INTO students (id,name,email,dob,gender,course) VALUES (?,?,?,?,?,?) ");
                    	ps.setString(1,studentemail);
                    	ps.setString(2,studentname);
                    	ps.setString(3,studentemail);
                    	ps.setString(4,studentdob);
                    	ps.setString(5,studentgender);
                    	ps.setString(6,studentcourse);
                   int i = ps.executeUpdate();
                    	 if(i>0){
                    			out.println("Registered");
                    		     }
                    	  else 
                    		    {
                    		    out.println("Not Registered");
                    		     }
                    		   } 
                    catch(Exception e)
                    		  {
                    		  e.printStackTrace();
                    		  }
                     }
                    		  else {
                    	
                    		  out.println("Please Enter All fields");
                    		  }
               %>
    </body>
    </html>
    </body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </html>