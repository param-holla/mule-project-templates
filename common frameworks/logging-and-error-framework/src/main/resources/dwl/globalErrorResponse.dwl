%dw 2.0
output application/json
var requestStartTime = (if(vars.requestStartTime != null) vars.requestStartTime else "Request Start Time could not be determined")
---
{	
	transactionId: "",
	errorTimeStamp: now() as String { format: "yyyy-MM-dd'T'HH:mm:ss" },
	"details": [{
		errorType: error.errorType.identifier,
		errorCode: vars.httpStatus,
		errorMessage: error.description
	}]
	
}