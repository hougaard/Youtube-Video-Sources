/// <summary>
/// Codeunit Dialog Helper HLG (ID 81500).
/// Exposes functionality to raise a progress dialog with the option of showing an estimated end time.
/// </summary>
codeunit 81500 "Dialog Helper TBHLG"
{
    Access = Public;

    var
        DialogHelperImpl: Codeunit "Dialog Helper Impl TBHLG";


    /// <summary>
    /// Raises a dialog window is initialized and opened. 
    /// If UI is not allowed, no action is taken.
    /// </summary>
    /// <param name="DialogString">Text; The dialog presented to the user. Use #1######## (where 1 is upped by one for each placeholder) to add field that will change during the processing.</param>
    /// <param name="ShowEstimatedEndTime">Boolean; Setting ShowEstimatedEndTime will create three placeholders (20, 21 and 22) that will show how long the process has run and estimated end time.</param>
    procedure OpenWindow(DialogString: text; ShowEstimatedEndTime: Boolean)
    begin
        DialogHelperImpl.OpenWindow(DialogString, ShowEstimatedEndTime);
    end;


    /// <summary>
    /// Update Progressbar, Duration and Estimated End Time.; If UI is not allowed, no action is taken
    /// If UI is not allowed, no action is taken
    /// </summary>
    /// <param name="Counter">Integer; Specify the current Counter (Record x of y) of the record being processed. (Used to calculate total progress)</param>
    /// <param name="NoOfRecords">Integer; Specify the Total Records being processed. (Used to calculate total progress)</param>
    procedure UpdateWindow(Counter: Integer; NoOfRecords: Integer);
    begin
        DialogHelperImpl.UpdateWindow(Counter, NoOfRecords);
    end;


    /// <summary>
    /// Updates the placeholder with the appropiate FieldNo with the Value given.
    /// Progressbar, Duration and Estimated End time is not updated.
    ///  If UI is not allowed, no action is taken
    /// </summary>
    /// <param name="DialogFieldNo">Integer; The FieldNo for the Placeholder</param>
    /// <param name="DialogValue">Text; </param>
    procedure UpdateWindow(DialogFieldNo: Integer; DialogValue: Text);
    var
    begin
        DialogHelperImpl.UpdateWindow(DialogFieldNo, DialogValue);
    end;


    /// <summary>
    /// Updates the placeholder with the appropiate FieldNo with the Value given.
    /// Progressbar, Duration and Estimated End time is also updated.
    ///  If UI is not allowed, no action is taken
    /// </summary>
    /// <param name="DialogFieldNo">Integer; The FieldNo for the Placeholder</param>
    /// <param name="DialogValue">Text; </param>
    /// <param name="Counter">Integer; Specify the current Counter (Record x of y) of the record being processed. (Used to calculate total progress)</param>
    /// <param name="NoOfRecords">Integer; Specify the Total Records being processed. (Used to calculate total progress)</param>
    procedure UpdateWindow(DialogFieldNo: Integer; DialogValue: Text; Counter: Integer; NoOfRecords: Integer);
    begin
        DialogHelperImpl.UpdateWindow(DialogFieldNo, DialogValue, Counter, NoOfRecords);
    end;
}
