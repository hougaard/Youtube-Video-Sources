/// <summary>
/// Codeunit Progress Bar TBHLG (ID 81502).
/// </summary>
codeunit 81502 "Progress Bar TBHLG"
{
    Access = Public;

    /// <summary>
    /// ProgressBar. Returns back a string containg a progress bar based on the percentage passed in
    /// </summary>
    /// <param name="Percentage">Decimal.</param>
    /// <returns>Return value of type Text.</returns>
    procedure ProgressBar(Percentage: Decimal): Text;
    var
        ProgressBarImpl: Codeunit "Progress Bar Impl TBHLG";
    begin
        exit(ProgressBarImpl.ProgressBar(Percentage));
    end;

    /// <summary>
    /// ProgressBar. Returns back a string containg a progress bar based on 
    /// the calculated percentage based on the Counter and Max values passed in
    /// </summary>
    /// <param name="Counter">Integer.</param>
    /// <param name="MaxValue">Integer.</param>
    /// <returns>Return value of type Text.</returns>
    procedure ProgressBar(Counter: Integer; MaxValue: Integer): Text;
    var
        ProgressBarImpl: Codeunit "Progress Bar Impl TBHLG";
    begin
        exit(ProgressBarImpl.ProgressBar(Counter, MaxValue));
    end;
}
