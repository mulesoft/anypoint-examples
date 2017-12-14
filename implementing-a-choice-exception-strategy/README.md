# Implementing a Exception Strategy

This example illustrates the concept of error handling in mule. This particular example deals with exception strategy.

### Example use case

The example represents reading CSV file with error handling for invalid path or denied access to the file using by appropriate exception.

### Set up and run the example

1. Open the Example project in Anypoint Studio from [Anypoint Exchange](http://www.mulesoft.org/documentation/display/current/Anypoint+Exchange).

2. In your application in Studio, click the **Global Elements** tab. Double-click the HTTP Listener global element to open its **Global Element Properties** panel. Change the contents of the **port** field to required HTTP port e.g. 8081

3. Run the example project as a mule application

4. Through a web browser, access the URL **http://localhost:8081** 
	
	This message throws an exception as invalid path and returns the following message:
		
		{
		  "message": "Your path is invalid"
		}

5. Go to the src/main/app folder and change relative path in xml file from **yourPath/input.csv** to absolute path for the **input.csv** file which is located to src/main/resources folder . Through a web browser, access the URL **http://localhost:8081** 
       
    This message throws no error and returns the following messsage:

		[
		  {
		    "orderId": "1",
		    "name": "T-shirt",
		    "pricePerUnit": "25.0",
		    "units": "2"
		  },
		  {
		    "orderId": "2",
		    "name": "Jacket",
		    "pricePerUnit": "40.5",
		    "units": "3"
		  }
		]

6. Go to the src/main/resources folder in File Explorer and change access to the **input.csv** file. Through a web browser, access the URL **http://localhost:8081** 
	
	This message throws an exception as access denied and returns the following message:
       
		{
		  "message": "Access to file denied"
		}

### Go further
       
 * Read the documentation about exception strategy [here](http://www.mulesoft.org/documentation/display/current/Choice+Exception+Strategy)
   
   

