fun formatDateTimes(record) =
    record mapObject (value,key,index) -> { 
        (key) : formatStringtoDateTime(value)
    }
    
fun formatStringtoDateTime(theVariable: Any) =
    if((theVariable is String) and (theVariable matches /\d\d\d\d\-\d\d\-\d\d/))
        theVariable as Date default theVariable
    else if(theVariable is String)
        theVariable as DateTime default theVariable
    else
        theVariable
        
        
fun generateResponseObject(value, index, object_name, recieved_record) =
	{
		salesforceId: value.id,
		objectName: object_name,
		success: value.successful,
		error: value.payload.errors[0].message default (value.errors[0].message default null),
		inputRequest: recieved_record
	}