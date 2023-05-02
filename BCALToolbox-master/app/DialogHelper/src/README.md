Contains helper methods that either display a confirm dialog when logic is run, or suppresses it if UI is not allowed, such as background sessions or webservice calls.

# Public Objects
## Dialog Helper (Codeunit 80500)

 Exposes functionality to raise a progress dialog with the option of showing an estimated end time.
 

### OpenWindow (Method) <a name="OpenWindow"></a> 

 Raises a dialog window is initialized and opened. 
 If UI is not allowed, no action is taken.
 

#### Syntax
```
procedure OpenWindow(DialogString: text; ShowEstimatedEndTime: Boolean)
```
#### Parameters
*DialogString ([Text](https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/methods-auto/text/text-data-type))* 

 The dialog presented to the user. Use #1######## (where 1 is upped by one for each placeholder) to add field that will change during the processing.  (see more ([Here](https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/methods-auto/dialog/dialog-open-method)))
 If the DialogString is blank, a default 'Processing, Please wait...' will be displayed.

*ShowEstimatedEndTime ([Boolean](https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/methods-auto/boolean/boolean-data-type))* 
 Setting ShowEstimatedEndTime will create three placeholders (20, 21 and 22) that will show how long the process has run and estimated end time.


### UpdateWindow (Method) <a name="UpdateWindow-1"></a> 

 Update Progressbar, Duration and Estimated End Time
 If UI is not allowed, no action is taken

#### Syntax
```
procedure UpdateWindow(Counter: Integer; NoOfRecords: Integer);
```
#### Parameters
*Counter ([Integer](https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/methods-auto/integer/integer-data-type))* 
 Specify the current Counter (Record x of y) of the record being processed. (Used to calculate total progress)

*NoOfRecords ([Integer](https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/methods-auto/integer/integer-data-type))*
 Specify the Total Records being processed. (Used to calculate total progress)


### UpdateWindow (Method) <a name="UpdateWindow-2"></a> 

 Updates the placeholder with the appropiate FieldNo with the Value given.
 Progressbar, Duration and Estimated End time is not updated.
 If UI is not allowed, no action is taken

#### Syntax
```
procedure UpdateWindow(FieldNo: Integer; Value: Text);
```
#### Parameters
*FieldNo ([Integer](https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/methods-auto/integer/integer-data-type))*
 The FieldNo for the Placeholder

*Value ([Text](https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/methods-auto/text/text-data-type))* 
 The value to be placed into the placeholder


 ### UpdateWindow (Method) <a name="UpdateWindow-3"></a> 

 Updates the placeholder with the appropiate FieldNo with the Value given
 If UI is not allowed, no action is taken

#### Syntax
```
procedure UpdateWindow(FieldNo: Integer; Value: Text; Counter: Integer; NoOfRecords: Integer);
```
#### Parameters
*FieldNo ([Integer](https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/methods-auto/integer/integer-data-type))*
 The FieldNo for the Placeholder

*Value ([Text](https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/methods-auto/text/text-data-type))* 
 The value to be placed into the placeholder

*Counter ([Integer](https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/methods-auto/integer/integer-data-type))* 
 Specify the current Counter (Record x of y) of the record being processed. (Used to calculate total progress)

*NoOfRecords ([Integer](https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/methods-auto/integer/integer-data-type))*
 Specify the Total Records being processed. (Used to calculate total progress)
