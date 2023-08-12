pageextension 50132 CustomerListExt extends "Customer List"
{
    layout
    {
        addlast(content)
        {
            usercontrol(popup; popup)
            {
                ApplicationArea = all;
            }
        }
    }
    actions
    {
        addfirst(processing)
        {
            action(PopupAction)
            {
                Caption = 'Pop-up';
                ApplicationArea = all;
                trigger OnAction()
                var
                    URL: Text;
                    Rec2: Record Customer;
                begin
                    //rec2.Setrange("No.", Rec."No.");
                    Rec2.Setfilter(Name, 'B*');
                    URL := GetUrl(ClientType::Current, CompanyName, ObjectType::Page, Page::"Customer List", Rec2, true);
                    URL += '&mode=View&captionhelpdisabled=0&showribbon=0&shownavigation=0&showuiparts=0&showheader=0&redirect=0';
                    CurrPage.popup.popup(URL);
                end;
            }
        }
    }
}