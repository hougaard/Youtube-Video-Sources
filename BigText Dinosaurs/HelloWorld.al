// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        BT: BigText;
        s: Text;
        TB: TextBuilder;
        InS: InStream;
        OutS: OutStream;
    begin
        BT.AddText('Erik');
        BT.AddText(' ');
        BT.AddText('Hougaard');
        s := 'Erik';
        s := s + ' ';
        s := s + 'Hougaard';

        BT.Read(InS);
        InS.Read(s);

        BT.Write(OutS);
        OutS.Write(s);


        TB.Append('Erik');
        TB.Append(' ');
        TB.Append('Hougaard');
        message(format(TB));
    end;
}