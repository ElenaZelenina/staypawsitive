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
    
    ResultSet rs = null;
    
    
    try {
        response.setContentType("text/html;charset=UTF-8");     

       
        
        String donationAmount = request.getParameter("donationAmount");
        System.out.println("########### donationAmount ===="+ donationAmount );
        
        String donationReoccurring = request.getParameter("periodicity");
        System.out.println("########### donationReoccurring ===="+ donationReoccurring );
        
         String donorname = request.getParameter("donorname");
        System.out.println("########### donorname ===="+ donorname );
        
        String paymentType = request.getParameter("paymentType");
        System.out.println("########### paymentType ===="+ paymentType );
        
         String cardname = request.getParameter("cardname");
        System.out.println("########### cardname ===="+ cardname );
        
         String cardnumber = request.getParameter("cardnumber");
        System.out.println("########### cardnumber ===="+ cardnumber );
        
         String expdate = request.getParameter("expdate");
        System.out.println("########### expdate ===="+ expdate );

         String cvv = request.getParameter("cvv");
        System.out.println("########### cvv ===="+ cvv );
        
         String email = request.getParameter("email");
        System.out.println("########### email ===="+ email );

        String dbURL = "jdbc:derby://localhost:1527/Shopping;create=true";
        String user = "app";
        String password = "password";
        conn = DriverManager.getConnection(dbURL, user, password);
        if (conn != null) {
            System.out.println("Connected to database");
        }
        System.out.println("#########database############" + conn);

        String sql = "insert into DONOR (DONORFULLNAME,DONOREMAIL,DONORCREDITDEBIT,DONORCARDNAME, DONORPAYMENTCARDNUMBER,DONORPAYMENTCARDEXPIRATIONDATE, DONORPAYMENTCARDCVV  ) "
                + "values (?,?,?,?,?,?,?)";

        preparedStmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

        preparedStmt.setString(1, donorname);
        preparedStmt.setString(2, email);
        preparedStmt.setString(3, paymentType);
        
        preparedStmt.setString(4, cardname);
        if (cardnumber == null || cardnumber.equals("")) {
            cardnumber = "0";
        }
        preparedStmt.setInt(5, Integer.valueOf(cardnumber));
        preparedStmt.setString(6, expdate);
        if (cvv == null || cvv.equals("")) {
            cvv = "0";
        }
        preparedStmt.setInt(7, Integer.valueOf(cvv));
        
       
        

        int donorId = preparedStmt.executeUpdate();

        rs = preparedStmt.getGeneratedKeys();

        int dId = 0;
        if (rs != null && rs.next()) {
            dId = rs.getInt(1);
            System.out.println("Generated Donor Id: " + dId);
        }
 
        String sql2 = "insert into DONATION (DONORID,DONATIONAMOUNT, DONATIONREOCCURRING ) "
                + "values (?,?,?)";

        preparedStmt2 = conn.prepareStatement(sql2);
        
        preparedStmt2.setInt(1, Integer.valueOf(dId));
        System.out.println("########### donorId====" + dId);
        
        
         
         
        preparedStmt2.setInt(2, Integer.valueOf(donationAmount));
        System.out.println("########### donationAmount====" + donationAmount);
        
        
        
        preparedStmt2.setString(3, donationReoccurring);
         System.out.println("########### donationReoccurring====" + donationReoccurring);
       
        preparedStmt2.executeUpdate(); 
        // If there is no error.
        conn.commit();
        
         
    response.sendRedirect("thankyoudonation.html");  

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
        
    }

%>
