/**
 * MuleSoft Examples
 * Copyright 2014 MuleSoft, Inc.
 *
 * This product includes software developed at
 * MuleSoft, Inc. (http://www.mulesoft.com/).
 */

package org.mule.examples;

import static org.junit.Assert.assertNotNull;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import org.apache.commons.io.FileUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.After;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.mule.MessageExchangePattern;
import org.mule.api.MuleEvent;
import org.mule.api.MuleException;
import org.mule.api.config.MuleProperties;
import org.mule.processor.chain.SubflowInterceptingChainLifecycleWrapper;
import org.mule.tck.junit4.FunctionalTestCase;

import com.workday.revenue.BusinessEntityStatusValueObjectIDType;
import com.workday.revenue.BusinessEntityStatusValueObjectType;
import com.workday.revenue.BusinessEntityWWSDataType;
import com.workday.revenue.CustomerStatusDataType;
import com.workday.revenue.CustomerType;
import com.workday.revenue.CustomerWWSDataType;
import com.workday.revenue.GetCustomersResponseType;
import com.workday.revenue.PutCustomerRequestType;
import com.workday.revenue.ReasonForCustomerStatusChangeObjectIDType;
import com.workday.revenue.ReasonForCustomerStatusChangeObjectType;

public class AddingNewCustomerToWorkdayRevenueManagementIT extends FunctionalTestCase
{
	private static final Logger LOGGER = LogManager.getLogger(AddingNewCustomerToWorkdayRevenueManagementIT.class);
	private static final String PATH_TO_TEST_PROPERTIES = "./src/test/resources/mule.test.properties";
	private static final String PATH_TO_XML = "./src/test/resources/customer.xml";
	private static final String CUSTOMER_NAME = "John" + System.currentTimeMillis();
	private static final String FLOW_NAME = "add-customer-flow";
	private static String REASON_WID;
	private static String STATUS_WID;
	private String xmlInput;	
	private static final String MAPPINGS_FOLDER_PATH = "./mappings";
	private CustomerType customer;
	
	@BeforeClass
	public static void init(){		
		Properties props = new Properties();
		try {			
			props.load(new FileInputStream(PATH_TO_TEST_PROPERTIES));			
		} catch (Exception e) {
			throw new IllegalStateException(
					"Could not find the test properties file.");
		}
		
		System.setProperty("wday.user", props.getProperty("wday.user"));
		System.setProperty("wday.password", props.getProperty("wday.password"));
		System.setProperty("wday.endpoint", props.getProperty("wday.endpoint"));
		
		REASON_WID = props.getProperty("wday.reason.id");
		STATUS_WID = props.getProperty("wday.status.id");
	}
	
	@Before
	public void setUp() throws Exception {						
		xmlInput = FileUtils.readFileToString(new File(PATH_TO_XML));
		xmlInput = xmlInput.replace("NAME", CUSTOMER_NAME);
		LOGGER.info("Test customer: " + CUSTOMER_NAME);
	}

	@Test
	public void testCreateCustomer() throws Exception{
		runFlow(FLOW_NAME, xmlInput);
		
		Thread.sleep(10000);
		
		SubflowInterceptingChainLifecycleWrapper retrieveAccountWdayFlow = getSubFlow("retrieveAccountWdayFlow");
		retrieveAccountWdayFlow.initialise();		
		customer = invokeRetrieveWdayFlow(retrieveAccountWdayFlow, CUSTOMER_NAME);		
		
		assertNotNull("Customer should have been synced", customer);		
	}
	
	@After
	public void tearDown() throws MuleException, Exception{
		SubflowInterceptingChainLifecycleWrapper deleteFlow = getSubFlow("inactivateAccountWorkdayFlow");
		deleteFlow.initialise();
		deleteFlow.process(getTestEvent(inactivateCustomer(customer)));
	}
	
	static PutCustomerRequestType inactivateCustomer(CustomerType customer){
		
		PutCustomerRequestType put = new PutCustomerRequestType();
		CustomerWWSDataType data = new CustomerWWSDataType();
		LOGGER.info("Deleting wday customer: " + customer.getCustomerData().getCustomerName());
		data.setCustomerName(customer.getCustomerData().getCustomerName());
		BusinessEntityWWSDataType entity = new BusinessEntityWWSDataType();
		entity.setBusinessEntityName(customer.getCustomerData().getCustomerName());
		data.setBusinessEntityData(entity);
		data.setCustomerCategoryReference(customer.getCustomerData().getCustomerCategoryReference());
		List<CustomerStatusDataType> statusList = new ArrayList<CustomerStatusDataType>();
		CustomerStatusDataType status = new CustomerStatusDataType();
		
		BusinessEntityStatusValueObjectType value = new BusinessEntityStatusValueObjectType();
		List<BusinessEntityStatusValueObjectIDType> ids = new ArrayList<BusinessEntityStatusValueObjectIDType>();
		BusinessEntityStatusValueObjectIDType e = new BusinessEntityStatusValueObjectIDType();
		e.setType("WID");
		e.setValue(STATUS_WID);
		ids.add(e);
		value.setID(ids);
		
		ReasonForCustomerStatusChangeObjectType reason = new ReasonForCustomerStatusChangeObjectType();
		List<ReasonForCustomerStatusChangeObjectIDType> reasonIds = new ArrayList<ReasonForCustomerStatusChangeObjectIDType>();
		ReasonForCustomerStatusChangeObjectIDType reasonId = new ReasonForCustomerStatusChangeObjectIDType();
		reasonId.setType("WID");
		reasonId.setValue(REASON_WID);
		reasonIds.add(reasonId);
		reason.setID(reasonIds);
		
		status.setReasonForCustomerStatusChangeReference(reason);
		status.setCustomerStatusValueReference(value);
		statusList.add(status);
		data.setCustomerStatusData(statusList);
				
		put.setCustomerReference(customer.getCustomerReference());
		put.setCustomerData(data);
		return put;
	}

	protected CustomerType invokeRetrieveWdayFlow(SubflowInterceptingChainLifecycleWrapper flow, String name) throws Exception {
		MuleEvent event = flow.process(getTestEvent(name, MessageExchangePattern.REQUEST_RESPONSE));
		Object resultPayload = event.getMessage().getPayload();
		return ((GetCustomersResponseType) resultPayload).getResponseData().get(0).getCustomer().get(0);		
	}

	@Override
    protected String getConfigResources()
    {
        return "add_a_new_customer.xml,flows/test-flows.xml";
    }
	
	@Override
	protected Properties getStartUpProperties() {
		Properties properties = new Properties(super.getStartUpProperties());

		String pathToResource = MAPPINGS_FOLDER_PATH;
		File graphFile = new File(pathToResource);

		properties.put(MuleProperties.APP_HOME_DIRECTORY_PROPERTY,
				graphFile.getAbsolutePath());

		return properties;
	}
	
}
