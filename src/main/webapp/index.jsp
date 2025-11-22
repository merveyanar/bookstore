<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<html>
<body>
<h2>Users List</h2>
<ul>
<%
    List<String> usersList = (List<String>) request.getAttribute("usersList");
    if(usersList != null){
        for(String user : usersList){
%>
            <li><%= user %></li>
<%
        }
    }
%>
</ul>
</body>
</html>
