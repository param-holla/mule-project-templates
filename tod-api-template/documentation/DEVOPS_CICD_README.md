# Introduction 
Manual release management processes are often inconsistent and error prone. When 
possible, a Continuous Integration (CI) tool Bitbucket Pipelines should be leveraged 
to automate the integration build and release process.

An automated CI process will provide a real-time feedback loop so that changes to 
the codebase are immediately tested and can be remedied as soon as possible. 
Automation also ensures that each build is pulling from the correct branch in the 
SCM and that all built artifacts are up to date.

A repeatable CI process can also ensure that there is traceability between SCM 
release branches, release artifacts in the Artifact Repository, and applications 
running on the Anypoint platform. CI can also perform release management activities 
to create and track release candidates. 

# Getting Started

## Mule Maven Plugin
 - https://docs.mulesoft.com/mule-runtime/4.2/mmp-concept
 
### Deploy Applications to Cloudhub

The following link provides information about the values you can provide during the
release process (example: regions, worker types, properties)

 - https://docs.mulesoft.com/mule-runtime/4.2/deploy-to-cloudhub
 
 ### Encrypt Credentials
 
 The following link provides information for the reader for encrypting credentials in
 a settings.xml file.
 
 - https://docs.mulesoft.com/mule-runtime/4.2/deploy-to-cloudhub#encrypt-credentials
 
 ## Anypoint CloudHub Setup
 
 ### Creating Anypoint Deployment User
 
 A non-SSO user needs to be created with deployment privileges. This user needs Create Applications, Read Applications and Manage Settings permissions in Runtime Manager for each environment that is included in the pipeline deployments.
 
 ![alt text](./documentation/images/anypoint_deploy_user.png)

----

# Build and Test

## Bitbucket Pipelines Documentation
   [Go to this page](DEVOPS_BITBUCKET_PIPELINES_README.md)
   
## Azure DevOps Pipelines Documentation
   [Go to this page](DEVOPS_AZURE_PIPELINES_README.md)
   
## Jenkins Pipelines Documentation
   [Go to this page](DEVOPS_JENKINS_PIPELINES_README.md)
   
## AWS Code Deploy
   TODO: Build Pipeline using AWS Code Deploy