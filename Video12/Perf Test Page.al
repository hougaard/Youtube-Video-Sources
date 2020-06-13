page 50600 "Perf Test Page"
{
    Caption = 'Perf Test Page';
    UsageCategory = Lists;
    ApplicationArea = all;
    PageType = Card;
    layout
    {
        area(Content)
        {
            field(DataSize; DataSize)
            {
                Caption = 'Data Size to test';
                ApplicationArea = all;
                Editable = true;
            }
            field(T1; T1)
            {
                Caption = 'Builtin Version';
                ApplicationArea = all;
                Editable = false;
            }
            field(T2; T2)
            {
                Caption = 'AJ Version';
                ApplicationArea = all;
                Editable = false;
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Test)
            {
                Caption = 'Test';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ApplicationArea = all;
                Image = TestDatabase;
                trigger OnAction()
                var
                    TestTxt: Text;
                    Res1, Res2 : Text;
                    Ch: Text[1];
                    i: Integer;
                    Convert1: Codeunit "Base64 Convert";
                    Convert2: Codeunit "Base64 Handler";
                    StartTime: Time;
                    D: Dialog;
                    TB: TextBuilder;
                begin
                    D.Open('Running Test');
                    for i := 1 to DataSize do begin
                        ch[1] := (i mod 32) + 64;
                        //TestTxt += ch;
                        TB.Append(ch);
                    end;
                    TestTxt := TB.ToText();
                    StartTime := Time();
                    Res1 := Convert1.ToBase64(TestTxt);
                    T1 := Time() - StartTime;
                    StartTime := Time();
                    Res2 := Convert2.TextToBase64String(TestTxt);
                    T2 := Time() - StartTime;
                    D.Close();
                end;
            }
        }
    }
    var
        T1, T2 : Integer;
        DataSize: Integer;
}