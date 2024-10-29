page 50100 "User Management"
{
    ApplicationArea = All;
    Caption = 'User Management';
    PageType = List;
    SourceTable = User;
    UsageCategory = Administration;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("User Name"; Rec."User Name")
                {
                    Width = 5;
                }
                field("Full Name"; Rec."Full Name")
                {
                    Width = 10;
                }
                field(State; Rec.State)
                {
                    Width = 5;
                }
                field(SettingsCtl; Settings)
                {
                    Editable = false;
                    Caption = 'Settings';
                    Width = 1;
                    trigger OnDrillDown()
                    var
                        UserSettings: Record "User Personalization";
                    begin
                        UserSettings.Setrange("User SID", Rec."User Security ID");
                        Page.RunModal(Page::"User Personalization", UserSettings);
                        CurrPage.Update();
                    end;
                }
                field(AccountingSetupCtl; AccountingSetup)
                {
                    Editable = false;
                    Caption = 'Accounting';
                    Width = 1;
                    trigger OnDrillDown()
                    var
                        U: Record "User Setup";
                    begin
                        U.Setrange("User ID", Rec."User Name");
                        Page.RunModal(Page::"User Setup", U);
                        CurrPage.Update();
                    end;
                }
                field(ApprovalCtl; Approval)
                {
                    Editable = false;
                    Caption = 'Approval';
                    Width = 1;
                    trigger OnDrillDown()
                    var
                        U: Record "User Setup";
                    begin
                        U.Setrange("User ID", Rec."User Name");
                        Page.RunModal(Page::"Approval User Setup", U);
                        CurrPage.Update();
                    end;
                }
                field(WarehouseCtl; Warehouse)
                {
                    Editable = false;
                    Caption = 'Warehouse';
                    Width = 1;
                    trigger OnDrillDown()
                    var
                        U: Record "Warehouse Employee";
                    begin
                        U.Setrange("User ID", Rec."User Name");
                        Page.RunModal(Page::"Warehouse Employees", U);
                        CurrPage.Update();
                    end;
                }
                field(FACtl; FA)
                {
                    Editable = false;
                    Caption = 'Fixed Assets';
                    Width = 1;
                    trigger OnDrillDown()
                    var
                        U: Record "FA Journal Setup";
                    begin
                        U.Setrange("User ID", Rec."User Name");
                        Page.RunModal(Page::"FA Journal Setup", U);
                        CurrPage.Update();
                    end;
                }
                field(ResourceCtl; Resource)
                {
                    Editable = false;
                    Caption = 'Resource';
                    Width = 1;
                    trigger OnDrillDown()
                    var
                        U: Record Resource;
                    begin
                        U.Setrange("No.", Rec."User Name");
                        Page.RunModal(Page::"Resource Card", U);
                        CurrPage.Update();
                    end;
                }
                field(EmployeeCtl; Employee)
                {
                    Editable = false;
                    Caption = 'Employee';
                    Width = 1;
                    trigger OnDrillDown()
                    var
                        U: Record Employee;
                    begin
                        U.Setrange("No.", Rec."User Name");
                        Page.RunModal(Page::"Employee Card", U);
                        CurrPage.Update();
                    end;
                }
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        UpdateGlobals();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        UpdateGlobals();
    end;

    local procedure UpdateGlobals()
    var
        UserSettings: Record "User Personalization";
        UserSetup: Record "User Setup";
        WarehouseEmployee: Record "Warehouse Employee";
        FASetup: Record "FA Journal Setup";
        ResourceRec: Record Resource;
        EmployeeRec: Record Employee;
    begin
        UserSettings.Setrange("User SID", Rec."User Security ID");
        if UserSettings.IsEmpty() then
            Settings := '❌'
        else
            Settings := '✅';
        UserSetup.Setrange("User ID", Rec."User Name");
        If UserSetup.IsEmpty() then
            AccountingSetup := '❌'
        else
            AccountingSetup := '✅';
        Approval := '❌';
        If UserSetup.FindFirst() then
            if (UserSetup."Sales Amount Approval Limit" <> 0) or
               (UserSetup."Purchase Amount Approval Limit" <> 0) or
               (UserSetup."Unlimited Sales Approval") or
               (UserSetup."Unlimited Purchase Approval") or
               (UserSetup."Unlimited Request Approval") or
               (UserSetup."Unlimited Request Approval") or
               (UserSetup."Approver ID" <> '') then
                Approval := '✅';
        WarehouseEmployee.Setrange("User ID", Rec."User Name");
        if WarehouseEmployee.IsEmpty() then
            Warehouse := '❌'
        else
            Warehouse := '✅';
        FASetup.Setrange("User ID", Rec."User Name");
        if FASetup.IsEmpty() then
            FA := '❌'
        else
            FA := '✅';
        ResourceRec.Setrange("No.", Rec."User Name");
        if ResourceRec.IsEmpty() then
            Resource := '❌'
        else
            Resource := '✅';
        EmployeeRec.Setrange("No.", Rec."User Name");
        if EmployeeRec.IsEmpty() then
            Employee := '❌'
        else
            Employee := '✅';
    end;

    var
        Settings: Text;
        AccountingSetup: Text;
        Approval: Text;
        Warehouse: Text;
        FA: Text;
        Resource: Text;
        Employee: Text;
}
