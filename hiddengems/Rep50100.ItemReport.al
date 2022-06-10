report 50100 "Item Report"
{
    ApplicationArea = All;
    Caption = 'Item Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = "word.docx";
    dataset
    {
        dataitem(Item; Item)
        {
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }

    rendering
    {
        layout("word.docx")
        {
            Type = Word;
            LayoutFile = 'word.docx';
        }
        layout("rdlc.rdlc")
        {
            Type = RDLC;
            LayoutFile = 'rdlc.rdlc';
        }
    }
}
