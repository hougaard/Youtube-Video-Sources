page 50101 "Page Type Part"
{
    PageType = CardPart;
    SourceTable = Customer;
    ModifyAllowed = true;
    layout
    {
        area(Content)
        {
            field(Name; Name)
            {
                ApplicationArea = all;
                Editable = true;
            }
            field(Address; Address)
            {
                ApplicationArea = all;
                Editable = true;
            }
        }
    }
}