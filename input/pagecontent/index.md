### Scope and Usage

Based on IETF [RFC 2324 - Hyper Text Coffee Pot Control Protocol (HTCPCP/1.0)](https://tools.ietf.org/html/rfc2324) and its update, [RFC 7168 - The Hyper Text Coffee Pot Control Protocol for Tea Efflux Appliances (HTCPCP-TEA)](https://tools.ietf.org/html/rfc7168), this resource allows for the fulfillment of a device request for an artfully brewed caffeinated beverage, but coffee shares this quality with many other varied preparations based on the filtration of plant material.  Foremost, among these are the category of brews
based on the straining of water through prepared leaves from a tea tree.


<div>
{%include brewRequest.svg%}
</div>


### Boundaries and Relationships

This resource may relate to NutritionOrder with the variance that the subject may be Patient, Practitioner or, possibly, RelatedPerson if that individual is not responding to conventional awakening therapy.

This also has a need for a sub-class of Device to allow for coffeepot, teapot and, potentially additional classes of espresso machine and cappuccino machine with associated responses.

### Background and Context

IETF RFC 2324 and 7168 outline the creation of the HTCPCP which uses a modified header for the BREW/POST and message/[coffee/tea]pot mimetypes.

FHIR uses only the standard http protocols which will limit the ability for appropriate caffeination of Person(s) as needed.  As such, it was felt that taking these Pre-FHIR RFCs and
create a resource that can take the header information from a HTCPCP request and transform it into a FHIR appropriate request to a Device with full use of the http status codes needed for processing

### Deviations from IETF RFC 2324 and RFC 7168
IETF RFC 7168 adds the addition-type of "sugar-type" without a significant differentiation from the RFC 2324 addition-type of sweetener-type with the note:
> It has been observed that some users of blended teas have an occasional preference for teas brewed as an emulsion of cane sugar with hints of water.  
> To allow for this circumstance, the Accept-Additions header field defined in the base HTCPCP specification is updated

This information is duplicative for the purposes of FHIR and a sugar-type additive type is coded within BrewedBeverage.additions.sweetenerType
In addition, IETF RFC 2324 does not make allowances for decaffeinated beverages to be requested due to a lack of point.  To support this, the BrewedBevarages resource added a boolean element BrewedBeverage.decaffeinated with the invariant that the boolean is forced FALSE. Any attempt to add decaffeinated versions of coffee and/or tea to the BrewedBeverage.beverageSubType CodeableConcept list is a violation of the RFC and subject to invalidation by the Device receiving the BrewedBeverage resource.

### Additions Processing
As per RFC 7168:
> Services that implement the Accept-Additions header field MAY return a 403 status code for a BREW request of a given variety of tea, if the service deems the combination of additions requested to be contrary to the sensibilities of a consensus of drinkers regarding the variety in question.

This processing requirement is expressed within the FHIR context via the BrewedBeverage.additions[x] elements. Sufficient processing to enforce this requirement shall be dedicated and policy would dictate the conditions that would require the return of the 403 status error.  As with RFC 7168, determination of  the most viable combinations of additions for each variety to be served is outside the scope of the BrewedBeverage specification.


### Error Codes Specific to BrewedBeverage
RFC 2324 declares two specific Error states defined due to device capabilities:

|Error|Definition|
|---|---|
|406 Not Acceptable|This return code is interpreted as "The Device identified by the request is only capable of generating response entities which have content characteristics not acceptable according to the elements sent in the request."|
|418 I'm a Teapot|Any attempt to brew coffee with a teapot should result in the error code "418 I'm a teapot". The resulting response definition MAY be short and stout.|
{:.table-striped}
