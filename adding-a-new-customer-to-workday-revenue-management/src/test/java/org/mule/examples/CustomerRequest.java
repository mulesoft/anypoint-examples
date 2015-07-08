/**
 * MuleSoft Examples
 * Copyright 2014 MuleSoft, Inc.
 *
 * This product includes software developed at
 * MuleSoft, Inc. (http://www.mulesoft.com/).
 */

package org.mule.examples;

import java.util.ArrayList;
import java.util.List;

import com.workday.revenue.CustomerRequestCriteriaType;
import com.workday.revenue.GetCustomersRequestType;

public class CustomerRequest {

	public static GetCustomersRequestType getCustomer(String id){
		GetCustomersRequestType get = new GetCustomersRequestType();
		List<CustomerRequestCriteriaType> requestCriteria = new ArrayList<CustomerRequestCriteriaType>();
		CustomerRequestCriteriaType crit = new CustomerRequestCriteriaType();
		crit.setCustomerReferenceID(id);
		requestCriteria.add(crit);
		get.setRequestCriteria(requestCriteria);
		return get ;
	}
}
