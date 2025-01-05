page 50100 "Inbound API calls"
{
    APIGroup = 'yt';
    APIPublisher = 'youtube';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'inboundAPICalls';
    DelayedInsert = true;
    EntityName = 'call';
    EntitySetName = 'calls';
    PageType = API;
    ODataKeyFields = SystemId;
    SourceTable = "Inbound API Calls";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'Id';
                }
                field(returnValue; Rec."Return Value")
                {
                    Caption = 'Return Value';
                }
                field(subject; Rec.Subject)
                {
                    Caption = 'Subject';
                }
                field(Sender; Rec.Sender)
                {

                }
            }
        }
    }
    [ServiceEnabled]
    procedure CallALCode(var ActionContext: WebServiceActionContext)
    begin
        Rec."Return Value" := 'Result of stuff happening!';
        Rec.Modify();
    end;
}
