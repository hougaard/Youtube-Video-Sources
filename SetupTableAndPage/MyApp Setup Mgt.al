codeunit 50600 "MyApp Mgt"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Guided Experience", 'OnRegisterAssistedSetup', '', true, true)]
    local procedure MyAppSetupRegister()
    var
        GuideExperience: Codeunit "Guided Experience";
    begin
        GuideExperience.InsertAssistedSetup('MyApp Setup', 'The best app', 'An even better app', 2, ObjectType::Page, Page::"MyApp Setup", enum::"Assisted Setup Group"::Analysis, 'https://youtube.com/hougaard', Enum::"Video Category"::Analysis, 'https://www.hougaard.com');
    end;
}