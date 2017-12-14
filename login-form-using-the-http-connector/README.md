# Login form using the HTTP connector Example

This example application illustrates how to use Mule ESB to build a simple HTTP application with a login form. After reading this document, and creating and running the example in Mule, you should be able to leverage what you have learned to create an HTTP request-response application that is able to process incoming HTTP requests containing submitted form data.

### Using Parse Template and the HTTP connector

This example was designed to demonstrate Mule's ability to parse and render HTML documents and to handle submitted data through the HTTP connector.

### Assumptions

This document describes the details of the example within the context of Anypoint™ Studio, Mule ESB’s graphical user interface (GUI). This document assumes that you are familiar with Mule ESB and the [Anypoint Studio interface](http://www.mulesoft.org/documentation/display/current/Anypoint+Studio+Essentials). To increase your familiarity with Mule Studio, consider completing one or more [Anypoint Studio Tutorials](http://www.mulesoft.org/documentation/display/current/Basic+Studio+Tutorial).

### Example Use Case

In this example, a user submits a username and a password using the HTML login form provided by the application. The application receives the credentials and responds with the authentication result. This simple case permits only *mule/mule* pair to be the valid username/password pair.

### Set Up and Run the Example

As with other [examples](https://www.mulesoft.com/exchange#!/?types=example), you can create applications straight out of the box in Anypoint Studio. You can tweak the configurations of these use case-based examples to create your own customized applications in Mule.

Follow the procedure below to create, then run the Login form using the HTTP connector application.

1. Open the Example project in Anypoint Studio from [Anypoint Exchange](http://www.mulesoft.org/documentation/display/current/Anypoint+Exchange).
2. In your application in Studio, click the **Global Elements** tab. Double-click the HTTP Listener global element to open its **Global Element Properties** panel. Change the contents of the **port** field to required HTTP port e.g. 8081
3. In the Package Explorer pane in Studio, right-click the project name, then select Run As > Mule Application. Studio runs the application and Mule is up and kicking!
4. Open your browser and hit **http://localhost:8081/login**.
5. Enter mule for username and mule for password. Hit submit button. 
6. You should recieve this response:

		User mule has been logged successfully! 
		
		 or otherwise 
		
		Wrong password for username mule 

7. If you hit **http://localhost:8081/requesterLogin**, you should see the successful message as the correct credentials are set by the flow and the login is always successful.

### How it Works

The **Login form using the HTTP connector** example application consists of three, simple [flows](http://www.mulesoft.org/documentation/display/current/Mule+Application+Architecture) which receives end user HTTP requests, sets payloads based on the request paths and sent data and returns the payloads to end users as HTTP responses.

The sections below elaborate further on the configurations of the application and how it works to respond to end user requests.

### GetLoginPageFlow

This flow makes use of two [building blocks](http://www.mulesoft.org/documentation/display/current/Elements+in+a+Mule+Flow) to receive and respond to an end user requests. When an end user request encounters the application, the first building block it meets is [HTTP Inbound Endpoint](http://www.mulesoft.org/documentation/display/current/HTTP+Connector). Because it has a two-way message exchange pattern, this HTTP endpoint is responsible for both receiving requests from and sending responses to the end user.

Then, [Parse Template component](http://www.mulesoft.org/documentation/display/current/Parse+Template+Reference) loads an HTML document from the given location and Mule moves the message back to the [HTTP Inbound Endpoint](http://www.mulesoft.org/documentation/display/current/HTTP+Connector) which simply returns the message payload as the response to an end user in the form of HTML.

### DoLoginFlow

This flow manually validates the username and password. For a real use case use [Mule Security](http://www.mulesoft.org/documentation/display/current/Configuring+Security) instead.

This flow receives only POST requests as specified in the HTTP Inbound Endpoint. Then the message is [logged in](http://www.mulesoft.org/documentation/display/current/Logger+Component+Reference) to the console to inform about the user attempting to log in. 

The following Filter component tests whether the credentials are valid. In this simple case, only *mule/mule* pair is valid. If the login is successful, then the corresponding message is set as a payload using [Parse Template component](http://www.mulesoft.org/documentation/display/current/Parse+Template+Reference). 

If the login failed, the processing is routed to the Catch Exception Strategy block that is responsible for setting the return code and message. The message is generated by parsing the predefined template. 

Finally, Mule moves the message back to the [HTTP Inbound Endpoint](http://www.mulesoft.org/documentation/display/current/HTTP+Connector) which simply returns the message payload as the response to an end user.

### CallLoginFlowUsingRequester

This flow is responsible for filling in the correct credentials and calling **DoLoginFlow** flow in order to make a successful login. It starts with an [HTTP Inbound Endpoint](http://www.mulesoft.org/documentation/display/current/HTTP+Connector) that listens at http://localhost:8081/requesterLogin.

Then, it uses an [Expression block](http://www.mulesoft.org/documentation/display/current/Expression+Component+Reference) to create a map of credentials.

Finally, the POST HTTP request is made to http://localhost:8081/login with the body containing the previously created credential map which basically fires up **DoLoginFlow** flow.
  
### Go Further

- Learn more about the [HTTP connector](http://www.mulesoft.org/documentation/display/current/HTTP+Connector).
- Learn more about [Error Handling](http://www.mulesoft.org/documentation/display/current/Error+Handling)
- Learn more about the [Filter component](http://www.mulesoft.org/documentation/display/current/Filters).
- Learn more about the [Parse Template component](http://www.mulesoft.org/documentation/display/current/Parse+Template+Reference)
