// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    actions
    {
        addfirst(processing)
        {
            action(Test)
            {
                Caption = 'Test';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                var
                    E: List of [ErrorInfo];
                begin
                    if not TryTest() then begin
                        E := GetCollectedErrors();
                        message('ErrorInfo Count %1', E.Count());
                    end;
                    //Test();
                end;
            }
        }
    }

    [TryFunction]
    procedure TryTest()
    begin
        Test();
    end;

    [ErrorBehavior(ErrorBehavior::Collect)]
    procedure Test()
    var
        E1: ErrorInfo;
        E2: ErrorInfo;
        ExtraInfo: Dictionary of [Text, Text];
    begin
        E1 := ErrorInfo.Create('This is the first error!');
        E1.Collectible(true);
        ExtraInfo.Add('INFO1', 'Ordered by Erik');
        ExtraInfo.Add('MOOD', 'Good!');
        E1.DetailedMessage('This is extra detailed information on this error!');
        E1.Verbosity := Verbosity::Warning;
        E1.CustomDimensions(ExtraInfo);
        Error(E1);

        E2 := ErrorInfo.Create('This is the second error!');
        E2.Collectible(true);
        E2.DetailedMessage('This is extra detailed information on this error!');
        E2.Verbosity := Verbosity::Critical;
        E2.CustomDimensions(ExtraInfo);
        Error(E2);

        Test2();

        Message('I''m still alive!');
    end;

    procedure Test2()
    var
        E3: ErrorInfo;
    begin
        E3 := ErrorInfo.Create('This is the third error', true, Rec, 1, 0, 'Control', Verbosity::Verbose, DataClassification::CustomerContent);
        error(E3);
    end;
}