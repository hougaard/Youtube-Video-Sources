codeunit 50100 "Our Checklist Events"
{

    [EventSubscriber(ObjectType::Codeunit, Codeunit::LogInManagement, 'OnAfterLogInStart', '', true, true)]
    local procedure InitializeChecklist()
    var
        TempAllProfile: Record "All Profile" temporary;
        Checklist: Codeunit Checklist;
        GuidedExperienceType: Enum "Guided Experience Type";
    begin
        GetRoles(TempAllProfile);

        Checklist.Insert(GuidedExperienceType::"Manual Setup", ObjectType::Page, Page::"General Ledger Setup", 1500, TempAllProfile, false);
    end;

    local procedure GetRoles(var TempAllProfile: Record "All Profile" temporary)
    begin
        AddRoleToList(TempAllProfile, Page::"Business Manager Role Center");
    end;

    local procedure AddRoleToList(var TempAllProfile: Record "All Profile" temporary; RoleCenterID: Integer)
    var
        AllProfile: Record "All Profile";
    begin
        AllProfile.SetRange("Role Center ID", RoleCenterID);
        if AllProfile.FindFirst() then begin
            TempAllProfile.TransferFields(AllProfile);
            TempAllProfile.Insert();
        end;
    end;
}