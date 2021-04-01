Profile: BrewedBeverage
Parent: Parameters
Title:          "The Hot Beverage to Brew"
Description:    "The parameters to be given to the device to make the requested Hot Beverage.

* The Machine to make the beverage (optional)
* The Beverage to be made (required)
* The type of Milk to be included (optional)
* The type of Syrup to be included (optional)
* The type of Alcohol to be included (optional)
* The type of Sweetener to be included (optional)
* The type of Spice to be included (optional)
* Is Coffee to be decaffeinated (shall be NoDecaf)
"
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
    and drinkSize 1..1 MS
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

* parameter[drinkSize].name = "drinkSize" (exactly)
* parameter[drinkSize].name ^short = "Spice to be included"
* parameter[drinkSize].value[x] 0..1 MS
* parameter[drinkSize].value[x] only code
* parameter[drinkSize].value[x] from HBDrinkSizeVS (example)

* parameter[decaffeinated].name = "decaffeinated" (exactly)
* parameter[decaffeinated].name ^short = "Is Coffee to be decaffeinated"
* parameter[decaffeinated].value[x] 1..1 MS
* parameter[decaffeinated].value[x] only code
* parameter[decaffeinated].value[x] from NoDecaf (required)

Instance: VertuoNext
InstanceOf: Device
Title: "Vertuo Next"
Description: "Nespresso introduces the VERTUO NEXT CLASSIC, the latest VERTUO Nespresso coffee maker with an all-new design and colors for the ultimate brewing experience. In addition to its original espressos, NESPRESSO VERTUO NEXT produces an extraordinary cup of coffee with a smooth layer of crema, the signature of a truly great cup of coffee. The VERTUO coffee and espresso coffee machine conveniently makes 5, 8, 14, 18 oz Coffee and single and double Espresso. Nespresso brings together the know-how of all its coffee experts, who have carefully chosen the origin and roasting of each coffee blend and created a brewing system using Centrifusion technology, a patented extraction technology developed by Nespresso. Just insert a Vertuo capsule and close the lever — when activated, the capsule spins, blending ground coffee with water and extracting every drop of flavor. Its precision brewing system recognizes each capsule and automatically adjusts its brewing parameters to consistently deliver the best in cup result. Bundled with Nespresso's Aeroccino3, provides smooth hot or cold milk froth for your coffee recipes with one touch. It froths all types of milk in a few seconds, without noise or vibration. Each machine includes a complimentary welcome set with a range of Nespresso Vertuo capsules with unique aroma profiles. Order your Nespresso capsules, receive personalized advice, and obtain technical support or repair for your machine through the Nespresso Club via mobile app, by telephone or in one of our Boutiques. This coffee machine is compatible exclusively with Nespresso Vertuo Line pods. Input power (W): 1260. Intelligent extraction system recognizes each coffee blend."
* status = #active
* manufacturer = "nespresso"
* deviceName.name = "Vertuo Next"
* deviceName.type = #manufacturer-name
* modelNumber = "B084GYKJ58"
* location.display = "coffee room"
* url = "http://server.example.com/fhir/coffee"

Instance: MakeCoffee
InstanceOf: BrewedBeverage
Title: "Make me Espresso"
Description: "Request to make Espresso.

* Using the Nespresso VertuoNext device
* Requesting Espresso
"
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* meta.security[+] = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#L
* parameter[device].name = "device"
* parameter[device].valueReference = Reference(VertuoNext)
* parameter[beverageType].name = "beverageType"
* parameter[beverageType].valueCode = #ESPRESSO
