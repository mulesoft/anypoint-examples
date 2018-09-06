# Cache Scope with Salesforce Contacts

This example illustrates the basic concept of data caching using Salesforce.

### Caching 

The very basic concept of caching consists of temporary storing a result of some operations, in our use case it is caching fetched data from Salesforce. The example illustrates caching when we ask for a data once again, the result is returned directly from cache instead of making a new call to Salesforce.  

### Prerequisites 

This document describes the details of the example within Anypoint Studio. Where appropriate, the XML configuration is provided.

This document assumes that you are familiar with Mule runtime and [About Anypoint Studio](https://docs.mulesoft.com/anypoint-studio/v/7.2/). Further, this example assumes that you have a basic understanding of [Flow and Subflow Components
](https://docs.mulesoft.com/mule4-user-guide/v/4.1/flow-component) and [Global Elements](https://docs.mulesoft.com/mule4-user-guide/v/4.1/global-elements).

### Example Use Case 

In this example, the Salesforce querying operation is encapsulated within cache scope component. Firstly the query to Salesforce is performed to fetch Contacts, next calls to Salesforce are avoided and data are returned from cache and result is printed. When the cache is used check the Anypoint Studio console while running the example.

### Set Up and Run the Example 

Complete the following procedure to create, then run this example in your own instance of Anypoint Studio. Skip ahead to the next section if you prefer to simply examine this example.

1. Open the Example project in Anypoint Studio. *Do not run the application*.
1. Log in to your Salesforce account. From your account menu (your account is labeled with your name), select **Setup**.
1. In the left navigation bar, under the **Personal Setup** heading, click to expand the **My Personal Information** folder. 
1. Click **Reset My Security Token**. Salesforce resets the token and emails you the new one.
1. Access the email that Salesforce sent and copy the new token onto your local clipboard.
1. In your application in Studio, click the **Global Elements** tab. 
1. Double-click the Salesforce global element to open its **Global Element Properties** panel. In the **Security Token** field, paste the new Salesforce token you copied from the email. Alternatively, configure the global element in the XML Editor.
1. Change the contents of the **Username** and **Password** fields to your account-specific values, then click **OK** to save your changes. 
1. In the **Package Explorer**, right-click the connect-with-salesforce project name, then select **Run As > Mule Application**. Studio runs the application on the embedded server.  
1. In your browser, access **http://localhost:8081/** and the Contacts are displayed in browser in JSON format.
2. Go back to Anypoint Studio and click the console view and search for a log similar to this one:
 	
		INFO  2018-02-01 14:44:56,781 [[MuleRuntime].cpuLight.02: [cache-scope-with-salesforce-contacts].cache-scope-with-salesforce-contactsFlow.CPU_LITE @7f8feb5] [event: 0-16100290-0756-11e8-b986-f85971bd4f61] org.mule.runtime.core.internal.processor.LoggerMessageProcessor: Querying Salesforce (not from Cache)
3. Switch to your browser and access **http://localhost:8081/** again.
4. In Anypoint Studio console search for logs to check the caching is performed. The log message, which inform you about performed call **Querying Salesforce (not from Cache)** is not in console logs.
5. The Contacts are displayed in JSON format in browser and returned from cache.
1. Stop the Mule application by clicking the square, red terminate button in the **Console**.


### How it Works

Using a single flow, this application queries Salesforce CRM for contacts and prints them in browser. From the console log you can simply check when caching is performed and you are able to play with it and experiment.

**Salesforce Connector** performs a query in your Salesforce Account: to get *Id, FirstName, LastName, Email, Phone*  attributes of Contact objects with limit set to 200 records. To keep the example simple, the caching is illustrated via logs in console and Contacts are displayed in JSON format in a browser .


### Documentation

Studio includes a feature that enables you to easily export all the documentation you have recorded for your project. Whenever you want to share your project with others outside the Studio environment, you can export the project's documentation to print, email or share online. Studio's auto-generated documentation includes:

- A visual diagram of the flows in your application
- The XML configuration which corresponds to each flow in your application
- The text you entered in the Notes tab of any building block in your flow

Follow [the procedure](https://docs.mulesoft.com/mule4-user-guide/v/4.1/how-to-export-resources#how-to-export-resource-files) to export auto-generated Studio documentation.

### See Also

- For more information on the Salesforce Connector, see [Connectors and Modules for Mule 4](Connectors and Modules (for Mule 4)).
- For more information on Batch processing, see [Batch processing](https://docs.mulesoft.com/mule4-user-guide/v/4.1/batch-job-concept).
