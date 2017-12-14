# Querying a DB and attaching results to an Email

This example application shows you how to query a MySQL database, aggregate the query results, transform the result into CSV format and send it as an attachment via email.

### Example use case
The XML data containing employee names is sent to the application using the HTTP POST method. The ForEach component then queries the MySQL DB individually for employee details. The result of each query is aggregated into a List. This List is then transformed to a CSV format and attached as a CSV file to an email which is sent using SMTP.

### Set up and run the example

1. Open the Example project in Anypoint Studio from [Anypoint Exchange](http://www.mulesoft.org/documentation/display/current/Anypoint+Exchange). 

1. In your application in Studio, click the **Global Elements** tab. Double-click the HTTP Listener global element to open its **Global Element Properties** panel. Change the contents of the **port** field to required HTTP port e.g. 8081
1. Start the MySQL server on your machine and create a connection by navigating to your mysql home directory and using the following command:
                  
        mysql  -u root -p

1. Now, run **db_script.sql** which is placed under src/test/resources to create a DB schema *company* and table *employees*

1. Click on the SMTP connector and **configure its properties** as follows:

        Host=smtp.gmail.com
        Port=587
        User=senderemailid@gmail.com
        Password=senderpassword

        To=receiveremailid@gmail.com
        From=senderemailid@gmail.com
        Subject=Export from Excel

1. Double-click the **Database Config** global element to open its **Global Element Properties** panel. Alternatively, configure the global element in the XML Editor.
1. Change the contents of the **Host**,  **Port**, **User** and **Password** fields to your account-specific values. The field **Database** should be set to *company* to be aligned with DB script from point 4. Click **OK** to save your changes.
        
1. Now,run the mule application

1. Make a POST request using Postman to your localhost with the following xml code as the message body:

        <root>
         <employees>
          <employee>Chava Puckett</employee>
          <employee>Quentin Puckett</employee>
          <employee>Mona Sosa</employee>
         </employees>
        </root>

1. Verify that you recieved an email with the attachment which is basically a csv file of the queried employee records.

### Go further
* Read about the Database Connector [here](http://www.mulesoft.org/documentation/display/current/Database+Connector)
* Learn more about Anypoint DataWeave [here](https://developer.mulesoft.com/docs/display/current/DataWeave+Reference+Documentation)

