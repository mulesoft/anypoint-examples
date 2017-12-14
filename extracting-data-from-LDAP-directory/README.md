# Importing data from an LDAP Directory

This example illustrates how to connect to an LDAP directory in Mule and retrieve a list of users stored in it. 

### LDAP

The Lightweight Directory Access Protocol (LDAP), is a public standard that facilitates distributed directories (such as network user privilege information) over the Internet Protocol (IP). The many available LDAP servers include free-use open source projects. Please note that the LDAP server comes bundled with Mac OS while, it may have to be downloaded and configured for your Windows machine.

### Assumption

This document describes the details of the example within the context of **Anypoint™ Studio**, Mule ESB’s graphical user interface (GUI). Where appropriate, the XML configuration is provided.

This document assumes that you are familiar with Mule ESB and the [Anypoint Studio interface](http://www.mulesoft.org/documentation/display/current/Anypoint+Studio+Essentials). To increase your familiarity with Mule Studio, consider completing one or more [Anypoint Studio Tutorials](http://www.mulesoft.org/documentation/display/current/Basic+Studio+Tutorial). Further, this example assumes that you have a basic understanding of [Mule flows](http://www.mulesoft.org/documentation/display/current/Mule+Application+Architecture) and [Mule Global Elements](http://www.mulesoft.org/documentation/display/current/Global+Elements).

### Example Use Case

The example application connects to the LDAP directory and retrieves a list of LDAP users. 

### Set Up and Run the Example 

1. Setup LDAP on your machine
   * For Windows: Install OpenLDAP from [http://www.openldap.org](http://www.openldap.org/).
   * For MacOS: OpenLDAP comes bundled with MacOS, so no need to download LDAP.
   
2. Install Apache Directory Studio from [http://directory.apache.org/studio/downloads.html](http://directory.apache.org/studio/downloads.html).
 
3. Navigate to *etc\openldap\slapd.conf* in your OpenLDAP installation directory and set rootpw in **BDB database definitions** section to *root*. You may also need to encrypt the password using the following command before adding it to the slapd.conf file:
		
		slappasswd -h {SHA} -s <password>
   
4. Start the LDAP server
   * For Windows: Enter **libexec\StartLDAP.cmd** in the command line.
   * For MacOS: Enter **sudo /usr/libexec/slapd -d 255**
    
5. Start Apache Directory Studio and create a new connection, **File > New ... > LDAP Connection** using following setup:

		name		local LDAP
		hostname	localhost
		port		389

	Click *Check network parameter*. if the test is not succesful, your ldap server is not running, otherwise click *Next*.
	
6. Set *Bind dn or user* to *cn=Manager,dc=my-domain,dc=com* and *Bind password* to *root*. Click *Check Authentication* to verify the connection. Click *Finish*.

7. Click **File > Import... > LDIF into LDAP** and then click *Next*. 

8. Set a path to *ldap.ldif* located in the *scr/main/resources* directory of this project. Set *Import into* to *local LDAP*. Click Finish to finish the import process. 

9. If you click on ROOT DSE in the panel LDAP browser, you should see the imported data structure.

10. Open the Example project in Anypoint Studio from [Anypoint Exchange](http://www.mulesoft.org/documentation/display/current/Anypoint+Exchange).
11. In your application in Studio, click the **Global Elements** tab. Double-click the HTTP Listener global element to open its **Global Element Properties** panel. Change the contents of the **port** field to required HTTP port e.g. 8081

12. Double-click on ldap.xml under src/main/app directory and open *Global Elements* tab. Open LDAP configuration and fill in these values if you strictly followed the instructions:

		Principal DN	cn=Manager,dc=my-domain,dc=com
		Password		root
		URL 			ldap://localhost:389/dc=my-domain,dc=com

13. Run it as Mule Application.

14. Open your browser and type *http://localhost:8081/* in the address bar.

15. You should see three user records in response:
```
[
    {
        "dn": "cn=admin,ou=people",
        "sn": "admin",
        "cn": "admin",
        "objectclass": [
            "top",
            "person"
        ],
        "userpassword": "mmcadmin"
    },
    {
        "dn": "cn=testuser1,ou=people",
        "sn": "testuser1",
        "cn": "testuser1",
        "objectclass": [
            "top",
            "person"
        ],
        "userpassword": "testuser1123"
    },
    {
        "dn": "cn=mmc,ou=people",
        "sn": "mmc",
        "cn": "mmc",
        "objectclass": [
            "top",
            "person"
        ],
        "userpassword": "mmc123"
    }
]
```
### How it Works 

An [HTTP endpoint](http://www.mulesoft.org/documentation/display/current/HTTP+Connector) is responsible for listening to incoming HTTP requests and sending the response. The [LDAP Connector](http://www.mulesoft.org/connectors/ldap-connector) performs the search operation with the given search parameters.

The following steps outline the process to build this application:

1. Create a new Mule Project by going to **File > New... > Mule Project** and name it **Importing data from an LDAP Directory**.
2. Drag an **HTTP listener** into a new flow. This is an inbound endpoint for your proxy application and receives all the requests that reference its address. 
3. Click on the plus sign next to the Connector Configuration field. A dialogue for creating HTTP Listener Configuration will be displayed. Fill in:

		Host 	localhost
		Port 	8081 
   Click Ok button.	
2. Set *Path* attribute to */* value.		
3. Drag **Search operation of LDAP connector**. Add a LDAP Configuration. Configure it as follows:

		Principal DN	cn=Manager,dc=my-domain,dc=com
		Password		root
		Url 			ldap://localhost:389/dc=my-domain,dc=com
		 
	Test the connection to see if the connection parameters are correct.
	
4. Configure **Search operation** added in the previous step as follows:

		Base DN 	ou=people
		Filter 		(objectClass=*)
		 
5. Build JSON response using Set Payload message processor.
6. Having completed a flow, you can hit the HTTP endpoint to see all the users stored in the LDAP system in the given domain.