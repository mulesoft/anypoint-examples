# Using try scope with transactions in JMS to Database 

Mule applies the concept of transactions to operations in application for which the result cannot remain indeterminate. This example illustrates the concept of try scope with transactions (transactional scope in old versions) and rollback error handling strategy in a use case where data is sent from JMS to a MySQL DB.

### Example Use Case 
In this example the JMS endpoint listens for XML messages sent to the "in" queue. This message is logged and then inserted to a MySQL database. After the order has been inserted an error is thrown using a Script component with Groovy body. This error is handled using the On Error Propagate component which redelivers the message for a set number of times before it logs an error message. As the database connector is within the try scope, the action that inserted the order is rescinded and also next processors defined in the scope are not executed.

### Set up and run the example

1. Open the Example project in Anypoint Studio from [Anypoint Exchange](http://www.mulesoft.org/documentation/display/current/Anypoint+Exchange).

2. Start activeMQ server as well as the MySQL server and establish a connection to the database

3. Run the **import.sql** script placed under scr/main/resources to create a MySQL table

4. Run the Example project as a mule application

5. Go to the activemq web admin console at **http://localhost:8161/admin/send.jsp** and send the following message to the queue named **in**:

        <order>
	    	<itemId>1</itemId>
	    	<itemUnits>2</itemUnits>
	    	<customerId>1</customerId>
        </order>

6. The error occurs after SQL insert but if you look at the content of orders table in your DB using MySQL workbench you see that no record was inserted. This is because DB and JMS operations are in the try scope with transactions.

### Go Further
* Read about the try scope with transactions [here](http://www.mulesoft.org/documentation/display/current/Transaction+Management)
