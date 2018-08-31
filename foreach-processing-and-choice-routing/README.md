# Foreach Processing and Choice Routing

This Mule ESB example application demonstrates the power of content-based routing.

This application provides information about possible loads from banks. This example should help you to make informed decisions about using the two elements in your Mule applications listed below. 

#### Content-Based Routing ####

Mule has the ability to intelligently route a message through different processing pathways according to its content. Using a Choice Router, Mule uses an expression to evaluate a message's properties, or part of its payload, then routes it to a specific pathway (i.e. series of message processors). Content-based routing, as this activity is called, dynamically applies routing criteria to a message at runtime.

#### Foreach Processing ####

An iterative processor, Foreach splits collections into elements, then processes them iteratively without losing any of the message payload. After Foreach splits a message collection and processes the individual elements, it returns a reference to the original message thus resulting in "Java in, Java out" processing.

### Assumptions ###

This document assumes that you are familiar with Mule ESB and the [AnypointStudio interface](http://www.mulesoft.org/documentation/display/current/Anypoint+Studio+Essentials). To increase your familiarity with Studio, consider completing one or more [Anypoint Studio Tutorials](http://www.mulesoft.org/documentation/display/current/Basic+Studio+Tutorial).

This document describes the details of the example within the context of Anypoint Studio, Mule ESB's graphical user interface (GUI), and includes XML configuration details in separate tabs.

#### Example Use Case ####

This example application exposes a service that processes end user requests for information about possibility of loan from different bank. From a Web browser, an end user submits a request which contains the following:

- customer's name
- amount of the loan
- term of the loan
- customer's social security number (SSN)

The application accesses other services to process the request, then responds to the end user. The response identifies the banks which can provide a loan for customer on suggested amount, suggested term of load and calculate payment per month.

### Set Up and Run the Example ###

Follow the procedure below to create, then run the application in Mule ESB.

1. Open the Example project in Anypoint Studio from [Anypoint Exchange](http://www.mulesoft.org/documentation/display/current/Anypoint+Exchange). In the Package Explorer pane in Studio, right-click the project name, then select Run As > Mule Application. Studio runs the application and Mule is up and kicking!
1. Open your Web browser.
1. Type http://localhost:8081/?name=Muley&amount=20000&term=48&ssn=1234 into the address bar of your browser, then press enter to elicit a response from the application. 
2. In your browser's address bar, replace the amount value with 5000, then press enter to elicit a new response from the application. 

### How it Works 

This example application consists of triggerFlow which start the process to inform end user about possibility of loan from different banks:
1. Calling mocked API (GET/customerprofile endpoint) with required parameters where response provides list of bank for obtaining the load.
2. Calculating the amount of the payment for providing the load from all banks which are obtained in previous step.
3. Aggregating the result from all banks to one message for customer.    
    

#### Go Further ####

- For more information on routing messages, see [Choice Router](http://www.mulesoft.org/documentation/display/current/Choice+Flow+Control+Reference).
- For more information on iterative processing, see [Foreach](http://www.mulesoft.org/documentation/display/current/Foreach).