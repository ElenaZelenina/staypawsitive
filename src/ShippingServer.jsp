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
    Connection conn = null;
    PreparedStatement preparedStmt = null;
    PreparedStatement preparedStmt2 = null;
    PreparedStatement preparedStmt3 = null;
    ResultSet rs = null;
    ResultSet rs2 = null;
    
    try {
        response.setContentType("text/html;charset=UTF-8");
        // SQLControl control = new SQLControl();

        String productId = request.getParameter("productId");
        System.out.println("########### productId ====" + productId);

        String productName = request.getParameter("productName");
        System.out.println("########### productName ====" + productName);

        String quantity = request.getParameter("quantity");
        System.out.println("########### quantity ====" + quantity);

       
        String deliveryOption = request.getParameter("delivery");
        System.out.println("########### Radio button is ====" + deliveryOption);

        String pickupCheckbox = request.getParameter("pickup");
        System.out.println("########### Checkbox is selected" + pickupCheckbox);

        String customerFirstName = request.getParameter("customerFirstName");
        System.out.println("########### customerFirstName====" + customerFirstName);

        String customerLastName = request.getParameter("customerLastName");
        System.out.println("########### customerLastName====" + customerLastName);

        String customerAddress = request.getParameter("customerAddress");
        System.out.println("########### customerAddress====" + customerAddress);

        String customerAddress2 = request.getParameter("customerAddress2");
        System.out.println("########### customerAddress====" + customerAddress2);

        String customerApartment = request.getParameter("customerApartment");
        System.out.println("########### customerAddress====" + customerApartment);

        String customerCity = request.getParameter("customerCity");
        System.out.println("########### customerCity====" + customerCity);

        String state = request.getParameter("state");
        System.out.println("########### state====" + state);

        String customerCountry = "United States";
        System.out.println("########### customerCountry====" + customerCountry);

        String paymentType = request.getParameter("paymentType");
        System.out.println("########### paymentType====" + paymentType);

        String cardname = request.getParameter("cardname");
        System.out.println("########### cardname====" + cardname);

        String cardnumber = request.getParameter("cardnumber");
        System.out.println("########### cardnumber====" + cardnumber);

        String expdate = request.getParameter("expdate");
        System.out.println("########### expdate====" + expdate);

        String cvv = request.getParameter("cvv");
        System.out.println("########### cvv====" + cvv);

        String orderTotal = request.getParameter("orderTotal");
        System.out.println("########### orderTotal====" + orderTotal);

        String orderAmount = request.getParameter("orderAmount");
        System.out.println("########### orderAmount====" + orderAmount);

        String orderTax = request.getParameter("orderTax");
        System.out.println("########### orderTax====" + orderTax);

        String orderShipping = request.getParameter("orderShipping");
        System.out.println("########### orderShipping====" + orderShipping);
        
       /*  String donationAmount = request.getParameter("donationAmount");
        System.out.println("########### donationAmount ===="+ donationAmount );
        
         String donorname = request.getParameter("donorname");
        System.out.println("########### donorname ===="+ donorname );
        
       //  String donationAmount = request.getParameter("donationAmount");
       // System.out.println("########### donationAmount ===="+ donationAmount );*/

        String dbURL = "jdbc:derby://localhost:1527/Shopping;create=true";
        String user = "app";
        String password = "password";
        conn = DriverManager.getConnection(dbURL, user, password);
        if (conn != null) {
            System.out.println("Connected to database");
        }
        System.out.println("#########database############" + conn);

        String sql = "insert into CUSTOMER (CUSTOMERFIRSTNAME,CUSTOMERLASTNAME,CUSTOMERADDRESS,CUSTOMERCITY,CUSTOMERSTATE, CUSTOMERCOUNTRY,CUSTOMERCREDITDEBIT,CUSTOMERCARDNAME, CUSTOMERPAYMENTCARDNUMBER,CUSTOMERPAYMENTCARDEXPIRATIONDATE, CUSTOMERPAYMENTCARDCVV  ) "
                + "values (?,?,?,?,?,?,?,?,?,?,?)";

        preparedStmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

        preparedStmt.setString(1, customerFirstName);
        preparedStmt.setString(2, customerLastName);
        preparedStmt.setString(3, customerApartment + customerAddress + customerAddress2);
        preparedStmt.setString(4, customerCity);
        preparedStmt.setString(5, state);
        preparedStmt.setString(6, customerCountry);
        preparedStmt.setString(7, paymentType);
        preparedStmt.setString(8, cardname);
        if (cardnumber == null || cardnumber.equals("")) {
            cardnumber = "0";
        }
        preparedStmt.setInt(9, Integer.valueOf(cardnumber));
        preparedStmt.setString(10, expdate);
        if (cvv == null || cvv.equals("")) {
            cvv = "0";
        }
        preparedStmt.setInt(11, Integer.valueOf(cvv));

        int customerId = preparedStmt.executeUpdate();

        rs = preparedStmt.getGeneratedKeys();

        int cId = 0;
        if (rs != null && rs.next()) {
            cId = rs.getInt(1);
            System.out.println("Generated Customer Id: " + cId);
        }
 

        String sql2 = "insert into ORDERS (CUSTOMERID,ORDERTOTAL) "
                + "values (?,?)";

        preparedStmt2 = conn.prepareStatement(sql2, Statement.RETURN_GENERATED_KEYS);

        preparedStmt2.setInt(1, cId);
        /*if(orderTotal != null && orderTotal.equals("")){
                    orderTotal = "0";
                }*/
        preparedStmt2.setDouble(2, Double.valueOf(orderTotal));

        preparedStmt2.executeUpdate();
        rs2 = preparedStmt2.getGeneratedKeys();
        int orderId = 0;
        if (rs2 == null || rs2.next()) {
            orderId = rs2.getInt(1);
            System.out.println("Generated Order Id: " + orderId);
        }
        // If there is no error.
        
      String sql3 = "insert into CROSSREFERENCE (ORDERID,PRODUCTID, PRODUCTQUANTITY,PRODUCTSUBTOTAL ) "
                + "values (?,?,?,?)";

        preparedStmt3 = conn.prepareStatement(sql3);
        System.out.println("########### orderId====" + orderId);
        preparedStmt3.setInt(1, orderId);
        if (productId == null || productId.equals("")) {
            productId = "0";
        }
         
         
        preparedStmt3.setInt(2, Integer.valueOf(productId));
        System.out.println("########### productId====" + productId);
        
        if (quantity == null || quantity.equals("")) {
            quantity = "0";
        }
        
         System.out.println("########### quantity====" + quantity);
        preparedStmt3.setInt(3, Integer.valueOf(quantity));
        if (orderAmount == null || orderAmount.equals("")) {
            orderAmount = "0";
        }
         System.out.println("########### orderAmount====" + orderAmount);
        preparedStmt3.setDouble(4, Double.valueOf(orderAmount));

        preparedStmt3.executeUpdate(); 
        // If there is no error.
        conn.commit();
        
         
    response.sendRedirect("thankyouorder.html");  

    } catch (Exception e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
    } finally {
        try {
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if (rs != null) {
                rs.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if (rs2 != null) {
                rs2.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        try {
            if (preparedStmt != null) {
                preparedStmt.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if (preparedStmt2 != null) {
                preparedStmt2.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if (preparedStmt3 != null) {
                preparedStmt3.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

%>
