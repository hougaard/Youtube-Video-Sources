pageextension 52600 "customer list" extends "Customer List"
{
    layout
    {
        modify(Name)
        {
            //Style = AttentionAccent;
            StyleExpr = MyStyle;
        }
    }

    trigger OnAfterGetRecord()
    begin
        SetMyStyle();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        SetMyStyle();
    end;

    procedure SetMyStyle()
    begin
        case Rec."Gen. Bus. Posting Group" of
            'DOMESTIC':
                Mystyle := 'Unfavorable';
            'EU':
                MyStyle := 'Favorable';
            'EXPORT':
                MyStyle := 'Ambiguous';
        end;
    end;

    var
        MyStyle: Text;
}