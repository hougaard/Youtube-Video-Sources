// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    layout
    {
        addfirst(content)
        {
            usercontrol(clickme; "Microsoft.Dynamics.Nav.Client.WebPageViewer")
            {
                ApplicationArea = all;
                trigger ControlAddInReady(callbackUrl: Text)
                begin
                    //CurrPage.clickme.SetContent('<button onclick="window.parent.WebPageViewerHelper.TriggerCallback(''clicked'');">Click Me!</button>');
                    CurrPage.clickme.SetContent(StrSubstNo('<textarea Id="TextArea" style="width:100%;height:100%;resize: none; font-size: 10.5pt !important; font-family: monospace;" OnChange="window.parent.WebPageViewerHelper.TriggerCallback(document.getElementById(''TextArea'').value)">%1</textarea>', 'Erik Hougaard\YouTube Video\hougaard.com\Simple Object Designer'));
                end;

                trigger Callback(data: Text)
                begin
                    message(data);
                end;
            }
        }
    }
}