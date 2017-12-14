# Proxying a SOAP API #

This example shows how to proxy your API. Applications send service requests to your proxy, which in turn calls the real API.

### Assumptions ###

This document assumes that you are familiar with Mule and the [Anypoint™ Studio interface](http://www.mulesoft.org/documentation/display/current/Anypoint+Studio+Essentials). To increase your familiarity with Studio, consider completing one or more [Anypoint Studio Tutorials](http://www.mulesoft.org/documentation/display/current/Basic+Studio+Tutorial). Further, this example assumes that you have a basic understanding of [Mule flows](http://www.mulesoft.org/documentation/display/current/Mule+Application+Architecture) and [Mule Global Elements](http://www.mulesoft.org/documentation/display/current/Global+Elements).

Furthermore, this document assumes that you have a SOAP API that has not been built to run on Mule ESB

This document describes the details of the example within the context of Anypoint Studio, Mule ESB’s graphical user interface, and includes configuration details for XML Editor where relevant.

### Example Use Case ###

In this simple example, an application serves as a minimum proxy that can routes request and response to and from a SOAP API. After receiving request, it calls SOAP API of service described in wsdl (resources/tshirt.wsdl) and lists inventories.

### Set Up and Run the Example ###

Complete the following procedure to create, then run this example in your own instance of Anypoint Studio. Skip ahead to the next section if you prefer to simply examine this example via code snippets.

1. Open the Example project in Anypoint Studio from [Anypoint Exchange](http://www.mulesoft.org/documentation/display/current/Anypoint+Exchange).
2. In your application in Studio, click the **Global Elements** tab. Double-click the HTTP Listener global element to open its **Global Element Properties** panel. Change the contents of the **port** field to required HTTP port e.g. 8081. 
3. In the Package Explorer pane in Studio, right-click the project name, then select Run As > Mule Application. Studio runs the application and Mule is up and kicking!
5. Send the following POST request with xml body to your API via the proxy URL: http://localhost:8081/listInventory.

		    <ns1:ListInventory xmlns:ns1='http://mulesoft.org/tshirt-service' />


You can use a browser extension such as Postman or the curl command line utility. As a response to this request, you should receive a list of inventories.

### How it Works ###

Follow the anatomy described here to build a proxy application in Mule Studio that abstracts your API to a new layer. Your proxy application needs to:

1. Accept incoming service call from applications and route them to the URI of your target API.
2. Return the response back to the application that made the service call.

### Documentation ###

Studio includes a feature that enables you to easily export all the documentation you have recorded for your project. Whenever you want to share your project with others outside the Studio environment, you can export the project's documentation to print, email or share online. Studio's auto-generated documentation includes:

- A visual diagram of the flows in your application
- The XML configuration which corresponds to each flow in your application
- The text you entered in the Notes tab of any building block in your flow

Follow [the procedure](http://www.mulesoft.org/documentation/display/current/Importing+and+Exporting+in+Studio#ImportingandExportinginStudio-ExportingStudioDocumentation) to export auto-generated Studio documentation.

### Go Further 

- Mulesoft offer an out of the box solution for proxying and managing existing APIs using the Anypoint API Platform. To see the detailed documentation and capabilities, please refer to: [Proxying Your API](http://www.mulesoft.org/documentation/display/current/Proxying+Your+API)


