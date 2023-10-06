page 50100 MyDataView
{
    ApplicationArea = All;
    Caption = 'MyDataView';
    PageType = List;
    SourceTable = MyData2;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Customer; Rec.Customer)
                {
                }
                field(When; Rec.When)
                {
                }
                field(What; Rec.What)
                {
                }
            }
        }
    }
}
