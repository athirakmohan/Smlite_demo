package com.assignment.vendor;

import static org.junit.Assert.assertNotSame;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.powermock.modules.junit4.PowerMockRunner;

import com.assignment.vendor.dao.Vendor;


@RunWith(PowerMockRunner.class)
public class TestVendor  {
	
	@Test
	public void testTestVendorName() {		
		
		int id =1;
		String name = "test";
		Vendor entity = new Vendor(id, name, true, "11111", 1);
		
		entity.setName("cisco");
		assertNotSame(entity.getName(),equals(name));
	}

	@Test
	public void testVendorDetails() {
		int id =1;
		int orderType = 2;
		Vendor entity = new Vendor(id, "Cisco", true, "11111", 2);
		
		entity.setOrderType(0);
		assertNotSame(entity.getOrderType(),orderType);
	}

	

}
