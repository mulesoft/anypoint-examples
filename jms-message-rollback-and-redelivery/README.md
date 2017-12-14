# JMS Rollback and Redelivery
This example shows how to implement jms rollback and redelivery within the Anypoint Studio. The JMS connectors in this example are configured to the activeMQ MOM.

### Assumption
This document assumes that you are familiar with Mule ESB and the [Anypoint Studio interface](http://www.mulesoft.org/documentation/display/current/Anypoint+Studio+Essentials). Further, this example assumes that you have [Apache Maven](http://maven.apache.org/download.cgi) and [ActiveMQ](http://activemq.apache.org/getting-started.html) running on your machine.

### Example Use Case
In this example there is a JMS message in transaction inside Anypoint Studio which throws an exception. This message is then handled by the On Error Propagate Component, which rollbacks and retries to deliver the same message. After an specific number of unsuccessful attempts to commit (4 in this case), it sends the message successfully.

### Set Up and Run the Example

1. **Open the example application** in Anypoint Studio. Do not run the application yet.

2. **Start the ActiveMQ server**
      * Navigate to the activeMQ home directory in the command terminal and then use the  following command to start the activeMQ server
      
            bin/activemq start 

      * You should get a message that is similar to the one shown below in your command terminal when your activeMQ server is running
     
            INFO: Using java '/System/Library/Frameworks/JavaVM.framework/Home/bin/java'
            INFO: Starting - inspect logfiles specified in logging.properties and log4j.properties to get details
            INFO: pidfile created : . . . 
    
3. Check if **activemq-all-5.10.0.jar** is configured to the java build path. Else, if you are running a different version of activeMQ you will need to manually configure this. You can do so by following these steps:
  
    * Configure the project build path by adding the activeMQ jar file to the project folder. 
    * Right click on the project folder in the Package Explorer, then click on Properties/Java Build Path. Under the Libraries tab, click on Add External Jar.
    * Now browse to the ActiveMQ home directory and add the jar file named activemq-all-5.10.0.jar (The activeMQ version at the time of building this documentation was 5.10.0). Click on Open/Ok to do so.

4. In the Package Explorer, right-click on the project, then select Run As/Mule Application. Studio runs the application on the embedded server.

   Your Mule application is now running!
   
5. Now login to the activeMQ admin console at **http://localhost:8161/admin/send.jsp** with the default username and password admin. Type "in" in the field marked Destination and then click on Send. 

6. The transaction will fail with "Exception" the first four attempts (to simulate an error condition), and then the message will be delivered correctly.

7. Search for "topic1" in **http://localhost:8161/admin/topics.jsp** and notice that the number under the Messages Enqueued column has increased by 1. This verifies that the message has been delivered correctly and the transaction was successful.

8. Try removing the "maxRedelivery" settings from the Active MQ connector configuration. Now the transaction will fail in the second attempt due.

### Go Further
* [Documentation entry](http://www.mulesoft.org/documentation/display/current/ActiveMQ+Integration) on Active MQ Integration for more details on Active MQ available configurations with Mule.
