codeunit 50104 "Upgrade 1"
{
    Subtype = Upgrade;

    trigger OnUpgradePerCompany()
    var
        Old: Record MyData;
        New: Record MyData2;
        Tag: Codeunit "Upgrade Tag";
        MyTag: Label 'MYDATA_UPGRADE1';
    begin
        if Tag.HasUpgradeTag(MyTag) then
            exit;
        if Old.FindSet() then
            repeat
                New.Init();
                New.Customer := Old.Customer;
                New.When := CreateDateTime(Old.When, 0T);
                New.What := Old.What;
                New.Insert();
            until Old.Next() = 0;
        Tag.SetUpgradeTag(MyTag);
    end;


}