// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        TypeHelper: Codeunit "Type Helper";
        i: Integer;
        d: Decimal;
        t: Text;
        V: Variant;
        CultureInfo: Text;
    begin
        CultureInfo := TypeHelper.LanguageIDToCultureName(1030);
        t := '10.000,5';

        //TypeHelper.UrlEncode(t);
        t := TypeHelper.UrlEncode(t);

        // //Evaluate(d, t);
        V := d;
        TypeHelper.Evaluate(V, t, 'G', CultureInfo);
        d := V;
        message('Result = %1 (%2)', d, TypeHelper.FormatDecimal(d, 'G', CultureInfo));
    end;
}