CodeSystem: HBDrinkSize
Title: "Drink Size"
Description: "How much did you want?"
* ^caseSensitive = false
* #SMALL "Small" "You call that a coffee?"
* #MED "Medium" "Not enough"
* #LARGE "Large" "That will get you started"
* #XLARGE "Extra Large" "Single meeting size"
* #PROG "Programmer size" "Just over a pot"

ValueSet: HBDrinkSizeVS
Title: "Size of Beverage to be Consumed"
Description: "You want how much?"

* include codes from system HBDrinkSize

Instance:   StarSizeVsDrinkSize
InstanceOf: ConceptMap
Title:      "$tarBucks sizes vs HB Drink Sizes"
Description: "map between commonly understood drink sizes and the formal drink size codes."
Usage: #definition
//* url = "https://profiles.ihe.net/ITI/MHD/ConceptMap/AssociationTypeVsRelatesTo"
* name =  "StarSizeVsDrinkSize"
* status = #active
* date = 2022-03-09
//* publisher = "IHE"
//* purpose = "show the mapping between Association Types and relatesTo code"
* sourceUri = "https://customerservice.starbucks.com/app/answers/detail/a_id/3113"
* targetCanonical = "http://www.fhir.org/guides/hotbeverage/ValueSet/HBDrinkSizeVS"
* group.element[+].code = #Small
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #SMALL
* group.element[+].code = #Tall
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.code = #SMALL
* group.element[+].code = #Grande
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #MED
* group.element[+].code = #Venti
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #LARGE
* group.element[+].code = #Trenta
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #XLARGE