/// <summary>
/// Codeunit Excel Import Helper Impl TBHLG (ID 81505).
/// Implementation Codeunit
/// </summary>
codeunit 81505 "Excel Import Helper Impl TBHLG"
{
    Access = Internal;

    /// <summary> 
    /// This function will ask the user for a (Excel) file name, and return the filled Excel Buffer
    /// </summary>
    /// <param name="TEMPExcelBuffer">Parameter of type Record "Excel Buffer" temporary.</param>
    procedure ImportExcelFileIntoExcelBuffer(var TEMPExcelBuffer: Record "Excel Buffer" temporary);
    var
        ClientFileName: Text;
        ExcelSheetName: Text;
        ReadInStream: InStream;

    begin
        AskUserForFileName(ClientFileName, ReadInStream);
        ExcelSheetName := GetExcelSheetName(ReadInStream);
        PopulateExcelBuffer(TEMPExcelBuffer, ReadInStream, ExcelSheetName);
    end;

    /// <summary> 
    /// Asks user for filename and Sheet, and reads the file into the InStream
    /// </summary>
    /// <param name="ClientFileName">Selected Filename is returned</param>
    /// <param name="ExcelInStream">ExcelInStream is returned</param>
    local procedure AskUserForFileName(var ClientFileName: Text; var ExcelInStream: InStream)
    var
        UploadExcelFileLbl: Label 'Upload Excel File';
        PleaseSelectFileErr: Label 'Please select a file';
    begin
        if not UploadIntoStream(UploadExcelFileLbl, '', '', ClientFileName, ExcelInstream) then
            //if not UploadIntoStream(ClientFileName, ExcelInStream) then
            Error(PleaseSelectFileErr);

        if ClientFileName = '' then
            Error(PleaseSelectFileErr);
    end;

    /// <summary> 
    /// Returns the Excel Sheet Name. Sheetname is either blindly returned (if just one) or the user is asked
    /// </summary>
    /// <param name="ExcelInStream">Parameter of type InStream.</param>
    /// <returns>Return variable "ExcelSheetName".</returns>
    local procedure GetExcelSheetName(var ExcelInStream: InStream): Text
    var
        TEMPExcelBuffer: Record "Excel Buffer" temporary;
        PleaseSelectSheetErr: Label 'Please select a sheet';
        ExcelSheetName: Text;
    begin
        ExcelSheetName := TEMPExcelBuffer.SelectSheetsNameStream(ExcelInstream);
        IF ExcelSheetName = '' then
            Error(PleaseSelectSheetErr);

        exit(ExcelSheetName);
    end;

    /// <summary> 
    /// Description for PopulateExcelBuffer.
    /// </summary>
    /// <param name="TEMPExcelBuffer">Parameter of type Record "Excel Buffer". Temporary. Will be returned.</param>
    /// <param name="ExcelInStream">Parameter of type InStream.</param>
    /// <param name="ExcelSheetName">Parameter of type Text.</param>
    local procedure PopulateExcelBuffer(var TEMPExcelBuffer: Record "Excel Buffer"; var ExcelInStream: InStream; ExcelSheetName: Text)
    var
        DevMsgNotTemporaryErr: Label 'This function can only be used when the record is temporary.';
    begin
        if not TEMPExcelBuffer.IsTemporary then
            error(DevMsgNotTemporaryErr);

        TEMPExcelBuffer.DeleteAll();
        TEMPExcelBuffer.LockTable();
        TEMPExcelBuffer.OpenBookStream(ExcelInstream, ExcelSheetName);
        TEMPExcelBuffer.ReadSheet();
    end;
}