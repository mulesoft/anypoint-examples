# HTTP Request-Response with Logger Example

This example application illustrates how to use Mule ESB to build a simple HTTP request-response application. After reading this document, and creating and running the example in Mule, you should be able to leverage what you have learned to create a very simple HTTP request-response application.

### Logging Activity

This example was designed to demonstrate interaction between an end user and Mule via an HTTP request, and Mule's ability to log activity in the application.

### Assumptions

This document describes the details of the example within the context of Anypoint™ Studio, Mule ESB’s graphical user interface (GUI). This document assumes that you are familiar with Mule ESB and the [Anypoint Studio interface](http://www.mulesoft.org/documentation/display/current/Anypoint+Studio+Essentials). To increase your familiarity with Mule Studio, consider completing one or more [Anypoint Studio Tutorials](http://www.mulesoft.org/documentation/display/current/Basic+Studio+Tutorial).

### Example Use Case

In this example, an user calls the Mule application by submitting a request via his browser (i.e. entering a specific URL, http://localhost:8084/echo). The application receives the request, set request path as payload and returns the payload, or "echoes" the response, to the end user. In other words, when an user types http://localhost:8084/echo into the address bar of her browser, Mule returns a message in the browser that reads, /echo (see image below, left); if she enters http://localhost:8084/moon, Mule responds with /moon (below, right).  

There are two functions the HTTP Request-Response with Logger example application illustrates:

1. it receives [HTTP requests](http://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol#Request_message) and returns [HTTP responses](http://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol#Response_message)
2. it logs the payload

### Set Up and Run the Example

As with other [examples](https://www.mulesoft.com/exchange#!/?types=example), you can create template applications straight out of the box in Anypoint Studio or, in this case, also in Mule Standalone where this example is called echo. You can tweak the configurations of these use case-based examples to create your own customized applications in Mule.

Follow the procedure below to create, then run the HTTP Request-Response with Logger application.

1. Open the Example project in Anypoint Studio from [Anypoint Exchange](http://www.mulesoft.org/documentation/display/current/Anypoint+Exchange).
2. In your application in Studio, click the **Global Elements** tab. Double-click the HTTP Listener global element to open its **Global Element Properties** panel. Change the contents of the **port** field to required HTTP port e.g. 8084
3. In the Package Explorer pane in Studio, right-click the project name, then select Run As > Mule Application. Studio runs the application and Mule is up and kicking!
4. Open your Web browser, type http://localhost:8084/echo in the address bar, then press **enter**.
5. Your browser presents a message that reads, /echo.
6. In your browser’s address bar, replace the word echo with the word moon, then press **enter**.
7. Your browser presents a message that reads, /moon.

### How it Works

The **HTTP Request-Response with Logger** example application consists of one, simple [flow](http://www.mulesoft.org/documentation/display/current/Mule+Application+Architecture) which receives end user HTTP requests, sets payloads based on the request paths, logs messages’ payloads, and returns the payloads to end users as HTTP responses.

The sections below elaborate further on the configurations of the application and how it works to respond to end user requests.

### EchoFlow

This flow makes use of four [building blocks](http://www.mulesoft.org/documentation/display/current/Elements+in+a+Mule+Flow) to receive, process and respond to an end user requests. When an end user request encounters the application, the first building block it meets is the request-response [HTTP Inbound Endpoint](http://www.mulesoft.org/documentation/display/current/HTTP+Connector). Because it has a two-way message exchange pattern, this HTTP endpoint is responsible for both receiving requests from, and send sending responses to, the end user.

Then the HTTP request path is set to message payload in [Set Payload Transformer](http://www.mulesoft.org/documentation/display/current/Set+Payload+Transformer+Reference). The Set Payload Transformer uses a Mule expression to determine what information in, or about, the message it should set to payload. In this case, because it needs to set the message request path, stored in attributes of the message, the expression is #[attributes.requestPath].

Next, the flow uses a [Logger Component](http://www.mulesoft.org/documentation/display/current/Logger+Component+Reference) to log the message payload in the application’s log files. The logger component uses a Mule expressionto determine what information in, or about, the message it should log. In this case, because it needs to log the message payload, the instructions to log read About to echo #[payload]. 

Finally, Mule moves the message back to the [HTTP Inbound Endpoint](http://www.mulesoft.org/documentation/display/current/HTTP+Connector) which simply returns the message payload as the response to an end user. In other words, the response echoes the request.

### Go Further

- Learn more about the [HTTP endpoint](http://www.mulesoft.org/documentation/display/current/HTTP+Connector).
- Learn more about the [Set Payload Transformer](http://www.mulesoft.org/documentation/display/current/Set+Payload+Transformer+Reference).
- Learn more about the [Logger component](http://www.mulesoft.org/documentation/display/current/Logger+Component+Reference).
