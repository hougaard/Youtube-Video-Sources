codeunit 50138 "Variant Test"
{
    TableNo = 27;

    trigger OnRun()
    begin
        Message(format(Rec));
    end;

    procedure Test()
    var
        c: Record Customer;
        v: Record Vendor;
        I: Record Item;
        D: Date;
    begin
        D := Today();
        C.FindFirst();
        V.FindLast();
        I.FindFirst();
        //LogInformation(C);
        LogInformation(V);
        //LogInformation(I);
        // LogInformation(D);
    end;

    procedure LogInformation(v: Variant)
    var
        ref: RecordRef;
        c: Record Customer;
        codeunitNo: Integer;
    begin
        if not v.IsRecord then
            error('You cannot pass a non-record variable to LogInformation');
        ref.GetTable(v);

        //v := ref;

        // if ref.Number = 18 then
        //     c := v;

        //Page.RunModal(0, v);
        codeunitNo := 50138;
        Codeunit.Run(codeunitNo, v);

    end;
}