codeunit 50148 "AL Config Generator"
{
    procedure CreateConfigPackage()
    var
        ConfigPackage: Record "Config. Package";
    begin
        ConfigPackage.Init();
        ConfigPackage.Validate(Code, 'YOUTUBE');
        ConfigPackage.Insert(true);
        ConfigPackage.Validate("Package Name", 'Youtube Video Example');
        ConfigPackage.Validate("Exclude Config. Tables", true);
        ConfigPackage.Validate("Product Version", 'YOU1.0');
        ConfigPackage.Modify(true);

        AddTableToConfigPackage(ConfigPackage, DATABASE::Customer);
        AddTableToConfigPackage(ConfigPackage, DATABASE::Vendor);
        AddTableToConfigPackage(ConfigPackage, DATABASE::Item);
        AddTableToConfigPackage(ConfigPackage, DATABASE::Resource);
    end;

    procedure AddTableToConfigPackage(CP: Record "Config. Package"; TableNo: Integer)
    var
        ConfigTable: Record "Config. Package Table";
    begin
        ConfigTable.Init();
        ConfigTable."Package Code" := CP.Code;
        ConfigTable.Validate("Table ID", TableNo);
        ConfigTable.Insert(true);
        ConfigTable.Validate("Skip Table Triggers", true);
        ConfigTable.Modify(true);
    end;
}