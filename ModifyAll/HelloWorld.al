// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 VEndorListExt extends "Vendor List"
{
    trigger OnOpenPage()
    begin
        Rec.ModifyAll(Name, '123 Best Street', true);
        Rec.ModifyAll(Address, '234 Another Steet', true);

        Rec.SetRange();
        Rec.SetFilter();
        if Rec.FindSet(true) then
            repeat
                Rec.validate(Name,'123 Best Street');
                Rec.Address := '234 Another Steet';
                Rec.Modify(true);
            until Rec.Next() = 0;
        // if Rec.FindSet(true) then
        //     repeat
        //         Rec.Address := '234 Another Steet';
        //         Rec.Modify(true);
        //     until Rec.Next() = 0;

    end;
}