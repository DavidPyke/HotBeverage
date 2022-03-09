
Profile:        BrewedLog
Parent:         AuditEvent
//Id:             HotBeverage.Brewed
Title:          "The AuditEvent for a successful Brewed Hot Beverage"
Description:    "An AuditEvent profile for when request to brew a Hot Beverage action happens successfully."
* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* subtype 1..1
* subtype = http://hl7.org/fhir/restful-interaction#operation "operation"
* action = #E
* recorded 1..1
// failures are recorded differently
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* agent ^slicing.discriminator.type = #pattern
* agent ^slicing.discriminator.path = "type"
* agent ^slicing.rules = #closed
* agent 2..3
* agent contains
    client 1..1 and
    server 1..1 and
    human 0..1
* agent[client].type = http://dicom.nema.org/resources/ontology/DCM#110153 "Source Role ID"
* agent[client].who 1..1 // client identifier, May be an Device Resource, but more likely an identifier given the App identified in the OAuth token
* agent[client].network 1..1 // as known by TCP connection information
* agent[client].role 0..0
* agent[client].altId 0..0
* agent[client].name 0..0
* agent[client].location 0..0
* agent[client].policy 0..0
* agent[client].media 0..0
* agent[client].purposeOfUse 0..0
* agent[server].type = http://dicom.nema.org/resources/ontology/DCM#110152 "Destination Role ID"
* agent[server].who 1..1 // server identifier. May be a Device Resource, but likely just an identifier of the domain name
* agent[server].network 1..1 // as known by TCP connection information
* agent[server].role 0..0
* agent[server].altId 0..0
* agent[server].name 0..0
* agent[server].location 0..0
* agent[server].policy 0..0
* agent[server].media 0..0
* agent[server].purposeOfUse 0..0
* agent[human].type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#BEN "beneficiary"
* agent[human].who 1..1 // May be a Resource, but likely just an identifier from the OAuth token
* agent[human].requestor = true
* agent[human].role MS // if the OAuth token includes any roles, they are recorded here
* agent[human].altId 0..0 // discouraged
* agent[human].name MS // might also be in .who.text but here is searchable
* agent[human].location 0..0 // discouraged as unlikely to be known in this scenario
* agent[human].policy 0..0 // discouraged as unlikely to be known in this scenario
* agent[human].media 0..0 // media is physical storage media identification
* agent[human].network 0..0 // humans are not network devices
* agent[human].purposeOfUse MS // if the OAuth token includes a PurposeOfUse it is recorded here
* source MS // what agent recorded the event. Likely the client or server but might be an intermediary
* entity ^slicing.discriminator.type = #pattern
* entity ^slicing.discriminator.path = "type"
* entity ^slicing.rules = #closed
* entity 1..1
* entity contains
    data 1..1
* entity[data].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[data].role = http://terminology.hl7.org/CodeSystem/object-role#20 "Job"
* entity[data].what 0..0
* entity[data].lifecycle 0..0
* entity[data].securityLabel 0..* // may contain the securityLabels on the resource
* entity[data].name 0..0
* entity[data].query 0..0
* entity[data].detail 1..*
// TODO - detail to contain the parameters


Instance: ex-auditBasicBrew
InstanceOf: BrewedLog
Title: "Audit Example of a basic brew"
Description: """Audit Example for a brewed coffee

* Using the Nespresso VertuoNext device
* Requesting Espresso"""
* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* action = #E
* subtype = http://hl7.org/fhir/restful-interaction#operation "operation"
//* severity = #Informational
* recorded = 2020-04-29T09:49:00.000Z
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* source.site = "server.example.com"
* source.observer = Reference(VertuoNext)
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* agent[server].type = http://dicom.nema.org/resources/ontology/DCM#110152 "Destination Role ID"
* agent[server].requestor = false
* agent[server].who = Reference(VertuoNext)
* agent[server].network.address = "http://server.example.com/fhir/coffee"
* agent[server].network.type = http://hl7.org/fhir/network-type#5 "URI"
* agent[client].type = http://dicom.nema.org/resources/ontology/DCM#110153 "Source Role ID"
* agent[client].who.display = "my phone"
* agent[client].requestor = false
* agent[client].network.address = "2001:0db8:85a3:0000:0000:8a2e:0370:7334"
* agent[client].network.type = http://hl7.org/fhir/network-type#2 "IP Address"
* agent[human].type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#BEN "beneficiary"
* agent[human].who.display = "John Smith" // just a display name pulled from the OAuth token
* agent[human].requestor = true
* entity[data].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[data].role = http://terminology.hl7.org/CodeSystem/object-role#20 "Job"
* entity[data].detail.type = "device"
* entity[data].detail.valueString = "VertuoNext"
* entity[data].detail[+].type = "beverageType"
* entity[data].detail[=].valueString = "#ESPRESSO"
* entity[data].detail[+].type = "drinkSize"
* entity[data].detail[=].valueString = "#PROG"
