 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="model.Bill"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bill details</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.4.1.min.js"></script>
<script src="Components/main.js"></script>
</head>
<body>

	<div class="container">
		<div class="card">
			<div class="card-header bg-info text-light d-flex align-items-center">
				<h1>Bill Details</h1>
			</div>
			<div class="card-body">
				<form id="formBill" name="formBill" method="post" action="Bill.jsp">
	                    Account No: <input
						id="accNo" name="accNo" type="text"
						class="form-control form-control-sm"> <br> Customer Name : <input
						id="custName" name="custName" type="text"
						class="form-control form-control-sm"><br> Unit Price:
					 <input id="unitPrice" name="unitPrice" type="text"
						class="form-control form-control-sm"> <br> Units:  <input id="units" name="units" type="text"
						class="form-control form-control-sm"> <br> 
						
					<div class="text-right">
						<input id="btnSave" name="btnSave" type="button" value="SAVE"
							class="btn btn-primary"> <input type="hidden"
							id="hidBillIDUpdate" name="hidBillIDUpdate" value="">
					</div>
				</form>
				<div id="alertSuccess" class="alert alert-success" style="margin-top: 15px"></div>
				<div id="alertError" class="alert alert-danger" style="margin-top: 15px"></div>
				<div id="divItemsGrid" class="table-responsive">
					<%
					Bill bill1 = new Bill();
					out.print(bill1.readItems());
					%>
				</div>
			</div>

		</div>
	</div>
</body>
</html>