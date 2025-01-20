%dw 2.0
output application/json
---
{	
	"status" : (
		if(isEmpty(vars.dependencyStatusList) or
			(!(vars.dependencyStatusList.status contains "DOWN"))) 
		"OK"
		else if ((vars.dependencyStatusList.status contains "UP") and
            (vars.dependencyStatusList.status contains "DOWN"))
		 "DEGRADED"
		else "OFFLINE"
	),
	"apiName": app.name,
	"apiVersion": vars.apiVersion default "",
	"transactionId": correlationId,
	"timestamp": now() as String { format: "yyyy-MM-dd'T'HH:mm:ss" },
	("dependencies": vars.dependencyStatusList) if(!isEmpty(vars.dependencyStatusList))
	
}

