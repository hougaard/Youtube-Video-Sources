pageextension 50100 Lines extends "Sales Order Subform"
{
    layout
    {
        addlast(content)
        {
            usercontrol(Comm; InterPageCommunication)
            {
                ApplicationArea = all;
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    begin
        CurrPage.Comm.PingParentPage(Rec."Line No.");
    end;
}
pageextension 50101 Header extends "Sales Order"
{
    layout
    {
        addlast(content)
        {
            usercontrol(Comm; InterPageCommunication)
            {
                ApplicationArea = all;
                trigger PingFromSubPage(LineNo: Integer)
                begin
                    if LineNo <> CurrentLineNo then begin
                        message('Hello from subpage! %1', LineNo);
                        CurrentLineNo := LineNo;
                    end;
                end;
            }
        }
    }
    var
        CurrentLineNo: integer;
}

controladdin InterPageCommunication
{
    MaximumHeight = 1;
    MaximumWidth = 1;
    MinimumHeight = 1;
    MinimumWidth = 1;
    HorizontalShrink = true;
    VerticalShrink = true;
    VerticalStretch = true;
    HorizontalStretch = true;
    RequestedHeight = 1;
    RequestedWidth = 1;
    Scripts = 'interpagecommunication.js';
    event PingFromSubPage(LineNo: Integer);
    procedure PingParentPage(LineNo: Integer);
}