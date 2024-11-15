CodeSystem: HBSweeteners
Title: "Sweeteners List"
Description: "Sweeteners to be added, if desired"
* ^caseSensitive = false
* ^experimental = false
* #STEVIA "Stevia"
* #HONEY "Honey"
* #WSUGAR "White Sugar"
* #BSUGAR "Brown Sugar"
* #AGAVE "Agave Nectar"
* #MAPLE "Maple Syrup"
* #MOLASSES "Molasses"


ValueSet: HBSweetenersVS
Title: "Sweeteners Additive Value Set"
Description: "Sweeteners liquids for use in coffee"
* ^experimental = false
* include codes from system HBSweeteners
