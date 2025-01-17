# HTTPS
When creating an HTTP Listener, select HTTPS & use the prebuilt TLS configuration to use Https
Note: Postman & API Browsers do not like self sign certification, you will need to remove the SSL Certificate Verification in the General Options

# Secure Properties
Review this guide for using secure properties for all passwords or important fields

# Mask Properties in Runtime Manager
Add to the secureProperties list under mule-artifact.json to mask the properties to secure non-encrypted password

# Configuration Files
Setup your properties for the specific environments and quickly change the runtime.env property to deploy the same artifact for different environments on runtime manager