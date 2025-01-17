%dw 2.0
import * from dw::core::Strings

//------------------------------------------------------------------------------------------------//
var DEFAULT_STRING = ""
var DEFAULT_PHONE_STRING = "" 
var DATE_FORMAT = "yyyy-MM-dd"
var DATETIME_FORMAT = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

var PHONE_FORMAT = "#"
var MERGE_STRING = " "

type DefaultDateString = String { format: DATE_FORMAT }
type DefaultDateTimeString = String { format: DATETIME_FORMAT }
type PhoneNumber = String { format: PHONE_FORMAT }

//------------------------------------------------------------------------------------------------//

fun formatString(theVariable: Any) =
	if(theVariable is String)
		trim(theVariable)
	else if(theVariable is Number)
		theVariable as String
	else if(theVariable is Date)
		formatDateToString(theVariable)
	else if(theVariable is DateTime)
		theVariable as DefaultDateTimeString
	else
		DEFAULT_STRING

fun formatMaxLength(theVariable: Any, length) =
	if(theVariable is String)
		if(length > sizeOf(theVariable))
			theVariable
		else if(length == 0)
			DEFAULT_STRING	
		else
			theVariable[0 to (length - 1)]
	else
		DEFAULT_STRING

fun formatPhoneNumber(theVariable: Any) = 
	if(theVariable is String)
		if((theVariable replace /(\D+)/ with "") != "")
			((theVariable replace /(\D+)/ with "") as Number as PhoneNumber)
		else
			DEFAULT_PHONE_STRING		
	else
		DEFAULT_PHONE_STRING

fun formatDateToString(theVariable: Any) =
	if(theVariable is Date)
		theVariable as DefaultDateString
	else if(theVariable is DateTime)
		theVariable as DefaultDateString
	else if(theVariable is String)
		(theVariable as Date) as DefaultDateString
	else
		null


fun mergeFields(field1: Any, field2: Any) =
	mergeFields(field1, field2, MERGE_STRING)
 
 fun mergeFields(field1: Any, field2: Any, mergeString: String) =
	if(field1 is String and field2 is String)
		trim((field1 default "") ++ mergeString ++ (field2 default ""))
	else
		DEFAULT_STRING