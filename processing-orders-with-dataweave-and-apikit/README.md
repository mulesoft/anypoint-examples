# Processing Orders with DataWeave and APIkit

### Assumptions ###

This document assumes that you are familiar with Mule and the [Anypoint™ Studio interface](http://www.mulesoft.org/documentation/display/current/Anypoint+Studio+Essentials). To increase your familiarity with Studio, consider completing one or more [Anypoint Studio Tutorials](http://www.mulesoft.org/documentation/display/current/Basic+Studio+Tutorial). Further, this example assumes that you have a basic understanding of [Mule flows](http://www.mulesoft.org/documentation/display/current/Mule+Application+Architecture), [Mule Global Elements](http://www.mulesoft.org/documentation/display/current/Global+Elements), and Studio's [Anypoint DataWeave](https://developer.mulesoft.com/docs/display/current/DataWeave+Reference+Documentation). 

This document describes the details of the example within the context of Anypoint Studio, Mule ESB’s graphical user interface, and includes configuration details for XML Editor where relevant.  

### Example Use Case ###

This example application illustrates how to use Anypoint DataWeave to process an order by looking up some information from an external API. It also shows how to expose that external API by using APIkit. As part of the order processing, some filters and transformations are applied to the order and a final report is created.

#### Run the Example Application ####

1. Open the Example project in Anypoint Studio from [Anypoint Exchange](http://www.mulesoft.org/documentation/display/current/Anypoint+Exchange). *Do not run the application*.
2. In your application in Studio, click the **Global Elements** tab. Double-click the HTTP Listener global element to open its **Global Element Properties** panel. Change the contents of the **port** field to required HTTP port e.g. 8081
3. This project includes a sample XML file, called orders.xml, that you can use to witness end-to-end functionality of the application. In the **Package Explorer**, click the *src/main/resources* folder to expand it, then find the *orders.xml* file inside this folder. 
4. Navigate to src/main/app/books.xml and check "Read From Xml File" , "Write To Json File" and "Write Report To Csv File" file components and in File Path field point to the attributable files located in src/main/resources folder. 
5. The File Endpoint in the application polls the input folder every ten seconds. It picks up the XML file, processes it, then deposits the JSON output and a CSV report into the output folder in the same directory.
6. The API consumed is exposed in *currency.xml* configuration file by using APIkit and a Parse Template component to build the response.

### Documentation ###

Studio includes a feature that enables you to easily export all the documentation you have recorded for your project. Whenever you want to share your project with others outside the Studio environment, you can export the project's documentation to print, email, or share online. Studio's auto-generated documentation includes:

- A visual diagram of the flows in your application
- The XML configuration which corresponds to each flow in your application
- The text you entered in the Documentation tab of any building block in your flow

Follow the [procedure](http://www.mulesoft.org/documentation/display/current/Importing+and+Exporting+in+Studio#ImportingandExportinginStudio-ExportingStudioDocumentation) to export auto-generated Studio documentation.

### Go Further ###

- Learn more about the [Anypoint DataWeave](https://developer.mulesoft.com/docs/display/current/DataWeave+Reference+Documentation).
- Learn more about [APIkit](http://www.mulesoft.org/documentation/display/current/APIkit) by following the [APIkit Tutorial](http://www.mulesoft.org/documentation/display/current/APIkit+Tutorial).
