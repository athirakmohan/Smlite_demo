<%@page import="com.assignment.vendor.dao.OrderType"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.assignment.vendor.dao.Vendor"%>
<%@page import="com.assignment.vendor.helper.DBHelper"%>
<%@page import="java.util.List"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Vendors Management</title>
<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="css/bootstrap-responsive.min.css" rel="stylesheet"
	media="screen">

<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/vendor.js"></script>
</head>
<body>       
	<div style="margin: 100px 0 0 100px;">
		<div class="dropdown clearfix ">
			
				<button class="btn btn-primary dropdown-toggle" data-toggle="dropdown">Vendor</button>
			    <ul class="dropdown-menu" role="menu" aria-labelledby="drop1" >
				<li class="dropdown-submenu"><a tabindex="-1"
					href="javascript:showAddUpdateVendor(-1, true)">New</a></li>
				<li class="dropdown-submenu"><a tabindex="-1" href="javascript:location.reload();">Refresh</a></li>
			</ul>
			
			<button class="btn btn-primary" onclick="javascript:projections()">Projections</button>
         
		</div>
	
		<br>
		
		<div id="divListOfVendors">
			<div style="margin-bottom: 5px;"><b><u>List of Vendors:</u></b></div>
			<table id="vendors" border="2" cellpadding="5px"
				style="font-size: 12px;">
				<thead>
					<tr style="background: #5CB3FF; font-weight: bold;">
						<td>ID</td>
						<td>Name</td>
						<td>Is Purchase Order Available?</td>
						<td>Purchase Number</td>
						<td>Purchase cost</td>
						<td>Purchase Type</td>
						<td>Purchase Duration</td>
						<td>Actions</td>
					</tr>
				</thead>
				 <%
					DBHelper dbHelper = DBHelper.getInstance();
					List<OrderType> listOrderTypes = dbHelper.getOderTypes();
					List<Vendor> vendors = dbHelper.getVendors();

					if (vendors.size() == 0) {
				%>
				<tr>
					<td colspan="6" align="center">There are no vendors to
						display.</td>
				</tr>
				<%
					} else {
						for (int i = 0; i < vendors.size(); i++) {
							Vendor vendor = vendors.get(i);
				%>
				<tr>
					<td><%=vendor.getId()%></td>
					<td><%=vendor.getName()%></td>
					<td><%=vendor.isPurchaseOrderAvailable() ? "Yes" : "No"%></td>
					<td><%=vendor.isPurchaseOrderAvailable() ? vendor.getPurchaseNumber() : "N/A"%></td>
					<td><%=vendor.isPurchaseOrderAvailable() ? vendor.getPurchaseCost() : "N/A"%></td>
					<td><%=vendor.isPurchaseOrderAvailable() ? listOrderTypes.get(vendor.getOrderType() - 1).getName() : "N/A"%></td>
					<td><%=vendor.isPurchaseOrderAvailable() ? "Monthly" : "N/A"%></td>
					<td>
						<button class="btn" id="btnEdit<%=vendor.getId()%>"
							onclick="showAddUpdateVendor(<%=vendor.getId()%>, false)">Edit</button>
						<button class="btn" id="btnDelete<%=vendor.getId()%>"
							onclick="deleteVendor(<%=vendor.getId()%>, '<%=vendor.getName()%>')">Delete</button>
					</td>
				</tr>
				<%
					}
					}
				%>
			</table>
		</div>
		
		
		<div id="divProjections" style="display: none;">
			<div style="margin-bottom: 5px;"><b><u>Projections</u></b></div>
			<table id="projections" border="2" cellpadding="5px"
				style="font-size: 12px;" >
				<thead>
					<tr style="background: #5CB3FF; font-weight: bold;">
					    <td>Vendor</td>
						<td>Month Spending</td>
						<td>Projection for Quarter</td>
						<td>Projection for Year</td>						
					</tr>
				</thead>
				<%
				       int monthCost=0;
						for (int i = 0; i < vendors.size(); i++) {							
							 int monthCostVendor = 0;
							Vendor vendor = vendors.get(i);
							if(vendor.isPurchaseOrderAvailable()){
								  monthCostVendor = vendor.getPurchaseCost();
							      monthCost= monthCost+ vendor.getPurchaseCost();
							   
							}
							%>
							<tr>							
							   <td><%=vendor.getName()%></td>				
								<td><%=monthCostVendor%></td>
								<td><%=monthCostVendor*3%></td>
								<td><%=monthCostVendor*12%></td>							
							</tr>
						<%
						}			
				%>
				<tr style="font-size: 15px;background: #00CCCC;">
					<td style="font-weight: bold;">Total Projection</td>
					<td><%=monthCost%></td>
					<td><%=monthCost*3%></td>
					<td><%=monthCost*12%></td>
					
				</tr>
				
			</table>
		</div>
		<div id="divAddEditVendor" style="display: none;">
			<div id="addUpdateFormTitle"
				style="margin-bottom: 10px; text-decoration: underline; font-weight: bold;"></div>
			<div id="divErrMsg" style="margin-bottom: 10px; color: #FF0000"></div>
			<form id="addUpdateVendor" name="addUpdateVendor" action="#">
				<td><input type="hidden" id="id" name="id" value="" /></td>
				<table cellpadding="5">
					<tr valign="middle">
						<td>Name</td>
						<td><input type="text" id="name" name="name" value="" /></td>
					</tr>
					<tr valign="top">
						<td>Purchase Order</td>
						<td><input type="radio" name="purchaseOrderAvailable"
							value="true" onchange="enablePurchaseDetails(true)">&nbsp;&nbsp;Available
							<br> <input type="radio" name="purchaseOrderAvailable"
							value="false" onchange="enablePurchaseDetails(false)">&nbsp;&nbsp;Not
							Available</td>
					</tr>
					<tr valign="top">
						<td>Purchase Number</td>
						<td><input type="text" id="purchaseNumber"
							name="purchaseNumber" value="" /></td>
					</tr>
					<tr valign="top">
						<td>Purchase Cost</td>
						<td><input type="text" id="purchaseCost"
							name="purchaseCost" value="" /></td>
					</tr>
					<tr valign="top">
						<td>Purchase Order Type</td>
						<td><select id="orderType" name="orderType">
								<option value="0">Select a type...</option>
								<%
									for (int i = 0; i < listOrderTypes.size(); i++) {
										OrderType orderType = listOrderTypes.get(i);
								%>
								<option value="<%=orderType.getId()%>"><%=orderType.getName()%></option>
								<%
									}
								%>
						</select></td>
					</tr>
					<tr valign="top">
						<td>Purchase Duration</td>
						<td><span class="label">Monthly</span></td>
					</tr>
					<tr>
						<td colspan="2">
							<button class="btn" type="button" id="btnSave"
								onclick="saveVendor()">Add/Update</button>
							<button class="btn" type="button" id="btnReset"
								onclick="resetVendorForm()">Reset</button>
							<button class="btn" type="button" id="btnCancel"
								onclick="hideVendorForm()">Cancel</button>
						</td>
					</tr>
				</table>
			</form>
		</div>		
	</div>
	
</body>
</html>