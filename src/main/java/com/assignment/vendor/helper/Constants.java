package com.assignment.vendor.helper;

/**
 * Reusable constants.
 * 
 * 
 */
public interface Constants {

	String ENTITY_PREFIX_VENDOR = "vendor";

	String URL = "jdbc:mysql://localhost:3306/";

	String DBNAME = "vendor";

	String DRIVER = "com.mysql.jdbc.Driver";

	String USERNAME = "root";

	String PASSWORD = "root";

	// Queries
	String SQL_GET_ORDER_TYPES = "select *from order_type";

	String SQL_GET_VENDOR = "select *from vendor where id=?";

	String SQL_GET_VENDORS = "select *from vendor";

	String SQL_ADD_VENDOR = "insert into vendor(name,purchaseOrderAvailable,purchaseNumber,purchaseCost,orderType) values(?,?,?,?,?)";

	String SQL_UPDATE_VENDOR = "update vendor set name=?, purchaseOrderAvailable=?, purchaseNumber=?,purchaseCost=?, orderType=? where id=?";

	String SQL_DELETE_VENDOR = "delete from vendor where id=?";
}
