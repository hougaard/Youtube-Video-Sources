// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage()
    var
        Words: List of [Text];
        Lines: List of [Text];
        WordPointer: Integer;
        Builder: TextBuilder;
    begin
        Words := GetText().Split(' ');
        for WordPointer := 1 to Words.Count() do begin
            if Builder.Length() > 0 then
                Builder.Append(' ');
            Builder.Append(Words.Get(WordPointer));
            if Builder.Length() > 80 then begin
                Lines.Add(Builder.ToText());
                Clear(Builder);
            end;
        end;
        If Builder.Length() > 0 then
            Lines.Add(Builder.ToText());
        Message('%1\%2\%3', Lines.Get(1), Lines.Get(2), Lines.Get(3));
    end;

    procedure GetText(): Text
    begin
        exit('Now updated for the 2022 Wave 2 release. A companion book for implementing Microsoft Dynamics 365 Business Central. Targeted end-users, super-users and administrators, this book covers many of the challenges you''re faced when implementing a cloud-based ERP system. From setting up the system and creating the first company to user customizations and integration. Business Central used to be Dynamics NAV and before that Navision. NAV has always been a partner-driven application. Customers buy the software from a partner, and the partner helps with implementation. A great model that has worked for over a million users across the globe. Now Business Central is a cloud offering; there''s no longer an installation. You no longer need an IT guy to install it and then a consultant to help you set it up. You can do that yourself. Most customers still choose to get consultants to help to make sure you’re doing it right and to ensure a great start. This book is written to help customers who venture into Business Central, with or without external help. Written to help understand the system and ensure a great experience starting with Business Central. The book is not written to be read from cover to cover. Instead, it''s meant to be a Field Guide. A companion book to help you through the implementation. And later, when you need information on a specific topic or if you need a bit of inspiration. The documentation from Microsoft is pretty good, and I''ll provide links for deep dives and background information. Business Central covers a vast area of functionality, and the book includes the areas and issues I encounter in my daily work with Business Central customers. I''ll add new chapters and details based on my experience and reader feedback. I''m using an English language layer on my Business Central throughout this book.');
    end;
}