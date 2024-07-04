// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

namespace DefaultPublisher.PlaceHolderText;

using Microsoft.Sales.Customer;

page 50100 "My Card"
{
    SourceTable = Customer;
    PageType = Card;
    layout
    {
        area(Content)
        {

            field("No."; Rec."No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the number of the customer. The field is either filled automatically from a defined number series, or you enter the number manually because you have enabled manual number entry in the number-series setup.';
            }
            field(Name; Rec.Name)
            {
                ShowCaption = false;
                InstructionalText = 'Name';
                ApplicationArea = All;
                ToolTip = 'Specifies the name of the customer.';
            }
            field("Name 2"; Rec."Name 2")
            {
                ApplicationArea = All;
                ShowCaption = false;
                ToolTip = 'Specifies an additional part of the name.';
            }
            field(Address; Rec.Address)
            {
                InstructionalText = 'Address';
                ShowCaption = false;
                ApplicationArea = All;
                ToolTip = 'Specifies the customer''s address. This address will appear on all sales documents for the customer.';
            }
            field("Address 2"; Rec."Address 2")
            {
                ApplicationArea = All;
                ShowCaption = false;
                ToolTip = 'Specifies additional address information.';
            }
            field(City; Rec.City)
            {
                InstructionalText = 'City';
                ApplicationArea = All;
                ShowCaption = false;
                ToolTip = 'Specifies the customer''s city.';
            }
            field("Post Code"; Rec."Post Code")
            {
                InstructionalText = 'Postal Code';
                ApplicationArea = All;
                ShowCaption = false;
                ToolTip = 'Specifies the postal code.';
            }
            field(County; Rec.County)
            {
                InstructionalText = 'State';
                ApplicationArea = All;
                ShowCaption = false;
                ToolTip = 'Specifies the state, province or county as a part of the address.';
            }
            field("Country/Region Code"; Rec."Country/Region Code")
            {
                InstructionalText = 'Country';
                ApplicationArea = All;
                ShowCaption = false;
                ToolTip = 'Specifies the country/region of the address.';
            }
        }
    }
}

// pageextension 50100 CustomerListExt extends "Customer Card"
// {
//     layout
//     {
//         modify("Address 2")
//         {
//             InstructionalText = 'Suite No. or flat No.';
//         }
//     }
// }