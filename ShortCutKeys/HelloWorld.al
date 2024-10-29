// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

namespace DefaultPublisher.ShortCutKeys;

using Microsoft.Inventory.Item;

pageextension 50100 ItemCardExt extends "Item Card"
{
    actions
    {
        addlast(processing)
        {
            action(Test)
            {
                Caption = 'Test';
                ApplicationArea = all;
                ShortcutKey = 'Ctrl+U';
                trigger OnAction()
                begin
                    message('hello!');
                end;
            }
            action(Test2)
            {
                Caption = 'Test 2';
                ApplicationArea = all;
                ShortcutKey = 'F9';
                trigger OnAction()
                begin
                    message('hello 2!');
                end;
            }
        }
    }
}