<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="model.Bill"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Payment details</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.4.1.min.js"></script>
<script src="Components/payment.js"></script>
</head>
<body>

	<div class="container">
		<div class="card">
			<div class="card-header bg-info text-light d-flex align-items-center">
				<h1>Payment Details</h1>
			</div>
			<div class="card-body">
				<form id="formpay" name="formpay" method="post" action="Payment.jsp">
	                    customer_name: <input
						id="customer_name" name="customer_name" type="text"
						class="form-control form-control-sm"> <br> Bill AccountNo : <input
						id="bill_accountNo" name="bill_accountNo" type="text"
						class="form-control form-control-sm"><br> Date:
					 <input id="date" name="date" type="text"
						class="form-control form-control-sm"> <br> Pay Amount:  <input id="amount" name="amount" type="text"
						class="form-control form-control-sm"> <br> Email:  <input id="pay_amount" name="pay_amount" type="text"
						class="form-control form-control-sm"> <br> 
						
					<div class="text-right">
					
						<input id="btnSave" name="btnSave" type="button" value="SAVE"
							class="btn btn-primary"> <input type="hidden"
							id="hidCustomerIDSave" name="hidCustomerIDSave" value="">
					</div>
				</form>
				<div id="alertSuccess" class="alert alert-success" style="margin-top: 15px"></div>
				<div id="alertError" class="alert alert-danger" style="margin-top: 15px"></div>
				<div id="divItemsGrid" class="table-responsive">
					<%
					Bill bill2 = new Bill();
					out.print(bill2.readPayment());
					%>
				</div>
			</div>

		</div>
	</div>
</body>
</html>