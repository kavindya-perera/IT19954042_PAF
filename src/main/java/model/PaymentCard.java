package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class PaymentCard {

	private static final String USERNAME = "root";
	private static final String URL = "jdbc:mysql://127.0.0.1:3306/power_app";
	private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	private static final String PASSWORD = "";
	private static Connection connection = null;
	private static String query = "";
	private static PreparedStatement preparedStatement = null;
	private static Statement statement = null;
	private static ResultSet resultSet = null;


	private Connection connect() throws SQLException {
		if (connection != null && !connection.isClosed()) {
			return connection;
		}
		else {
			try {
				Class.forName(DRIVER);
				connection = DriverManager.getConnection(URL,USERNAME,PASSWORD);
				System.out.println("Successfully Connected");
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return connection;
		}
	}

	public String insertDetails(String card_number,int cvv,String exp_date,String crd_holder_name, String card_issued) {

		String output = "";

		try {
			connection = connect();
			if(connection == null) {
				output = "Error while connecting to the database for inserting";
				return null;
			}

			query = "INSERT INTO `card_data` (`userCard_ID`, `card_number`, `cvv`, `exp_date`, `crd_holder_name`,`card_issued`) VALUES (NULL,?, ?, ?, ?, ?)";
			//query = "insert into power_app.bill_generate (invoiceID,accNo,custName,units,amount) values (?,?,?,?,?)";
			preparedStatement = connection.prepareStatement(query);

			preparedStatement.setString(1, card_number);
			preparedStatement.setInt(2, cvv);
			preparedStatement.setString(3, exp_date);
			preparedStatement.setString(4, crd_holder_name);
			preparedStatement.setString(5, card_issued);

			preparedStatement.execute();
			connection.close();

			query = "";

			String newCustomer =readItems();
			System.out.println(newCustomer);
			output = "{\"status\":\"success\", \"data\": \"" + newCustomer + "\"}";
		}
		catch (Exception e)
		{
			output = "{\"status\":\"error\", \"data\": \"Error while inserting the Account.\"}";
			System.err.println(e.getMessage());
		}
		return output;
	}

	public String readItems()
	{
		String output = "";
		String table = "";
		try
		{
			Connection con = connect();
			if (con == null)
			{
				return "Error while connecting to the database for reading.";
			}
			// Prepare the html table to be displayed
//			output = "<table border='1'><tr><th>card_number</th>"
//					+"<th>cvv</th><th>exp_date</th>"
//					+ "<th>crd_holder_name</th>"
//					+ "<th>card_issued</th>"
//					+ "<th>Update</th><th>Remove</th></tr>";
			output = "<table class='table'> <thead class='thead-light'> <tr> <th scope='col'>card_number</th>"+
					"<th scope='col'>CVV</th>"+
					"<th scope='col'>exp_date</th>"+
					"<th scope='col'>crd_holder_name</th>"+
					"<th scope='col'>card_issued</th>"+
					"<th scope='col'>Update</th>"+
					"<th scope='col'>Remove</th>"+
					"</tr><tbody>";
			String query = "select * from card_data";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			// iterate through the rows in the result set
			while (rs.next())
			{
				String userCard_ID = Integer.toString(rs.getInt("userCard_ID"));
				String card_number = rs.getString("card_number");
				String cvv = Integer.toString(rs.getInt("cvv"));
				String exp_date = rs.getString("exp_date");
				String crd_holder_name = rs.getString("crd_holder_name");
				String card_issued = rs.getString("card_issued");

//				output += "<tr><td><input id='hidCustomerIDUpdate' name='hidCustomerIDUpdate' type='hidden' value='"
//						+ userCard_ID + "'>" + card_number + "</td>";
//				output += "<td>" + cvv + "</td>";
//				output += "<td>" + exp_date + "</td>";
//				output += "<td>" + crd_holder_name + "</td>";
//				output += "<td>" + card_issued + "</td>";

				output += "<tr>"
						+ "<td><input type='hidden' name='hidCustomerIDUpdate' id='hidCustomerIDUpdate' value='"+userCard_ID+"'>"+card_number+"</td>"
						+ "<td>"+cvv+"</td>"
						+ "<td>"+exp_date+"</td>"
						+ "<td>"+crd_holder_name+"</td>"
						+ "<td>"+card_issued+"</td>"
						+ "<td><input name='btnUpdate' type='button' value='Update' class='btnUpdate btn btn-primary ' data-idcustomer='"+userCard_ID +"'></td>"
						+ "<td><input name='btnRemove' type='button' value='Remove' class='btnRemove btn btn-danger ' data-idcustomer='"+userCard_ID+"'></td>"
						+ "</tr>";
				// buttons
				// buttons
				
			}
			con.close();
			// Complete the html table
			output += "</tbody></table>";
			
	
			//  output = "Data reterive successfully.";
		}
		catch (Exception e)
		{

			System.err.println(e.getMessage());
		}
		return output;
	}


	public String deleteData(String userCard_ID)
	{
		String output = "";
		try {
			connection = connect();

			if(connection == null) {
				output = "Error while connectiong to the database";
				return output;
			}

			//Query
			query = "DELETE FROM card_data WHERE userCard_ID = " + userCard_ID;
			statement = connection.createStatement();
			int del = statement.executeUpdate(query);

			if(del > 0) {
				output = "Card removed successfully";
			}
			else {
				output = "Card not found";
			}
			String newCustomer = readItems();
			output = "{\"status\":\"success\", \"data\": \"" + newCustomer + "\"}";
		}
		catch (Exception e)
		{
			output = "Error while deleting the Account.";
			System.err.println(e.getMessage());
		}
		return output;
	}





	//update
	public String updateCard(String userCard_ID, String card_number, String cvv, String exp_date, String crd_holder_name, String card_issued)

	{
		String output = "";
		try
		{
			Connection con = connect();
			if (con == null)
			{  return "Error while connecting to the database for updating."; }
			// create a prepared statement
			String query = "UPDATE card_data SET card_number=?,cvv=?,exp_date=?,crd_holder_name=?,card_issued=? WHERE userCard_ID=?";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			// binding values
			preparedStmt.setString(1, card_number);
			preparedStmt.setInt(2, Integer.parseInt(cvv));
			preparedStmt.setString(3, exp_date);
			preparedStmt.setString(4, crd_holder_name);
			preparedStmt.setString(5, card_issued);
			preparedStmt.setInt(6, Integer.parseInt(userCard_ID));
			// execute the statement
			preparedStmt.execute();
			con.close();
			output = "Updated successfully";

			String newCustomer = readItems();
			output = newCustomer;
		}
		catch (Exception e)
		{
			output = "{\"status\":\"error\", \"data\": \"Error while updating the Details.\"}";
			System.err.println(e.getMessage());
		}
		return output;
	}


}
