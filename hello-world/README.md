# Hello World

This application demonstrates a simple HTTP request-response activity. Mule responds to end user calls submitted via Web browser with a message that reads, "Hello World". This example was designed to demonstrate the ability of a Mule application to interact with an end user via an HTTP request. The goal is to introduce users to Anypoint Studio by illustrating a very simple functionality.

### Assumption

This document describes the details of the example within the context of Anypoint™ Studio, Mule ESB’s graphical user interface (GUI). This document assumes that you are familiar with Mule ESB and the [Anypoint Studio interface](http://www.mulesoft.org/documentation/display/current/Anypoint+Studio+Essentials). To increase your familiarity with Mule Studio, consider completing one or more [Anypoint Studio Tutorials](http://www.mulesoft.org/documentation/display/current/Basic+Studio+Tutorial).

### Set Up and Run the Example

Complete the following procedure to create, then run this example in your own instance of Anypoint Studio. You can create template applications straight out of the box in Anypoint Studio and tweak the configurations of the use case-based templates to create your own customized applications in Mule.

1. Open the Example project in Anypoint Studio from [Anypoint Exchange](http://www.mulesoft.org/documentation/display/current/Anypoint+Exchange).
2. In your application in Studio, click the **Global Elements** tab. Double-click the HTTP Listener global element to open its **Global Element Properties** panel. Change the contents of the **port** field to required HTTP port e.g. 8081
3. In the Package Explorer pane in Studio, right-click the project name, then select Run As > Mule Application. Studio runs the application and Mule is up and kicking!
4. Open your Web browser.
5. In the address bar, type the following URL: http://localhost:8081/helloWorld
6. Press enter to elicit a response from the Hello World application.

### How it Works
The Hello World example consists of one simple [Mule flow](http://www.mulesoft.org/documentation/display/current/Mule+Application+Architecture). This flow accepts an HTTP request, sets a static payload on the message, then returns a response to the end user.

The request-response inbound [HTTP endpoint](http://www.mulesoft.org/documentation/display/current/HTTP+Connector) receives requests the end user submits to the Web service. Because it has a request-response message exchange pattern, this HTTP endpoint is responsible for both receiving and returning messages. The descriptive notes included in the configuration of the endpoint helps other developers understand the actions the element performs in the context of the application.

As its name suggests, the [Set Payload transformer](http://www.mulesoft.org/documentation/display/current/Set+Payload+Transformer+Reference) sets a value in the message payload. In this example, the value utilizes a Mule expression to set a static string on the payload. Like the HTTP endpoint, the descriptive notes included in the configuration helps other developers understand the actions the element performs in the context of the application.

### Documentation

Anypoint Studio includes a feature that enables you to easily export all the documentation you have recorded for your project. Whenever you want to share your project with others outside the Studio environment, you can export the project's documentation to print, email or share online. Studio's auto-generated documentation includes:

* a visual diagram of the flows in your application
* the XML configuration which corresponds to each flow in your application
* the text you entered in the Notes tab of any building block in your flow

Follow [the procedure](http://www.mulesoft.org/documentation/display/current/Importing+and+Exporting+in+Studio#ImportingandExportinginStudio-ExportingStudioDocumentation) to export auto-generated Studio documentation.

### Go Further

* Learn more about configuring an [HTTP Endpoint](http://www.mulesoft.org/documentation/display/current/HTTP+Connector) in Studio.
* Read about the concept of [flows](http://www.mulesoft.org/documentation/display/current/Mule+Concepts) in Mule.
