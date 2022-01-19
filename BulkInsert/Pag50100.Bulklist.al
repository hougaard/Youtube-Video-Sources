page 50100 "Bulk list"
{
    ApplicationArea = All;
    Caption = 'Bulk list';
    PageType = List;
    SourceTable = Bulk;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(PK; Rec.PK)
                {
                    ToolTip = 'Specifies the value of the PK field.';
                    ApplicationArea = All;
                }
                field(Data; Rec.Data)
                {
                    ToolTip = 'Specifies the value of the Data field.';
                    ApplicationArea = All;
                }
                field(Data2; Rec.Data2)
                {
                    ToolTip = 'Specifies the value of the Data2 field.';
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Insert)
            {
                Caption = 'Insert';
                ApplicationArea = all;
                trigger OnAction()
                var
                    B: Record Bulk;
                    I: Integer;
                    Start: DateTime;
                begin
                    B.DeleteAll();
                    Start := CurrentDateTime();
                    for i := 1 to 10000 do begin
                        B.Init();
                        B.PK := i;
                        B.Data := 'sadklfjaskldfjsakldfjaslkdfjasklfjaskldfsjfdljaslkdjfaslkdjfsadklfjaskldfjsakldfjaslkdfjasklfjaskldfsjfdljaslkdjfaslkdjfsadklfjaskldfjsakldfjaslkdfjasklfjaskldfsjfdljaslkdjfaslkdjfsadklfjaskldfjsakldfjaslkdfjasklfjaskldfsjfdljaslkdjfaslkdjfsadklfjaskldfjsakldfjaslkdfjasklfjaskldfsjfdljaslkdjfaslkdjfsadklfjaskldfjsakldfjaslkdfjasklfjaskldfsjfdljaslkdjfaslkdjfsadklfjaskldfjsakldfjaslkdfjasklfjaskldfsjfdljaslkdjfaslkdjfsadklfjaskldfjsakldfjaslkdfjasklfjaskldfsjfdljaslkdjfaslkdjfsadklfjaskldfjsakldfjaslkdfjasklfjaskldfsjfdljaslkdjfaslkdjfsadklfjaskldfjsakldfjaslkdfjasklfjaskldfsjfdljaslkdjfaslkdjfsadklfjaskldfjsakldfjaslkdfjasklfjaskldfsjfdljaslkdjfaslkdjfsadklfjaskldfjsakldfjaslkdfjasklfjaskldfsjfdljaslkdjfaslkdjfsadklfjaskldfjsakldfjaslkdfjasklfjaskldfsjfdljaslkdjfaslkdjfsadklfjaskldfjsakldfjaslkdfjasklfjaskldfsjfdljaslkdjfaslkdjfsadklfjaskldfjsakldfjaslkdfjasklfjaskldfsjfdljaslkdjfaslkdjf';
                        B.Data2 := 'sadklfjaskldfjsakldfjaslkdfjasklfjaskldfsjfdljaslkdjfaslkdjfsadklfjaskldfjsakldfjaslkdfjasklfjaskldfsjfdljaslkdjfaslkdjfsadklfjaskldfjsakldfjaslkdfjasklfjaskldfsjfdljaslkdjfaslkdjfsadklfjaskldfjsakldfjaslkdfjasklfjaskldfsjfdljaslkdjfaslkdjfsadklfjaskldfjsakldfjaslkdfjasklfjaskldfsjfdljaslkdjfaslkdjfsadklfjaskldfjsakldfjaslkdfjasklfjaskldfsjfdljaslkdjfaslkdjfsadklfjaskldfjsakldfjaslkdfjasklfjaskldfsjfdljaslkdjfaslkdjfsadklfjaskldfjsakldfjaslkdfjasklfjaskldfsjfdljaslkdjfaslkdjfsadklfjaskldfjsakldfjaslkdfjasklfjaskldfsjfdljaslkdjfaslkdjfsadklfjaskldfjsakldfjaslkdfjasklfjaskldfsjfdljaslkdjfaslkdjfsadklfjaskldfjsakldfjaslkdfjasklfjaskldfsjfdljaslkdjfaslkdjfsadklfjaskldfjsakldfjaslkdfjasklfjaskldfsjfdljaslkdjfaslkdjfsadklfjaskldfjsakldfjaslkdfjasklfjaskldfsjfdljaslkdjfaslkdjfsadklfjaskldfjsakldfjaslkdfjasklfjaskldfsjfdljaslkdjfaslkdjfsadklfjaskldfjsakldfjaslkdfjasklfjaskldfsjfdljaslkdjfaslkdjf';

                        // if not B.Insert() then
                        //     error('Big trouble!!!!');

                        B.Insert();

                    end;
                    Commit();
                    Message('Total time for %1 = %2', i, CurrentDateTime() - Start);
                end;
            }
        }
    }
}
