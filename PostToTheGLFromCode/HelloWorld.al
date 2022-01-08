// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CharOfA extends "Chart of Accounts"
{
    actions
    {
        addfirst(processing)
        {
            action(Test)
            {
                Caption = 'Post something';
                ApplicationArea = all;
                trigger OnAction()
                var
                    GLPost: Codeunit "Gen. Jnl.-Post Line";
                    Line: Record "Gen. Journal Line";
                begin
                    Line.Init();
                    Line."Posting Date" := TODAY();
                    Line."Document Type" := Line."Document Type"::" ";
                    Line."Document No." := 'X000004';
                    Line."Account Type" := Line."Account Type"::"G/L Account";
                    Line."Account No." := '10910';
                    Line.Description := 'Youtube Testing';
                    Line.Amount := 70;
                    // Line."Bal. Account Type" := LIne."Bal. Account Type"::"G/L Account";
                    // Line."Bal. Account No." := '10920';
                    GLPost.RunWithCheck(Line);

                    Line.Init();
                    Line."Posting Date" := TODAY();
                    Line."Document Type" := Line."Document Type"::" ";
                    Line."Document No." := 'X000004';
                    Line."Account Type" := Line."Account Type"::"G/L Account";
                    Line."Account No." := '10920';
                    Line.Description := 'Youtube Testing';
                    Line.Amount := -30;
                    // Line."Bal. Account Type" := LIne."Bal. Account Type"::"G/L Account";
                    // Line."Bal. Account No." := '10920';
                    GLPost.RunWithCheck(Line);

                    Line.Init();
                    Line."Posting Date" := TODAY();
                    Line."Document Type" := Line."Document Type"::" ";
                    Line."Document No." := 'X000004';
                    Line."Account Type" := Line."Account Type"::"G/L Account";
                    Line."Account No." := '10940';
                    Line.Description := 'Youtube Testing';
                    Line.Amount := -41;
                    // Line."Bal. Account Type" := LIne."Bal. Account Type"::"G/L Account";
                    // Line."Bal. Account No." := '10920';
                    GLPost.RunWithCheck(Line);


                end;
            }
        }
    }
}