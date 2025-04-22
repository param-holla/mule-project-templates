%dw 2.0
output application/json
var errorDetails = error.exception.errorMessage.payload
---
{	
	"success": errorDetails.success default false,
	"apiName": errorDetails.apiName default app.name,
	"apiVersion": errorDetails.apiVersion default vars.apiVersion default "",
	"transactionId": errorDetails.transactionId default correlationId,
	"timestamp": errorDetails.timestamp default now() as String { format: "yyyy-MM-dd'T'HH:mm:ss" },
	"errors": errorDetails.errors map (
		{
		errorType: $.errorType default (error.errorType.namespace ++ ":" ++ error.errorType.identifier),
		errorCode: vars.httpStatus,
		errorMessage: $.message default error.description
		}
	)
	
}