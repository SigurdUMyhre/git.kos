<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="country" dataSource="jdbc/lut2">
    SELECT full_name FROM country
</sql:query>

<% 
String name=(String) session.getAttribute("name"); 
%> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="lutstyle.css">
        <title>Adminpage LUT 2.0 - Help Students Conquer the World</title>
    </head>
    <body>
    <script language="javascript">
    	
    function ValidateAddSchools(){
    		var fullname = document.addschools.full_name.value.trim();
    		var shortname = document.addschools.short_name.value.trim();
    		var location = document.addschools.place.value.trim();
    		var zip = document.addschools.zip.value.trim();
    		if (fullname.length < 2 || shortname.length < 2 || location.length < 1 || zip.length < 1){
    			alert("You must enter valied values in each field");
    			return false;
    		}
    		else if (ValidateString(fullname) == false || ValidateString(shortname) == false || ValidateString(location) == false || ValidateString(zip) == false){
    			return false;
    		}
    		else {
    			return true;
    		}
    	}
    	
    	function ValidateAddCountry(){
    		var fullname2 = document.addcountry.full_name.value.trim();
    		var shortname2 = document.addcountry.short_name.value.trim();
    		if (fullname2.length < 2 || shortname2.length < 2){
    			alert("You must enter valid values in every field");
    			return false;
    		}
    		else if (ValidateString(fullname2) == false || ValidateString(shortname2) == false ){
    			return false;
    		}
    		else {
    			return true;
    		}
    	}
    	
    	function ValidateString(string){
    		//var validate = abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789;
    		if (! /^[a-zA-Z0-9@." "]+$/.test(string)) {
    			alert ("You have entered illegal characters");
				return false;
			}
    		else {
    			return true;
    		}
    	}
    </script>
    
  	<p align=right> Logged in as <%=name %> </p>
   	<p align=right> <a href='logout.jsp'><font size="3">Log out</font></a></p>
   	<p align=right> <a href='changepwd.jsp'><font size="3">Change password</font></a></p>
   
      <h2>Admin page</h2>
        <h1>Hi!</h1>
      
        <table border="0">
            <thead>
                <tr>
                    <th>LUT 2.0 provides information about approved international schools</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>To view information about schools in a country, please select a country below:</td>
                </tr>
                <tr>
                    <td><form action="schools.jsp" >
                            <strong>Select a country:</strong>
                            <select name="country">
                                <c:forEach var="row" items="${country.rowsByIndex}">
                                    <c:forEach var="column" items="${row}">
                                        <option value="<c:out value="${column}"/>"><c:out value="${column}"/></option>
                                    </c:forEach>
                                </c:forEach>
                            </select>
                            <input type="submit" value="Submit" />
                        </form></td>
            </tbody>
        	</table>
        	<br>
            <table border="0">            
            <thead>
                <tr>
                    <th>LUT 2.0 allows you to add new schools to review</th>
                </tr>
            </thead>
            <tbody>
                     <tr>
                      <td> To insert a new school, please insert the info here</td>
                     </tr>
                     <tr>
                    <td><form action="add_school.jsp" method="post" name="addschools" onsubmit="return ValidateAddSchools()">
                            <strong>Select a country:</strong>
                            <select name="country">
                                <c:forEach var="row" items="${country.rowsByIndex}">
                                    <c:forEach var="column" items="${row}">
                                        <option value="<c:out value="${column}"/>"><c:out value="${column}"/></option>
                                    </c:forEach>
                                </c:forEach>
                            </select>
						<p>
							<strong>Full name of the school:</strong> <input type="text" name="full_name" size="50">
						</p>
						<p>
							<strong>Short name of the school:</strong> <input type="text" name="short_name" size="20">
						</p>
						<p>
							<strong>Location of the school:</strong> <input type="text" name="place" size="20">
						</p>
						<p>
							<strong>Zip code of the school's location:</strong> <input type="int" name="zip" size="20">
						</p>
						<p>
							<input type="submit" value="Submit"><input type="reset" value="Reset">
						</p>
                        </form></td>
                        
                </tr>
            </tbody>
        </table>
<br>
            <table border="0">            
            <thead>
                <tr>
                    <th>LUT 2.0 allows you to register new countries</th>
                </tr>
            </thead>
            <tbody>
                     <tr>
                      <td> To register a new country, please insert the info here</td>
                     </tr>
                     <tr>
                    <td><form action="add_country.jsp" method="post" name="addcountry" onsubmit="return ValidateAddCountry()">
						<p>
							<strong>Full name of the country:</strong> <input type="text" name="full_name" size="50">
						</p>
						<p>
							<strong>Short name of the country:</strong> <input type="text" name="short_name" size="20">
						</p>
						<p>
							<input type="submit" value="Submit"><input type="reset" value="Reset">
						</p>
                        </form></td>
                        
                </tr>
            </tbody>
        </table>

<br>
            <table border="0">            
            <thead>
                <tr>
                    <th>LUT 2.0 allows you to manage the registered users</th>
                </tr>
            </thead>
            <tbody>
                     <tr>
                      <td><a href='manage_users.jsp'><font size="3">Manage users</font></a>
                      </td>
                        
                </tr>
            </tbody>
        </table>


    </body>
</html>
