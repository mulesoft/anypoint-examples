# Importing a CSV file into mongoDB

This example illustrates how to use the mongoDB connector to import data in a CSV format from a local directory into mongoDB. This examples also covers other important components in the studio including DataWeave, Choice and Foreach.

### Assumption
This document describes the details of the example within the context of Anypoint Studio, Mule ESB™s graphical user interface (GUI). This document assumes that you are familiar with Mule ESB and the [Anypoint Studio interface](http://www.mulesoft.org/documentation/display/current/Anypoint+Studio+Essentials).

### Example Use Case
In this example we transform a sample CSV file containing sales data to JSON format. We use the DataWeave transformer to do so. This JSON contains basically a collection called customers. We now use the mongoDB connector to check if such a collection exists in the database. The result is stored in variable *collectionExists*. This variable is consequently used by the choice router to decide whether to route to a mongoDB connector that creates a collection or just use the default option. The last mongoDB connector embedded in the For Each scope, saves the object from the map, iteratively for each of the elements in the collection.

### Set Up and Run the Example


1.  **Download** [mongoDB](http://www.mongodb.org/downloads) and [install](http://docs.mongodb.org/manual/installation/) it. If you are are running a linux based OS, Homebrew is an easy way to install mongoDB.

1.  **Run mongoDB**             
   
   1.  Make sure that you have created */data/db* in your filesystem according to  installation instructions
   1. Now open two instances of the command terminal. In the first window start the mongoDB server by navigating to *mongodb install path/bin* and then typing in *mongod*. You should get the following message when your server is up and running:
   
        2014-07-01T16:15:25.282-0700 [initandlisten] waiting for connections on port 27017

   1. In the second window run mongoDB by navigating to *mongodb install path/bin* and typing in *mongo*. You should get the following message when you are connected.
         
         MongoDB shell version v3.4.9


1.  Stay in the second command terminal window and use the following commands to **create a database** and a user called mule who is granted permission to access the database:  
	     
	```
	use customers
    db.createUser
    (
     {
	user: "mule",
	pwd: "mule",
	roles:
	  [
       {
    	role: "userAdmin",
    	db: "admin"
       }
      ]
     }
    )


1.  Open the Example project in Anypoint Studio from [Anypoint Exchange](http://www.mulesoft.org/documentation/display/current/Anypoint+Exchange).

1. Go to **Global Elements** and set the recently created user "mule" with password "mule" and database name "customers" for the Mongo DB connector.

1. This project includes a sample CSV file, called *input.csv*, that you can use to witness end-to-end functionality of the application. In the **Package Explorer**, click the *src/main/resources* folder to expand it, then find the *input.csv* file inside this folder.
1. In the **Global Elements** double-click the **File config** tab and set the Working Directory field to point to *src/main/resources* folder.

1. **Run** the example project as a mule application

1. **Go to the mongoDB console** (the second command terminal window) and type:
	
	db.customers.find()
	
The output then shows the inserted objects similar to  what is below.


    > db.customers.find()
    { "_id" : ObjectId("53b2518b03643b83cf1cecde"), "firstname" : "aaa", "surname" :      "vbbb", "phone" : "ccc", "state" : "sss" }

### Go Further
* Read more about the mongoDB connector [here](https://docs.mulesoft.com/mule-user-guide/v/4.0/mongodb-connector)
* Read more about the For Each connector [here](http://www.mulesoft.org/documentation/display/current/Foreach)
* Learn more about Anypoint DataWeave [here](https://developer.mulesoft.com/docs/display/current/DataWeave+Reference+Documentation)
