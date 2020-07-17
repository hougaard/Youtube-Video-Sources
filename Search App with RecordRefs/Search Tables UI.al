page 51100 "Search Tables"
{

    ApplicationArea = All;
    Caption = 'Search Setup';
    PageType = List;
    SourceTable = "Search Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Table No."; "Table No.")
                {
                    ApplicationArea = All;
                }
                field("Search Primary Key"; "Search Primary Key")
                {
                    ApplicationArea = All;
                }
                field("Full Text Search"; "Full Text Search")
                {
                    ApplicationArea = All;
                }
                field("Card Page"; "Card Page")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}
