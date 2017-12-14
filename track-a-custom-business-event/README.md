# Track a Custom Business Event

This example shows how to track data using the custom business event component. 

### Example use case

Order data in JSON format is sent through an HTTP endpoint to a DataWeave transformer. The custom DataWeave transformation is used to calculate the discount that is offered for a certain product type. The Custom Business event keeps track of the item name, number of units and price per unit for the order data.

### Set up and run the example

1. Import the example project into your workspace

2. In your application in Studio, click the **Global Elements** tab. Double-click the HTTP Listener global element to open its **Global Element Properties** panel. Change the contents of the **port** field to required HTTP port e.g. 8081
2. **Export the project** in your workspace to a zip file using File -> Export -> Mule -> **Anypoint Studio Project to Mule Deployable Archive**

3. Sign in to [https://anypoint.mulesoft.com/accounts/#/signin](https://anypoint.mulesoft.com/accounts/#/signin)

4. Now **add the example** application in a deployable jar format **to Cloudhub** (Check out the documentation on [Deploying a CloudHub Application](http://www.mulesoft.org/documentation/display/current/Deploying+a+CloudHub+Application))

5. In the Advanced Settings tab **enable Metadata and Replay** and then **Apply changes**

5. Click on **Start** to deploy your application on Cloudhub.

7. Use Postman to make a POST request using JSON to **http://(your domain).cloudhub.io/customBusinessEvents**:

		{
		"email": "aaa@abc.sk", 
		"item name": "shoes", 
		"item units": 2, 
		"item price per unit": 10,
		"membership": "free"
		}

    The response body should contain price per unit with the applied discount (-15% for shoes):

8. Go to your Cloudhub account and click on the Insight tab in the left panel to see that your custom business event was logged.

### Go further
 
* Check out the documentation on [Business Events](http://www.mulesoft.org/documentation/display/current/Business+Events) in Mule
