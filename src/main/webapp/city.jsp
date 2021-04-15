<%@page import="java.sql.ResultSet"%> 
<%@page import="java.sql.PreparedStatement"%> 
<%@page import="java.sql.DriverManager"%> 
<%@page import="java.sql.Connection"%> 
<%
    if (request.getParameter("state_id") != null)
    {
        int state_id = Integer.parseInt(request.getParameter("state_id"));

    String dburl = "jdbc:mysql://localhost:3306/onchange_select_option_db";
    String dbusername = "root";
    String dbpassword = "";
    try {
        Class.forName("com.mysql.jdbc.Driver");
//load driver 
        Connection con = DriverManager.getConnection(dburl, dbusername, dbpassword);

        PreparedStatement pstmt = null;

        pstmt = con.prepareStatement("SELECT FROM city WHERE state_id= ? ");
                pstmt.setInt(1, state_id);
                ResultSet rs=pstmt.executeQuery(); 

%> 
<option selected="selected">--Select city--</option> 
<%    while (rs.next()) {
%> 

<option value="<%=rs.getInt("city_id")%>" >
    <%=rs.getString("city_name")%> </option> <% }
            con.close(); //close connection 
        } catch (Exception e) {
            out.println(e);
        }
}
    %>