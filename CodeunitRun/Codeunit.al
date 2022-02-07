codeunit 50800 "Problematic Codeunit"
{
    trigger OnRun()
    begin
        error('BIG PROBLEMS!!!');

        Message('Hello World!');
    end;
}