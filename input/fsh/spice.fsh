CodeSystem: HBSpice
Title: "Spice List"
Description: "Spice to be added, if desired"
* #CINNAMON "cinnamon"
* #NUTMEG "nutmeg"
* #LAVENDER "lavender"
* #CARDAMOM "cardamom"
* #SALT "salt"


ValueSet: HBSpiceVS
Title: "Spice Additive Value Set"
Description: "Spice liquids for use in coffee"

* include codes from system HBSpice

Alias:   SCT = http://snomed.info/sct

ValueSet: NoDecaf
Title: "Decaf is for the weak"
Description: "No, Just No"

* SCT#64100000 "No"

CodeSystem: HBDrinkSize
Title: "Drink Size"
Description: "How much did you want?"

* #SMALL "Small" "You call that a coffee?"
* #MED "Medium" "Not enough"
* #LARGE "Large" "That will get you started"
* #XLARGE "Extra Large" "Single meeting size"
* #PROG "Programmer size" "Just over a pot"

ValueSet: HBDrinkSizeVS
Title: "Size of Beverage to be Consumed"
Description: "You want how much?"

* include codes from system HBDrinkSize
