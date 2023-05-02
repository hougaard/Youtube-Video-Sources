Contains helper methods that either display a confirm dialog when logic is run, or suppresses it if UI is not allowed, such as background sessions or webservice calls.

# Public Objects
## Excel Import Helper (Codeunit 80504)

 Exposes functionality to help populate the Excel Buffer table.
 

### ImportExcelFileIntoExcelBuffer (Method) <a name="ImportExcelFileIntoExcelBuffer"></a> 

 Asks the user to Specify a Excel file. If th Excel File has multiple sheets, the user will also be asked to select the appropiate sheet.
 The passed in, temporary, Excel Buffer Record 
 

#### Syntax
```
procedure ImportExcelFileIntoExcelBuffer(var TEMPExcelBuffer: Record "Excel Buffer" temporary);
```
#### Parameters
*TEMPExcelBuffer ([Record](https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/methods-auto/record/record-data-type))* 

 The "Excel Buffer" table will be cleared and populated based on the selected file and sheet. Ready for the Develolper to work with.