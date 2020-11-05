page 52300 "Integer Page"
{
    PageType = List;
    SourceTable = Integer;
    SourceTableView = where(Number = filter('-7..40'));
    layout
    {
        area(Content)
        {
            repeater(Rep)
            {
                field(Number; GetValue(Rec.Number))
                {
                    Caption = 'This is the caption!';
                    ApplicationArea = all;
                }
            }
        }
    }
    procedure GetValue(i: integer): Text
    begin
        if Dict.ContainsKey(i) then
            exit(Dict.Get(i));
    end;

    trigger OnOpenPage()
    begin
        Dict.Add(-1, 'Peter');
        Dict.Add(2, 'Jens');
        Dict.Add(-3, 'Viggo');
        Dict.Add(4, 'Karin');
        Dict.Add(-5, 'Sofie');
        Dict.Add(6, 'Sigurd');
        Dict.Add(7, 'Owen');
        Dict.Add(8, 'Jack');
        Dict.Add(9, 'Hank');
        Dict.Add(10, 'Will');
        Dict.Add(11, 'Bill');
        Dict.Add(12, 'Olena');
        Dict.Add(13, 'Henrik');
        Dict.Add(14, 'Jesper');
        Dict.Add(15, 'Anders');
        Dict.Add(16, 'Hougaard');
        Dict.Add(17, 'Erik');
        Dict.Add(18, 'Alice');
        Dict.Add(19, 'Inger');
        Dict.Add(20, 'Anton');
        Dict.Add(21, 'Rikke');
        Dict.Add(22, 'Maria');
        Dict.Add(23, 'Carl');
        Dict.Add(24, 'Mozart');
        Dict.Add(25, 'Amadeus');
        Dict.Add(26, 'Buzz');
        Dict.Add(27, 'Louis');
        Dict.Add(28, 'Lance');
        Dict.Add(29, 'Wergner');
        Dict.Add(30, 'Blackadder');
        Dict.Add(31, 'Baldrick');
        Dict.Add(32, 'Percy');
        Dict.Add(33, 'Harry');
    end;

    var
        Dict: Dictionary of [Integer, Text];
}