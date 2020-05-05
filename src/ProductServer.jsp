<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<!DOCTYPE html>
<%

     Connection aConnection = null;

    String driver = "org.apache.derby.jdbc.ClientDataSource";

    String dbURL = "jdbc:derby://localhost:1527/Shopping;create=true";
    String user = "app";
    String password = "password";

    try {
        String method = "";

        method = request.getMethod();
        
        if (method.equalsIgnoreCase("POST")) {
            //Below code get the user inputs
            String productId = request.getParameter("productId");
            System.out.println("########### Product ID $$$$$$$$$$$" + productId);
            String productName = request.getParameter("productName");
            System.out.println("########### Product Name $$$$$$$$$$$" + productName);
            String productQuantity = request.getParameter("quantity");
            System.out.println("########### Product Quantity $$$$$$$$$$$" + productQuantity);
            String productPrice = request.getParameter("price");
            System.out.println("########### Product Quantity $$$$$$$$$$$" + productPrice);           

            Class.forName(driver);
            //Setup the connection with the DB and insert data into PRODUCT table
            aConnection = DriverManager.getConnection(dbURL, user, password);
            aConnection.setAutoCommit(false);
            System.out.println("DB Connection successful");
            StringBuilder aBuilder = new StringBuilder();
            aBuilder.append("INSERT INTO PRODUCT(PRODUCTID,PRODUCTNAME, PRODUCTQUANTITY, PRODUCTPRICE)");
            aBuilder.append("VALUES (?, ?, ?, ?)");
            String aPreparedQuery = aBuilder.toString();
            PreparedStatement aStatement = aConnection.prepareStatement(aPreparedQuery);
            aStatement = aConnection.prepareStatement(aPreparedQuery);
            aStatement.setInt(1, Integer.valueOf(productId));
            aStatement.setString(2, productName);
            aStatement.setInt(3, Integer.valueOf(productQuantity));
            aStatement.setDouble(4, Double.valueOf(productPrice));

            aStatement.executeUpdate();
            aConnection.commit();

            //This command set the product attribute value. So we can get that value on UI. 
            session.setAttribute("productId", productId);
            session.setAttribute("productName", productName);
            session.setAttribute("quantity", productQuantity);
            session.setAttribute("price", productPrice);

            //This command redirect the page to order page.
            response.sendRedirect("order.jsp");
        }
    } catch (Exception e) {
        e.printStackTrace();
        try {
            aConnection.rollback();
        } catch (Exception re) {
            re.printStackTrace();
        }
    } finally {
        // try to close the connection...
        try {
            // close the connection...
            aConnection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

%>