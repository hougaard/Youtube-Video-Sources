page 50100 "Test Page"
{
    layout
    {
        area(Content)
        {

        }
    }
    trigger OnOpenPage()
    var
        Q: Query "Query Test";

    begin
        Q.Open();
        while Q.Read() do begin
            Message('%1 %2 %3', Q.DocumentType, Q.No, Q.TypeNo);
        end;

        Q.Close();
    end;
}