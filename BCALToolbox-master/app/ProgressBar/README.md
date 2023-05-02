Contains helper methods that either display a confirm dialog when logic is run, or suppresses it if UI is not allowed, such as background sessions or webservice calls.

# Public Objects
## Progress Bar (Codeunit 80502)

 Exposes functionality to raise a progress dialog with the option of showing an estimated end time.
 

### ProgressBar (Method) <a name="ProgressBarPercentage"></a> 

 Returns a text string based on the percentage (1 - 100). Designed to be used in a pregress window.
 

#### Syntax
```
procedure ProgressBar(Percentage: Integer): Text
```
#### Parameters
*Percentage ([Integer](https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/methods-auto/integer/integer-data-type))*  

 Any Value between 1 and 100


### ProgressBar (Method) <a name="ProgressBarCouterAndMax"></a> 

 Returns a text string based on the the percentage calculated based on Counter and MaxValue. Designed to be used in a pregress window.

#### Syntax
```
procedure ProgressBar(Counter: Integer; MaxValue: Integer): Text
```
#### Parameters
*Counter ([Integer](https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/methods-auto/integer/integer-data-type))* 
 Specify the current Counter (Record x of y) of the record being processed. (Used to calculate total progress)

*MaxValue ([Integer](https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/methods-auto/integer/integer-data-type))*
 Specify the Total Records being processed. (Used to calculate total progress)

