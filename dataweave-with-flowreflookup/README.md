# DataWeave with flowref lookup 

This application uses pre-packaged tools to append data to a message payload and perceptively connect with Salesforce. The example takes a CSV file of new account information, figures out which region each account belongs to, appends region information to the payload, then uploads the new accounts to an active Salesforce user account. It uses Mule DataSense and Anypoint DataWeave to map and transform data, thereby facilitating quick integration with this Software as a Service (SaaS) provider.

#### Connect with Salesforce ####

At times, you may find that you need to connect one or more of your organization's on-premise systems with a SaaS application such as Salesforce. Ideally, these independent systems would talk to each other and share data to enable automation of end-to-end business processes. Use Mule applications to facilitate communication between your on-prem system(s) and Salesforce. (Though this use case does not extend as far, you can also use Mule to facilitate communication between SaaS providers.)

#### DataWeave and FlowRefLookup ####

Beyond transforming and mapping data from one format to another, you can use an Anypoint DataWeave Transformer to access other flows in a Mule application to acquire additional information. Use a flow lookup to acquire information outside the message, then append it to the payload.

### Assumptions ###

This document assumes that you are familiar with Mule and the [Anypoint™ Studio interface](http://www.mulesoft.org/documentation/display/current/Anypoint+Studio+Essentials). To increase your familiarity with Studio, consider completing one or more [Anypoint Studio Tutorials](http://www.mulesoft.org/documentation/display/current/Basic+Studio+Tutorial). Further, this example assumes that you have a basic understanding of [Mule flows](http://www.mulesoft.org/documentation/display/current/Mule+Application+Architecture), [Mule Global Elements](http://www.mulesoft.org/documentation/display/current/Global+Elements), and Studio's [Anypoint DataWeave](https://developer.mulesoft.com/docs/display/current/DataWeave+Reference+Documentation). 

This document describes the details of the example within the context of Anypoint Studio, Mule ESB’s graphical user interface, and includes configuration details for XML Editor where relevant.  

### Example Use Case ###

The use case upon which this example is based represents a reasonably common requirement to upload new account information into Salesforce. From a CSV file containing information about new accounts (company name, billing address, etc.), a user wishes to use the addresses of the companies to determine to which sales region they belong, then upload all the account details – including sales region – to Salesforce. This example application performs these actions using one Mule application.

### Set Up and Run the Example ###

Complete the following procedure to create, then run this example in your own instance of Anypoint Studio. Skip ahead to the next section if you prefer to simply examine this example.

To witness end-to-end functionality, you must have an active Salesforce account into which you don't mind inserting a new custom field for "region" and two sample accounts. After this application automatically uploads these accounts, you can manually delete them, and the custom field, in your Salesforce account.

#### Create a Custom Field in Salesforce ####

1. Log in to your Salesforce account, then navigate to the **Setup** tab. Now click on **Customize -> Accounts -> Fields** under the Build section on the left side of the page.
1. Now click on **New** under the Account Custom Fields & Relationships section.
    - In Step 1 of the new field process, select **Text**, then click **Next** to continue.
    - In Step 2, enter values for your new field as per the table below, then click **Next** to continue.

	    	Field Label		Region
		    Length			50
		    Field Name		Region

1. In Step 4, check the **Account Layout** box, then click **Save**.
1. Your new field name appears followed by a double-underscore and a lowercase "c":  Region__c  This is the new field to which DataWeave will map the region data it acquires from another flow.

#### Create the Example Application ####

1. Open the Example project in Anypoint Studio from [Anypoint Exchange](http://www.mulesoft.org/documentation/display/current/Anypoint+Exchange). *Do not run the application*.
1. Log in to your Salesforce account. From your account menu (your account is labeled with your name), select **Setup**.
1. In the left navigation bar, under the **Personal Setup** heading, click to expand the **My Personal Information** folder. 
1. Click **Reset My Security Token**. Salesforce resets the token and emails you the new one.
1. Access the email that Salesforce sent and copy the new token onto your local clipboard.
1. In your SaaS Integration application in Mule Studio, click the **Global Elements** tab. 
1. Double-click the Salesforce global element to open its **Global Element Properties** panel. In the **Security Token** field, paste the new Salesforce token you copied from the email. Alternatively, configure the global element in the XML Editor.
1. Change the contents of the **Username** and **Password** fields to your account-specific values, then click **OK** to save your changes. 
1. This project includes a sample CSV file, called *companies.csv*, that you can use to witness end-to-end functionality of the application. In the Package Explorer, click the src/main/resources folder to expand it, then find the contacts.csv file inside this folder.
1. Double-click the **File Config** option in the Global Elements tab and set the Working Directory field to point to src/main/resources folder.

#### Run the Example Application ####

1. In the Package Explorer, right-click the *dataweave-with-flow-reference* project name, then select Run As > Mule Application. Studio runs the application on the embedded server.
1. The File Endpoint in the application polls the input CSV file every ten seconds and processes it.
1. In your browser, access your Salesforce account, then navigate to the **Accounts** tab.
1. Use the drop-down menu to display **All Accounts,** then scan your contacts for two new entries:  
           
           - Universal Exports
           - Best Widgets

1. You should get the following output in your console window:
        
          State to lookup is: FL
          INFO  2014-07-22 12:36:45,800 [REFORMAT0_0] org.mule.api.processor.LoggerMessageProcessor: Region is : South East
          State to lookup is: CA
          INFO  2014-07-22 12:36:45,804 [REFORMAT0_0] org.mule.api.processor.LoggerMessageProcessor: Region is : West Coast

1. Stop the Mule application by clicking the square, red terminate button in the **Console**.
1. Delete the two sample accounts from your Salesforce account.
1. Delete the custom field, Region, from your Salesforce account.

### How it Works ###

Using two flows, this application accepts CSV files which contain account information, uses the "state" data to append a sales region to the message, then uploads the contacts to Salesforce. 

#### CreateNewSalesforceAccountFlow ####

The Scheduler component triggers the **CreateNewSalesforceAccountFlow** every ten seconds. The [File Component](http://www.mulesoft.org/documentation/display/current/File+Connector) reads the input CSV file and passes its content to the [Anypoint DataWeave Transformer](https://developer.mulesoft.com/docs/display/current/DataWeave+Reference+Documentation). The Transformer converts the format of the data from CSV to a collection and maps the input fields from the CSV file – company_name, company_address, etc. – to output fields that Salesforce uses in a collection.

The DataWeave also utilizes a flow lookup. Flow lookup accesses another flow in the application to acquire the sales region for each new account. DataWeave invokes the **LookupSalesRegionFlow** which uses the company_state data to determine into which sales region the account falls. DataWeave then maps this newly acquired data to the custom field in Salesforce, Region__c.

When it has converted all the account information in the file to a collection of Salesforce-friendly data, the application uses a [Salesforce Connector](http://www.mulesoft.org/documentation/display/current/Salesforce+Connector) to push data into your Salesforce account. The connector's configurations specify the **operation** – *Create* – and the **sObject** type – *Account* – which dictate exactly how the data uploads to Salesforce; in this case, it creates new accounts. 

#### LookupSalesRegionFlow ####

This flow consists of a [Groovy](http://www.mulesoft.org/documentation/display/current/Groovy+Component+Reference) component and a [Logger](http://www.mulesoft.org/documentation/display/current/Logger+Component+Reference).  The script in the component uses state information in the message payload to calculate the sales region to which the account belongs. Invoked by the flow lookup in DataWeave, this flow exists only to determine a sales region for each account in the CSV file.

### Documentation ###

Studio includes a feature that enables you to easily export all the documentation you have recorded for your project. Whenever you want to share your project with others outside the Studio environment, you can export the project's documentation to print, email, or share online. Studio's auto-generated documentation includes:

- A visual diagram of the flows in your application
-     The XML configuration which corresponds to each flow in your application
-     The text you entered in the Documentation tab of any building block in your flow

Follow the [procedure](http://www.mulesoft.org/documentation/display/current/Importing+and+Exporting+in+Studio#ImportingandExportinginStudio-ExportingStudioDocumentation) to export auto-generated Studio documentation.

### Go Further ###

- Learn more about [Connection Testing](http://www.mulesoft.org/documentation/display/current/Testing+Connections) and [DataSense](http://www.mulesoft.org/documentation/display/current/DataSense).
- Learn more about the [Anypoint DataWeave](https://developer.mulesoft.com/docs/display/current/DataWeave+Reference+Documentation).