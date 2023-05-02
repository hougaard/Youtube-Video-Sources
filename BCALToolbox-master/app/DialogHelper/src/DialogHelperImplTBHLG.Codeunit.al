/// <summary>
/// Codeunit Dialog Helper Impl TBHLG (ID 81501).
/// Implementation Codeunit
/// </summary>
codeunit 81501 "Dialog Helper Impl TBHLG"
{
    Access = Internal;

    var
        LastUpdate: DateTime;
        StartTime: DateTime;
        Window: Dialog;

    procedure OpenWindow(DialogString: text; ShowEstimatedEndTime: Boolean)
    var
        WindowString: Text;
        ProgressBarPlaceHolderTxt: Label '#20###############################################', Comment = '%20 = Progress Bar Text', Locked = true;
        ElapsedTimeTxt: Label '\\Elapsed time :.................. #21#############', Comment = '%21 = Elapsed Time';
        EstimatedTimeLeftTxt: Label '\Estimated time left :...... #22#############', Comment = '%22 = Estimated time left';
        EstimatedEndTimeTxt: label '\Estimated end time :..... #23#############', Comment = '%23 = Calculated End Time';
    begin
        if not IsGuiAllowed() then
            exit;

        StartTime := 0DT;
        WindowString := DialogString;
        if WindowString = '' then
            WindowString := ProgressBarPlaceHolderTxt
        else
            WindowString := WindowString + '\\' + ProgressBarPlaceHolderTxt;

        if ShowEstimatedEndTime then begin
            WindowString := WindowString + ElapsedTimeTxt + EstimatedTimeLeftTxt + EstimatedEndTimeTxt;
            StartTime := CurrentDateTime;
        end;

        Window.open(WindowString);
        LastUpdate := CreateDateTime(19000101D, 100000T);
    end;

    procedure UpdateWindow(Counter: Integer; NoOfRecords: Integer);
    var
        ProgressBar: Codeunit "Progress Bar TBHLG";
        EndTime: DateTime;
        CurrDuration: Duration;
        EstimatedDuration: Duration;

    begin
        if CurrentDateTime < LastUpdate + 1000 then
            exit;

        if Counter = 0 then
            exit;

        Window.Update(20, ProgressBar.ProgressBar(Counter, NoOfRecords));
        LastUpdate := CurrentDateTime;

        if StartTime = 0DT then
            exit;

        CurrDuration := CurrentDateTime - StartTime;
        EstimatedDuration := ROUND((CurrentDateTime - StartTime) * 100 / (Counter / NoOfRecords * 100), 100);
        EndTime := StartTime + EstimatedDuration;
        Window.Update(21, FormatDuration(CurrDuration));

        IF CurrDuration <= 2000 then
            exit;

        Window.Update(22, FormatDuration(EstimatedDuration - CurrDuration));
        Window.Update(23, Format(EndTime, 0, '<Hours24>:<Minutes,2>:<Seconds,2>'));

    end;

    procedure UpdateWindow(DialogFieldNo: Integer; DialogValue: Text);
    begin
        if not IsGuiAllowed() then
            exit;

        Window.Update(DialogFieldNo, DialogValue);
    end;

    procedure UpdateWindow(DialogFieldNo: Integer; DialogValue: Text; Counter: Integer; NoOfRecords: Integer);
    begin
        if not IsGuiAllowed() then
            exit;

        UpdateWindow(DialogFieldNo, DialogValue);
        UpdateWindow(Counter, NoOfRecords);
    end;

    local procedure FormatDuration(NewDuration: Duration): Text;
    var
        Minutes: Integer;
        Seconds: Integer;
        MinuteAndSecondsTxt: Label '%1 Minutes, %2 Seconds', Comment = '%1 = Minutes passed ; %2 = Seconds Passed';
        SecondsTxt: Label '%1 Seconds', Comment = '%1 = Seconds Passed';
    begin
        NewDuration := Round(NewDuration / 1000, 1);
        Minutes := Round(NewDuration / 60, 1, '<');
        Seconds := NewDuration - (Minutes * 60);
        IF Minutes > 0 then
            exit(StrSubstNo(MinuteAndSecondsTxt, Minutes, Seconds))
        ELSE
            exit(StrSubstNo(SecondsTxt, Seconds));
    END;

    local procedure IsGuiAllowed() GuiIsAllowed: Boolean
    var
        Handled: Boolean;
    begin
        OnBeforeGuiAllowed(GuiIsAllowed, Handled);
        if Handled then
            exit;
        exit(GuiAllowed());
    end;

    /// <summary>
    /// Raises an event to be able to change the return of IsGuiAllowed function. Used for testing.
    /// </summary>
    [InternalEvent(false)]
    procedure OnBeforeGuiAllowed(var Result: Boolean; var Handled: Boolean)
    begin
    end;
}
