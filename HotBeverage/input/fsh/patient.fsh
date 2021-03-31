Profile: BrewedBeverage
Parent: Parameters
* parameter  ^slicing.discriminator.type = #value
* parameter  ^slicing.discriminator.path = "name"
* parameter  ^slicing.rules = #open
* parameter  ^slicing.ordered = false
* parameter  ^slicing.description = "Slice on parameter name"
* parameter
    contains device 0..1 MS
    and beverageType 1..1 MS
    and milkType 0..1 MS
    and syrupType 0..* MS
    and alcoholType 0..* MS
    and sweetenerType 0..* MS
    and spiceType 0..* MS
    and decaffeinated 0..1 MS

* parameter[device].name = "device" (exactly)
* parameter[device].name ^short = "Machine to make the beverage"
* parameter[device].name ^comment = "can be blank if submitting direct to the brewing system"
* parameter[device].value[x] 0..1 MS
* parameter[device].value[x] only Reference(Device)

* parameter[beverageType].name = "beverageType" (exactly)
* parameter[beverageType].name ^short = "Beverage to be made"
* parameter[beverageType].value[x] 1..1 MS
* parameter[beverageType].value[x] only code
* parameter[beverageType].value[x] from HBBeverageVS (example)

* parameter[milkType].name = "milkType" (exactly)
* parameter[milkType].name ^short = "Milk to be included"
* parameter[milkType].value[x] 0..1 MS
* parameter[milkType].value[x] only code
* parameter[milkType].value[x] from HBMilkVS (example)

* parameter[syrupType].name = "syrupType" (exactly)
* parameter[syrupType].name ^short = "Syrup to be included"
* parameter[syrupType].value[x] 0..1 MS
* parameter[syrupType].value[x] only code
* parameter[syrupType].value[x] from HBSyrupVS (example)

* parameter[alcoholType].name = "alcoholType" (exactly)
* parameter[alcoholType].name ^short = "Alcohol to be included"
* parameter[alcoholType].value[x] 0..1 MS
* parameter[alcoholType].value[x] only code
* parameter[alcoholType].value[x] from HBAlcoholVS (example)

* parameter[sweetenerType].name = "sweetenerType" (exactly)
* parameter[sweetenerType].name ^short = "Sweetener to be included"
* parameter[sweetenerType].value[x] 0..1 MS
* parameter[sweetenerType].value[x] only code
* parameter[sweetenerType].value[x] from HBSweetenersVS (example)

* parameter[spiceType].name = "spiceType" (exactly)
* parameter[spiceType].name ^short = "Spice to be included"
* parameter[spiceType].value[x] 0..1 MS
* parameter[spiceType].value[x] only code
* parameter[spiceType].value[x] from HBSpiceVS (example)

* parameter[decaffeinated].name = "decaffeinated" (exactly)
* parameter[decaffeinated].name ^short = "Is Coffee to be decaffeinated"
* parameter[decaffeinated].value[x] 1..1 MS
* parameter[decaffeinated].value[x] only code
* parameter[decaffeinated].value[x] from NoDecaf (required)
