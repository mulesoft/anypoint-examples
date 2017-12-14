# Import contacts into Salesforce
### Enterprise, CloudHub ####

This application uses pre-packaged tools to intelligently connect with Salesforce. Based on a simple use case, the application takes a CSV file of contacts and uploads the contact information to an active Salesforce user account. It uses DataSense and Anypoint DataWeave to map and transform data, thereby facilitating quick integration with this Software as a Service (SaaS) provider.

### Connect with Salesforce ###

At times, you may find that you need to connect one or more of your organization's on-premises systems with a SaaS such as Salesforce. Ideally, these independent systems would talk to each other and share data to enable automation of end-to-end business processes. Use Mule applications to facilitate communication between your on-prem system(s) and Salesforce. (Though this use case does not extend as far, you can also use Mule to facilitate communication between SaaS providers).

### Assumptions ###

This document assumes that you are familiar with Mule and the [Anypoint™ Studio interface](http://www.mulesoft.org/documentation/display/current/Anypoint+Studio+Essentials). To increase your familiarity with Studio, consider completing one or more [Anypoint Studio Tutorials](http://www.mulesoft.org/documentation/display/current/Basic+Studio+Tutorial). Further, this example assumes that you have a basic understanding of [Mule flows](http://www.mulesoft.org/documentation/display/current/Mule+Application+Architecture), [Mule Global Elements](http://www.mulesoft.org/documentation/display/current/Global+Elements), and [Anypoint DataWeave](https://developer.mulesoft.com/docs/display/current/DataWeave+Reference+Documentation).

This document describes the details of the example within the context of Anypoint Studio, Mule ESB’s graphical user interface, and includes configuration details for XML Editor where relevant. 

### Example Use Case ###

Though a simple example, this application nonetheless employs complex functionality to demonstrate a basic use case. The application accepts CSV files which contain contact information – name, phone number, email – and uploads them into a Salesforce account, automatically inserting the correct data into each Salesforce field. 

### Set Up and Run the Example ###

Complete the following procedure to create, then run this example in your own instance of Anypoint Studio. Skip ahead to the next section if you prefer to simply examine this example via code snippets.

1. Open the Example project in Anypoint Studio from [Anypoint Exchange](http://www.mulesoft.org/documentation/display/current/Anypoint+Exchange). *Do not run the application*.
1. Log in to your Salesforce account. From your account menu (your account is labeled with your name), select **Setup**.
1. In the left navigation bar, under the **Personal Setup** heading, click to expand the **My Personal Information** folder. 
1. Click **Reset My Security Token**. Salesforce resets the token and emails you the new one.
1. Access the email that Salesforce sent and copy the new token onto your local clipboard.
1. In your application in Studio, click the **Global Elements** tab. 
1. Double-click the **Salesforce Sfdc config** global element to open its **Global Element Properties** panel. In the **Security Token** field, paste the new Salesforce token you copied from the email. Alternatively, configure the global element in the XML Editor.
1. Change the contents of the **Username** and **Password** fields to your account-specific values, then click **OK** to save your changes. 
1. This project includes a sample CSV file, called *contacts.csv*, that you can use to witness end-to-end functionality of the application. In the **Package Explorer**, click the *src/main/resources* folder to expand it, then find the *contacts.csv* file inside this folder.
1. Double-click the **File config** tab in the **Global Elements** tab and set the Working Directory field to point to *src/main/resources* folder.
1. In the **Package Explorer**, right-click the import-contacts-into-salesforce project name, then select **Run As > Mule Application**. Studio runs the application on the embedded server.  
1. The File connector in the application polls the input folder every ten seconds. It picks up the CSV file, processes it, then deposits it into the output folder in the same directory. (Hit **F5** to refresh the contents of the input and output folders.)
1. In your browser, access your Salesforce account, then navigate to the **Contacts** tab.
1. Use the drop-down menu to display **All Contacts**, then scan your contacts for two new entries:  
	- John Doe
	- Jane Doe
1. Stop the Mule application by clicking the square, red terminate button in the **Console**.
1. Delete the three sample contacts from your Salesforce account.

### How it Works ###

Using a single flow with three elements, this application accepts CSV files which contain contact information, then uploads the contacts to Salesforce. 

The [File connector](http://www.mulesoft.org/documentation/display/current/File+Connector) polls the input folder for new files every ten seconds. When it spots a new file, it reads it and passes the content to the [Anypoint DataWeave](https://developer.mulesoft.com/docs/display/current/DataWeave+Reference+Documentation). This transformer not only converts the format of the data from CSV to a collection, it automatically maps the input fields from the CSV file – FirstName, LastName, etc. – to output fields that Salesforce uses in a collection. When it has converted all the contacts in the file to a collection of Salesforce-friendly data, the application uses a [Salesforce Connector](http://www.mulesoft.org/documentation/display/current/Salesforce+Connector) to push data into your Salesforce account. The connector's configurations specify the **operation** – *Create* – and the **sObject type** – *Contact* – which dictate exactly how the data uploads to Salesforce; in this case, it creates new contacts. 

While the application's functionality is relatively straightforward, the beauty of this project is illustrated through its use of [DataSense](http://www.mulesoft.org/documentation/display/current/DataSense). Rather than building the application serially – adding, then configuring each of the elements manually according to the order in which they appear in the flow– you can use DataSense to complete the most difficult configurations automatically.

### Documentation ###

Studio includes a feature that enables you to easily export all the documentation you have recorded for your project. Whenever you want to share your project with others outside the Studio environment, you can export the project's documentation to print, email or share online. Studio's auto-generated documentation includes:

- A visual diagram of the flows in your application
- The XML configuration which corresponds to each flow in your application
- The text you entered in the Notes tab of any building block in your flow

Follow [the procedure](http://www.mulesoft.org/documentation/display/current/Importing+and+Exporting+in+Studio#ImportingandExportinginStudio-ExportingStudioDocumentation) to export auto-generated Studio documentation.

### Go Further ###

- Learn more about [Connection Testing](http://www.mulesoft.org/documentation/display/current/Testing+Connections) and [DataSense](http://www.mulesoft.org/documentation/display/current/DataSense).
- Learn more about [Anypoint DataWeave](https://developer.mulesoft.com/docs/display/current/DataWeave+Reference+Documentation).
