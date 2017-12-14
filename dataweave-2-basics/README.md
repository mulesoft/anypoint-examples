# DataWeave 2 basics

This example application contains few simple flows that introduce most of the basic implementations of DataWeave 2 in different components.

### Assumptions

This document assumes you are familiar with DataWeave 2 Language's basic syntax and are comfortable building and running Mule applications using Mule Studio or XML.

If you aren't yet familiar with how to access information about the Mule messages that pass through your applications, consider following this tutorial, which walks you through both examining your Mule message and its data structure and writing DataWeave 2 expressions.

### Set up and run the example

1. Open the Example project in Anypoint Studio from [Anypoint Exchange](http://www.mulesoft.org/documentation/display/current/Anypoint+Exchange).

2. In your application in Studio, click the **Global Elements** tab. Double-click the HTTP Listener global element to open its **Global Element Properties** panel. Change the contents of the **port** field to required HTTP port e.g. 8081

3. In the Package Explorer pane in Studio, right-click the project name, then select Run As > Mule Application. Studio runs the application and Mule is up and kicking!

4. ****Flow 1**** : Through a web browser, access the URL **http://localhost:8081/greet1?username=yourName** 
The response prints the words **Hello (yourName)** in your browser.

5. ****Flow 2**** : Through a web browser, access the URL **http://localhost:8081/greet2?username=yourName**. This prints the words **Hello (yourName)** in your browser.
Then, access the URL again, but this time do not include any parameters. Verify that the expected output is received.

6. ****Flow 3**** : Through a web browser, access the URL **http://localhost:8081/greet3?username=yourName&age=22**. This will print the words **Hello (yourName)** in your browser and also save a csv file that contains this data, plus the value true for the boolean parameter.

7. ****Flow 4**** : In a browser, access the URL **http://localhost:8081/greet4?username=yourName&age=22**. This will print the words **Hello (yourName)** in your browser and also save a csv file that contains this data, plus the value true for the boolean parameter.
 

8. ****Flow 5**** : You must now send the HTTP endpoint an HTTP request that includes a body with an attached XML file. Send a POST request to **http://localhost:8081/greet5** attaching an XML to the body of the message. A sample XML is provided below.

	The easiest way to do this is to send a POST via a browser extension such as Postman (for Google Chrome) or the curl command line utility.

		< user >
		< username > test < /username >
		< age > 21 < /age >
		< /user >
 
    This will print the words Hello yourName in your browser and also save a csv file that contains this data, plus the value true for the boolean parameter.


9. ****Flow 6**** : You must now send the HTTP endpoint an HTTP request that includes a body with an attached JSON file. Send a POST request to **http://localhost:8081/greet6**, attaching a JSON object the body of the message. A sample JSON is provided below.

	The easiest way to do this is by sending a POST via a browser extension such as Postman (for Google Chrome) or the curl command line utility.

		{ "username": "test", "age" : 21 }
 
	This will print the words Hello yourName in your browser and also save a csv file that contains this data, plus the value true for the boolean parameter.
 


##### Flow 1 – Accessing Properties

This flow creates a simple web service that takes an HTTP request that includes a username parameter and returns a greeting using that username.

In this example, you use DataWeave to:

* access query parameter
* dynamically set the payload
 
##### Flow 2 – Dynamic Routing by Evaluating a Condition

In the previous flow, if your call to the service doesn't include a username parameter, it results in an error. You can prevent this from happening by adding some flow control components. This example includes a Choice Router that verifies if the required parameter is being passed.

In this flow, you use DataWeave to:

* evaluate conditions in a choice component
* access query parameter
* dynamically set the payload
 
##### Flow 3 – Variable Assignment and Evaluating Conditions

In this flow, the service saves a CSV file with user data besides just returning a greeting. The call to the service will now include two parameters, username and age. The service stores these two parameters.

In this flow, you will use DataWeave to:

* set a flow variable in the message
* generate an output based on evaluating the input
* access query paramters
* dynamically set the payload


#####Flow 4 –  Creating Maps and Evaluating Conditions with DataWeave

In this flow, like in the previous one, the Mule application saves a CSV file with user data and returns a greeting. The call to the service includes two parameters, username and age. The service stores these two parameters.

In this example, you will use DataWeave to:

* set a flow variable in the message
* generate an output based on evaluating the input within DataWeave
* access query parameter
* dynamically set the payload

##### Flow 5 – XML request

In all the previous flows, calls to the service were made via GET requests that included query parameters. In this example, the service you create is an API that accepts POST requests with XML bodies. The required XML includes two parameters, username and age. The service stores these two parameters.

In this flow, you use DataWeave to:

* set a flow variable in the message
* generate an output based on evaluating the input
* parse an XML
* dynamically set the payload

 

##### Flow 6 – JSON request

This flow is just like flow 5, except that the service now receives JSON inputs rather than of XML.

The JSON input includes two parameters, username and age. The service stores these two parameters.

In this example, you will use DataWeave to:

* set a flow variable in the message
* generate an output based on evaluating the input
* dynamically set the payload
