%dw 2.0
output application/json
---
{	
	"status" : (
		if(isEmpty(vars.healthStatus) or
			(!(vars.healthStatus.status contains "DOWN"))) 
		"OK"
		else if ((vars.healthStatus.status contains "UP") and
            (vars.healthStatus.status contains "DOWN"))
		 "DEGRADED"
		else "OFFLINE"
	),
	"apiName": app.name,
	"apiVersion": vars.apiVersion default "",
	"transactionId": correlationId,
	"timestamp": now() as String { format: "yyyy-MM-dd'T'HH:mm:ss" },
	("dependencies": vars.healthStatus) if(!isEmpty(vars.healthStatus))
	
}

