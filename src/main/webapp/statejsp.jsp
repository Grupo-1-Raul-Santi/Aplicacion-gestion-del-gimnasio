<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%> 

<%
    if (request.getParameter("country_id") != null) {
        int country_id = Integer.parseInt(request.getParameter("country_id"));

        String dburl = "jdbc:mysql://localhost:3306/onchange_select_option_db";
        String dbusername = "root";
        String dbpassword = "";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(dburl, dbusername, dbpassword);

            PreparedStatement pstmt = null;

            pstmt = con.prepareStatement("SELECT FROM state WHERE country_id=? ");
            pstmt.setInt(1, country_id);
            ResultSet rs = pstmt.executeQuery();
%> 
<option selected="selected">--Select State--</option>
<%
    while (rs.next()) {
%> 
<option value="<%=rs.getInt("state_id")%>"> 
    <%=rs.getString("state_name")%>
</option>
<%
            }
            con.close(); //close connection 
        } catch (Exception e) {
            out.println(e);
        }
    }
%>