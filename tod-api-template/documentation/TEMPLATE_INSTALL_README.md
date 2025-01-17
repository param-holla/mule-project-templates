# Download the API Template
- Download the API template from this BitBucket repo to get the most up to date version
- unzip the file if needed

# Create a New Project
- Open Anypint Studio
- Right click in Package Explorer -> Import
- Choose Anypoint Studio project from File System
- Find the template project
- Enter the API Project Name using our [MuleSoft Best Practices](https://sites.google.com/tractionondemand.com/ada--consulting-services/practices/mulesoft-practice/mulesoft-resources/mulesoft-best-practices) 
- Uncheck Copy project into workspace if you copied the project into your workspace

# Modifications

## .git folder
- Delete the .git folder to detach from this repository

## pom.xml
- Open the pom.xml file
- Modify the <artifactId> & <name> to match your project name
- Save & Close

## keystore.jks
- [Setup your own keystore and replace the existing one](http://docs.continuent.com/tungsten-replicator-2.1/deployment-ssl-stores.html#deployment-ssl-stores-own)

## properties files
- Replace the http.keystore.password variable with your new password using encryption protocol
- [How to use MuleSoft encryption](https://docs.mulesoft.com/mule-runtime/4.2/secure-configuration-properties)

## Set the runtime env & runtime key variables
The application will run with the global properties set in global.xml. It is best practices to remove them and set them as environment variables.
- [MuleSoft Confihure Properties Documentation](https://docs.mulesoft.com/mule-runtime/4.3/configuring-properties)

- property.env=local
- property.key=mulemulemulemule

