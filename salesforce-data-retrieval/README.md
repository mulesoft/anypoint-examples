# Salesforce data retrieval Example

This example application illustrates how to use Mule ESB to build a simple HTTP application to query Salesforce in a dynamic way. After reading this document, creating and running the example in Mule, you should be able to leverage what you have learned to create an HTTP request-response application that is able to retrieve requested data from Salesforce instance based on your criteria.

This example can also be used while configuring any of our [Anypoint Salesforce Templates](https://www.mulesoft.com/library#!/?filters=Salesforce) for retrieving all needed Salesforce entity ID's (e.g. selecting User as object, leaving Field empty and querying by 'email')

### Assumptions

This document describes the details of the example within the context of Anypoint™ Studio, Mule ESB’s graphical user interface (GUI). This document assumes that you are familiar with Mule ESB and the [Anypoint Studio interface](http://www.mulesoft.org/documentation/display/current/Anypoint+Studio+Essentials). To increase your familiarity with Mule Studio, consider completing one or more [Anypoint Studio Tutorials](http://www.mulesoft.org/documentation/display/current/Basic+Studio+Tutorial).

### Example Use Case

In this example, a user makes an HTTP request to the endpoint containing predefined set of parameters that are extracted and used while building a Salesforce query. Afterwards, the application receives the response and provides it to the end user.

### Set Up and Run the Example

As with other [examples](https://www.mulesoft.com/exchange#!/?types=example), you can create template applications straight out of the box in Anypoint Studio. You can tweak the configurations of these use case-based examples to create your own customized applications in Mule.

Follow the procedure below to create, then run the **Salesforce data retrieval** application.

1. Open the Example project in Anypoint Studio from [Anypoint Exchange](http://www.mulesoft.org/documentation/display/current/Anypoint+Exchange).
2. In your application in Studio, click the **Global Elements** tab. Double-click the HTTP Listener global element to open its **Global Element Properties** panel. Change the contents of the **port** field to required HTTP port e.g. 8081
3. Go to Global Elements and open Salesforce Connector element. Fill in your Salesforce credentials including the [security token](https://help.salesforce.com/apex/HTViewHelpDoc?id=user_security_token.htm).
4. Run the application.
5. Open your browser and hit **http://localhost:8081**. The form will be provided to you, containing following values:

	+	Object - specify Salesforce object type, e.g. User, Account, Contact, etc. 
	+	Field - a valid field name for the given object you need, e.g. Email for Contact. **IMPORTANT**: Id and Name attributes are retrieved by default, so choosing these fields will result in an invalid query.
	+	Search Key -  a valid field name for the given object you wil use for matching, e.g. Name for Contact.
	+	Search Value - a value for the *Search Key* field that will be used for matching, e.g. *young* for Contact Name. All records that contain the *Search Value* value as a substring of the given *Search Key* field value are returned, i.e. contacts with names such as John Young or Michael Young will be returned. The more specific value, the less results you will obtain. 
6. Click *Submit* button.
7. You will see the retrieved data structure.
8. In case of invalid input, the message: *Invalid Salesforce query*.

If you are unsure about valid object types and their attributes, please visit [Salesforce Documentation site - Standard Objects](https://www.salesforce.com/developer/docs/api/Content/sforce_api_objects_list.htm).

### Example of specific Use Case

To find out the correct **sfdc.integration.user.id** value, after you'll run the example, please fill in the following values to the form:

+ Object: `User`
+ Field: can be empty as *Id* field is displayed by default
+ Search Key: `UserName`
+ Search Value: `bob.dylan@org` (value of the *sfdc.username*)

The *id* field from the output represents the *sfdc.integration.user.id* of the specified user.

### How it Works

The **Salesforce data retrieval** example application contains two [flows](http://www.mulesoft.org/documentation/display/current/Mule+Application+Architecture) which receive end user HTTP requests, process them and returns the result to the client.

The sections below elaborate further on the configurations of the application and how it works to respond to end user requests.

### showFormFlow

This flow is responsible for displaying a submit form with some fields to build a Salesforce query. It listens at *http://localhost:8081* for incoming Http GET requests. 
[Salesforce component](http://www.mulesoft.org/documentation/display/current/Salesforce+Connector) executes *Describe global* operation to gather all object types allowed for your organization in Salesforce. 
Next, [Expression block](http://www.mulesoft.org/documentation/display/current/Expression+Component+Reference) extracts names and labels of object types and transforms them into a HTML code to be used in a dropdown menu. 
Finally, [Parse Template component](http://www.mulesoft.org/documentation/display/current/Parse+Template+Reference) returns a specified HTML document containing the form. 

### salesforceIdRetrievalFlow

This flow makes use of five [building blocks](http://www.mulesoft.org/documentation/display/current/Elements+in+a+Mule+Flow) to receive and respond to an end user requests. When an end user request encounters the application, the first building block it meets is [HTTP Inbound Endpoint](http://www.mulesoft.org/documentation/display/current/HTTP+Connector). Because it has a two-way message exchange pattern, this HTTP endpoint is responsible for both receiving requests from and sending responses to the end user.

Then, [Salesforce component](http://www.mulesoft.org/documentation/display/current/Salesforce+Connector) executes a query created using Mule Expression Language. Basically, parameters from the payload are extracted. The Expression block transforms Salesforce data structure into a list of objects that Mule moves back to the [HTTP Inbound Endpoint](http://www.mulesoft.org/documentation/display/current/HTTP+Connector) which simply returns the message payload as the response to an end user in the form of HTML.

The Catch Exception Strategy is implemented to handle errors, such as using invalid Field value for the chosen Object type. 

### Go Further

- Learn more about the [HTTP endpoint](http://www.mulesoft.org/documentation/display/current/HTTP+Connector).
- Learn more about the [Expression component](http://www.mulesoft.org/documentation/display/current/Expression+Component+Reference) 
- Learn more about the [Salesforce component](http://www.mulesoft.org/documentation/display/current/Salesforce+Connector)
- Learn more about the [Error Handling](http://www.mulesoft.org/documentation/display/current/Error+Handling)
