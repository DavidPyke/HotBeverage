Instance: hbbrew
InstanceOf: OperationDefinition
Usage: #definition
* url = "http://hl7.org/fhir/OperationDefinition/Brew"
* version = "4.0.1"
* name = "HBbrew"
* status = #draft
* kind = #operation
* date = "2020-04-01T09:29:23+11:00"
* publisher = "HL7 (FHIR Project)"
* contact[0].telecom[0].system = #url
* contact[0].telecom[0].value = "http://hl7.org/fhir"
* contact[0].telecom[1].system = #email
* contact[0].telecom[1].value = "fhir@lists.hl7.org"
* description = "The brew operation sends the BrewedBeverage resource to the Coffee/Tea brewing Device"
* code = #data-requirements
* comment = "The effect of invoking this operation is to initiate the Brew operation on the appropriate device with the inclusion of the \r\n  requested additions"
* system = false
* type = true
* instance = true
* parameter[0].name = #BevBrew
* parameter[0].use = #in
* parameter[0].min = 1
* parameter[0].max = "1"
* parameter[0].documentation = "The BrewedBeverage Resource that dictates the beverage to be brewed and the requested additions (if any)"
* parameter[0].type = #canonical
* parameter[0].targetProfile = Canonical(BrewedBeverage)

Instance: hbstop
InstanceOf: OperationDefinition
Usage: #definition
* url = "http://hl7.org/fhir/OperationDefinition/BB-Stop"
* version = "4.0.1"
* name = "HBstop"
* status = #draft
* kind = #operation
* date = "2020-04-01T09:29:23+11:00"
* publisher = "HL7 (FHIR Project)"
* contact[0].telecom[0].system = #url
* contact[0].telecom[0].value = "http://hl7.org/fhir"
* contact[0].telecom[1].system = #email
* contact[0].telecom[1].value = "fhir@lists.hl7.org"
* description = "The stop operation sends the Device a direction to stop the brew of the beverage (primarily tea) to check for doneness.  Used in combination with the Start operation to make the tea just right"
* code = #data-requirements
* comment = "TBA--need text from RFC"
* system = false
* type = true
* instance = true
* parameter[0].name = #BBIdent
* parameter[0].use = #in
* parameter[0].min = 1
* parameter[0].max = "1"
* parameter[0].documentation = "The ID of the BrewedBeverage Resource"
* parameter[0].type = #Reference

Instance: hbwhen
InstanceOf: OperationDefinition
Usage: #definition
* url = "http://hl7.org/fhir/OperationDefinition/BB-When"
* version = "4.0.1"
* name = "HBwhen"
* status = #draft
* kind = #operation
* date = "2020-04-01T09:29:23+11:00"
* publisher = "HL7 (FHIR Project)"
* contact[0].telecom[0].system = #url
* contact[0].telecom[0].value = "http://hl7.org/fhir"
* contact[0].telecom[1].system = #email
* contact[0].telecom[1].value = "fhir@lists.hl7.org"
* description = " When coffee is poured, and milk is offered, it is necessary for the holder of the recipient of milk to say \"when\" at the time when\r\n   sufficient milk has been introduced into the coffee. For this purpose, the \"WHEN\" operation has been added to FHIR. "
* code = #data-requirements
* comment = "Enough? Say WHEN."
* system = false
* type = true
* instance = true
* parameter[0].name = #BevID
* parameter[0].use = #in
* parameter[0].min = 1
* parameter[0].max = "1"
* parameter[0].documentation = "The ID of the BrewedBeverage Resource that dictates the beverage to be brewed and the requested additions (if any)"
* parameter[0].type = #Reference
