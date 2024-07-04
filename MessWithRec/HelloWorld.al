// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

namespace DefaultPublisher.MessWithRec;

using Microsoft.Sales.Customer;

pageextension 50100 CustomerListExt extends "Customer List"
{
    actions
    {
        addfirst(processing)
        {
            action(Test)
            {
                Caption = 'Youtube Test';
                ApplicationArea = all;
                trigger OnAction()
                var
                    NewRec: Record Customer;
                begin
                    //NewRec.CopyFilters(Rec);
                    CurrPage.SetSelectionFilter(NewRec);
                    Message('%1 count=%2', NewRec.GetFilters(), NewRec.Count());
                    if NewRec.FindSet() then
                        repeat
                            // Fancy Processing
                            NewRec."Name 2" := NewRec.Name;
                            NewRec.Modify();
                        until NewRec.Next() = 0;
                    // Here, Rec is the last record within the current filters
                end;
            }
        }
    }
}