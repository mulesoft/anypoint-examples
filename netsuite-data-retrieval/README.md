# Netsuite data retrieval Example

This example application illustrates how to use Mule ESB to build a simple HTTP application using APIKit to fetch data from Netsuite. After reading this document, creating and running the example in Mule, you should be able to leverage what you have learned to create an HTTP request-response application that is able to retrieve requested data from Netsuite instance based on your criteria.

This example can also be used while configuring any of our [Anypoint Netsuite Templates](https://www.mulesoft.com/exchange/?search=netsuite) for retrieving Customers / Items / Opportunities data

### Assumptions

This document describes the details of the example within the context of Anypoint Studio, Mule ESB graphical user interface (GUI). This document assumes that you are familiar with Mule ESB and the [Anypoint Studio interface](http://www.mulesoft.org/documentation/display/current/Anypoint+Studio+Essentials). To increase your familiarity with Mule Studio, consider completing one or more [Anypoint Studio Tutorials](http://www.mulesoft.org/documentation/display/current/Basic+Studio+Tutorial).

### Example Use Case

This application employs APIKit Router component to route HTTP requests to exact flow defined by resource and method. Afterwards, the flows prepare search criteria request for Netsuite connector using the HTTP query parameters. The response is transformed to the JSON and returned to the user.

### Set Up and Run the Example

As with other [examples](https://www.mulesoft.com/exchange/?type=example), you can create template applications straight out of the box in Anypoint Studio. You can tweak the configurations of these use case-based examples to create your own customized applications in Mule.

Follow the procedure below to create, then run the **Netsuite data retrieval** application.

1. Open the Example project in Anypoint Studio from [Anypoint Exchange](http://www.mulesoft.org/documentation/display/current/Anypoint+Exchange).
2. Go to Global Elements and open Netsuite Connector element. Fill in your Netsuite credentials.
3. Run the application.
The APIKit console should start and the user can choose which endpoint wants to hit. The main
	+	GET /customers 	
		- return customers data from Netsuite instance according to the specified parameters
		- user are able to define 1 HTTP query parameter - name
			+ name - defining the String that the customer's name have to start with
	+	GET /items	
		- return items data from Netsuite instance according to the specified parameters
		- user are able to define 2 HTTP query parameters - quantity, operator
			+ quantity - defining the Number that the items count have to match in agreement with operator value
			+ operator - defining the operator which define the operation about the quantity number; there are 5 types to choose - LESS\_THAN, GREATER\_THAN, EQUAL\_TO, LESS\_THAN\_OR\_EQUAL\_TO, GREATER\_THAN\_OR\_EQUAL\_TO
	+	GET /opportunities	
		- return sales orders data from Netsuite instance according the specified parameters
		- user should define 1 HTTP query parameter - title
			+ title 		- defining the String that the opportunities's title have to start with

4. Click on the resource which yhou want to use, specify the parameters and click on *GET* button.
5. You will see the retrieved data structure. If the data in Netsuite instance does not match your criteria, empty list is returned. In case, that we want to list all the data about any object, you should leave the parameters fields blank.

### How it Works

The **Netsuite data retrieval** example application contains Netsuite integration [flows](http://www.mulesoft.org/documentation/display/current/Mule+Application+Architecture) and exception handling. The main flow receive user HTTP requests and using the [APIKit router](https://docs.mulesoft.com/anypoint-platform-for-apis/apikit-basic-anatomy) process them to the right flow or handle exception.

The sections below elaborate further on the configurations of the application and how the flow works to respond to end user requests.

### get:/customers:netsuite-api-config

This flow is responsible for displaying data about customers from Netsuite system. 
At the beginning, using the [DataWeave transformer](https://docs.mulesoft.com/mule-user-guide/v/3.9/dataweave)the Search criteria request - CustomerSearch object - using the query parameters is prepared. 
Next, the [Netsuite connector](https://docs.mulesoft.com/mule-user-guide/v/3.9/netsuite-connector) is used to retrieve the data using the created search criteria. 
Finally, he response from Netsuite system is transformed by DataWeave transformer into JSON structure and sent back to end user. 

### get:/items:netsuite-api-config


This flow is responsible for displaying data about items from Netsuite system. 
At the beginning, using the [DataWeave transformer](https://docs.mulesoft.com/mule-user-guide/v/3.9/dataweave)the Search criteria request - ItemSupplyPlanSearchBasic object - using the query parameters is prepared. 
Next, the [Netsuite connector](https://docs.mulesoft.com/mule-user-guide/v/3.9/netsuite-connector) is used to retrieve the data using the created search criteria. 
Finally, he response from Netsuite system is transformed by DataWeave transformer into JSON structure and sent back to end user. 

### get:/opportunities:netsuite-api-config

This flow is responsible for displaying data about opportunities from Netsuite system. 
At the beginning, using the [DataWeave transformer](https://docs.mulesoft.com/mule-user-guide/v/3.9/dataweave)the Search criteria request - OpportunitySearch object - using the query parameters is prepared. 
Next, the [Netsuite connector](https://docs.mulesoft.com/mule-user-guide/v/3.9/netsuite-connector) is used to retrieve the data using the created search criteria. 
Finally, he response from Netsuite system is transformed by DataWeave transformer into JSON structure and sent back to end user. 

### Go Further

- Learn more about the [HTTP endpoint](http://www.mulesoft.org/documentation/display/current/HTTP+Connector).
- Learn more about the [Netsuite connector](https://docs.mulesoft.com/mule-user-guide/v/3.9/netsuite-connector)
- Learn more about the [Error Handling](http://www.mulesoft.org/documentation/display/current/Error+Handling)
- Learn more about the [APIKit router](https://docs.mulesoft.com/anypoint-platform-for-apis/apikit-tutorial)