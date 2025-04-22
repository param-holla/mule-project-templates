import * from dw::core::Strings
fun camelizeKeys(data) = 
	data map (record, index) ->
		record mapObject (value, key, index2) ->
			(camelize(key)): value
			

fun generateFields(objectArray) =  
((objectArray flatMap(v, i) -> keysOf(v)) distinctBy $) map(v, i) -> capitalize(v) replace " " with ""
fun getFieldList(objectArray) = 
((objectArray flatMap(v, i) -> keysOf(v)) distinctBy $)
			
			
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
        
        