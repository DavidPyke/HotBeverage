CodeSystem: HBSpice
Title: "Spice List"
Description: "Spice to be added, if desired"
* ^caseSensitive = false
* ^experimental = false
* #CINNAMON "cinnamon"
* #NUTMEG "nutmeg"
* #LAVENDER "lavender"
* #CARDAMOM "cardamom"
* #SALT "salt"


ValueSet: HBSpiceVS
Title: "Spice Additive Value Set"
Description: "Spice liquids for use in coffee"
* ^experimental = false
* include codes from system HBSpice

Alias:   SCT = http://snomed.info/sct

ValueSet: NoDecaf
Title: "Decaf is for the weak"
Description: "No, Just No"
* ^experimental = false
* SCT#64100000 "No"



