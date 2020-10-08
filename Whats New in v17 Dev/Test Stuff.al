codeunit 50121 "Test Stuff in v17"
{

    [CommitBehavior(CommitBehavior::Ignore)]
    procedure testfunction()
    var
        GL : Record "G/L Entry";
    begin
        GL.SetLoadFields("My ID");
        if gl.findset() then
            repeat
            
            until gl.next() = 0;
    end;

    procedure CommittingFunction()
    begin
        COmmit();
    end;
}