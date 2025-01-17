//Takes the user from the postgres DB and builds a Salesforce Account object
fun transformUserToAccount(user) = 
using(address = (user.address splitBy ",") default null)
{
	"User_ID__c": user.userID as String,
	"Name": user.firstName ++ " " ++ user.lastName,
	"Phone": formatPhoneNumber(user.phone), //Remove all special characters from phone number.
	"Email__c": user.email,
	"BillingStreet": trim(address[0]),
	"BillingState": trim(address[2]),
	"BillingCity": trim(address[1]),
	"BillingPostalCode": trim(address[3])
}

//Removes anything that is not an alphanumeric character
fun removeSpecialCharacters(string) = string replace /[^0-9a-zA-Z]/ with ""

//removes all non-numeric characters from a phonenumber string
fun formatPhoneNumber(phoneNumber) = phoneNumber replace /[^0-9xX]/ with ""