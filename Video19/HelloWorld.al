// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50120 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        base64: Codeunit "Base64 Convert";
        Base64_erik: Codeunit "Base64 Implem. Erik";
        Test: Codeunit "Base64 Convert Test";
        base64_str: Text;
        raw_str: Text;
    begin
        // raw_str := 'ÆØÅæøå';
        // base64_str := Base64_erik.ToBase64(raw_str, TextEncoding::UTF16);

        // Message('Raw=%1 BC=%2, Erik=%3', base64_str, base64.FromBase64(base64_str), Base64_erik.FromBase64(base64_str, TextEncoding::UTF16));
        Test.FromBase64UTF16StringTest();
    end;
}