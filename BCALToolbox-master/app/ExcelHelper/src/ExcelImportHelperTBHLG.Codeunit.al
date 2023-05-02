/// <summary>
/// Codeunit Excel Import Helper TBHLG (ID 81503).
/// Calling any function will return a Temporary Excel Buffer, populated from the Excel spreadsheet.
/// </summary>
codeunit 81504 "Excel Import Helper TBHLG"
{

    Access = Public;

    /// <summary> 
    /// This function will ask the user for a (Excel) file name, and return the filled Excel Buffer
    /// </summary>
    /// <param name="TEMPExcelBuffer">Parameter of type Record "Excel Buffer" temporary.</param>
    procedure ImportExcelFileIntoExcelBuffer(var TEMPExcelBuffer: Record "Excel Buffer" temporary);
    var
        ExcelImportHelperImpl: Codeunit "Excel Import Helper Impl TBHLG";
    begin
        ExcelImportHelperImpl.ImportExcelFileIntoExcelBuffer(TEMPExcelBuffer);
    end;
}