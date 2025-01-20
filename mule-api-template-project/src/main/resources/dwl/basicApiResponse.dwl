%dw 2.0
output application/json
var requestStartTime = (if(vars.requestStartTime != null) vars.requestStartTime else "Request Start Time could not be determined")
---
{	
	"success": true,
	"apiName": app.name,
	"apiVersion": vars.apiVersion default "",
	"transactionId": correlationId,
	"timestamp": now() as String { format: "yyyy-MM-dd'T'HH:mm:ss" },
	"payload": payload
	
}


