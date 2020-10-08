controladdin ALTrisControl
{
    StartupScript = 'JavaScript\STQ_startup.js';
    Scripts = 'JavaScript\STQ_scripts.js';
    HorizontalStretch = true;
    VerticalStretch = true;
    RequestedHeight = 400;
    event ControlReady();
    event NewGame();
    event TimerElapsed();
    event OnKeyDown(KeyCode: Text);
    procedure Render(HTML: Text);
    procedure SetBGColor(ElementId: Text; Color: Text);
    procedure SetElementValue(ElementId: Text; ElementValue: Text);
    procedure StartTimer(MilliSeconds: Integer);
    procedure StopTimer();
    procedure SetElementDisabled(ElementId: Text; Disabled: Boolean);
    procedure Beep(Volume: Integer; Frequence: Integer; MilliSeconds: Integer);
}
page 50100 STQ_ALTris
{
    Caption = 'ALTris';
    UsageCategory = Tasks;
    ApplicationArea = All;
    ShowFilter = false;
    LinksAllowed = false;
    layout
    {
        area(Content)
        {
            usercontrol(ALTris; ALTrisControl)
            {
                ApplicationArea = All;
                trigger ControlReady()
                begin
                    GlobalIsGameOver := true;
                    CurrPage.ALTris.Render(GeneratePageHTML());
                end;

                trigger NewGame()
                var
                    X: Integer;
                    Y: Integer;
                begin
                    CurrPage.ALTris.SetElementDisabled(NewGameButtonElementIdLbl, true);
                    Randomize();
                    GlobalPlayField := '';
                    for X := 1 to 10 do
                        for Y := 1 to 20 do begin
                            SetBoardCell(PlayFieldElementIdLbl, X, Y, GetPieceColor(''));
                            GlobalPlayField += '_';
                        end;
                    GlobalIsGameOver := FALSE;
                    GlobalNoOfPieces := 0;
                    GlobalPoints := 0;
                    GlobalSpeed := 5;
                    CurrPage.ALTris.StartTimer(GlobalSpeed);
                end;

                trigger TimerElapsed()
                var
                    GameOverLbl: label 'GAME OVER';
                begin
                    CurrPage.ALTris.StopTimer();
                    CurrPage.ALTris.SetElementValue(ScoreElementIdLbl, format(GlobalPoints));

                    if GlobalIsGameOver then begin
                        Message(GameOverLbl);
                        exit;
                    end;

                    if GlobalNextPiece = '' then
                        GlobalNextPiece := PickNextPiece();

                    if GlobalPiece = '' then begin
                        NewPiece(GlobalNextPiece, GlobalPiece, GlobalX, GlobalY, GlobalRotation, GlobalNoOfPieces,
                                 GlobalSpeed);
                        if ShowAndMovePiece(GlobalPlayField, GlobalPiece, GlobalX, GlobalY, GlobalRotation,
                                            0, 0, 0) then
                            GameOver(GlobalIsGameOver, GlobalNextPiece, GlobalPiece);
                    end else begin
                        CurrPage.ALTris.Beep(50, 320 + GlobalY * 10, 100);
                        if ShowAndMovePiece(GlobalPlayField, GlobalPiece, GlobalX, GlobalY, GlobalRotation,
                                            0, 1, 0) then begin
                            RemoveFullRows(GlobalPlayField, GlobalPoints, GlobalNoOfPieces);
                            NewPiece(GlobalNextPiece, GlobalPiece, GlobalX, GlobalY, GlobalRotation, GlobalNoOfPieces,
                                     GlobalSpeed);
                            if ShowAndMovePiece(GlobalPlayField, GlobalPiece, GlobalX, GlobalY, GlobalRotation,
                                                0, 0, 0) then
                                GameOver(GlobalIsGameOver, GlobalNextPiece, GlobalPiece);
                        end;
                    end;
                    CurrPage.ALTris.StartTimer(GlobalSpeed);
                end;

                trigger OnKeyDown(KeyCode: Text)
                begin
                    if GlobalIsGameOver then
                        exit;
                    case KeyCode of
                        'ArrowDown':
                            begin
                                CurrPage.ALTris.Beep(100, 320 + GlobalY * 10, 50);
                                ShowAndMovePiece(GlobalPlayField, GlobalPiece, GlobalX, GlobalY, GlobalRotation,
                                                 0, 1, 0);
                                GlobalPoints += GlobalNoOfPieces * 10;
                            end;
                        'ArrowRight':
                            ShowAndMovePiece(GlobalPlayField, GlobalPiece, GlobalX, GlobalY, GlobalRotation,
                                             1, 0, 0);
                        'ArrowLeft':
                            ShowAndMovePiece(GlobalPlayField, GlobalPiece, GlobalX, GlobalY, GlobalRotation,
                                             -1, 0, 0);
                        'Space':
                            ShowAndMovePiece(GlobalPlayField, GlobalPiece, GlobalX, GlobalY, GlobalRotation,
                                             0, 0, 1);
                    end;
                end;
            }
        }
    }

    local procedure GeneratePageHTML() HTML: text
    var
        GameNameLbl: label 'ALTris';
        NextPieceLbl: label 'Next piece';
        ScoreLbl: label 'Score';
    begin
        HTML := StrSubstNo('<table>' +
                           '  <tr>' +
                           '    <td width="200" valign="top"><b>%1</b><br>%2</td>' +
                           '    <td width="25"/>' +
                           '    <td valign="top">' +
                           '      <table>' +
                           '        <tr>' +
                           '          <td width="220" valign="top">' +
                           '            <table><tr>' +
                           '              <td width="100" valign="top"><b>%3</b>%4</td>' +
                           '              <td width="20"/>' +
                           '              <td width="100" valign="top">%6</td>' +
                           '              <td width="100">%5</td>' +
                           '            </tr></table>' +
                           '          </td>' +
                           '        </tr>' +
                           '        <tr>' +
                           '          <td valign="top"><br><hr>%7</td>' +
                           '        </tr>' +
                           '      </table>' +
                           '    </td>' +
                           '  </tr>' +
                           '</table>',
                           GameNameLbl,
                           GenerateBoardHTML(10, 20, PlayFieldElementIdLbl),
                           NextPieceLbl,
                           GenerateBoardHTML(4, 2, NextPieceElementIdLbl),
                           StrSubstNo('<button id="%1" onclick="newGame();" style="width: 100px; height: 50px;">New game!</button>',
                                      NewGameButtonElementIdLbl),
                           StrSubstNo('<table><tr><td valign="top"><b>%1</b></td></tr><tr><td valign="top" id="Score">0</td></tr></table>', ScoreLbl),
                           '<b>Controls</b>: Arrow left/right/down and space<br><b>Scoring</b>:Drop pieces and remove lines<hr><br>' +
                           '<b>About this game:</b><br>' +
                             'Author: <a href="mailto:gert@lynge.org">Gert Lynge &lt;gert@lynge.org&gt;</a><br>' +
                             'LinkedIn: <a href="https://www.linkedin.com/in/gertlynge/" target="_new">https://www.linkedin.com/in/gertlynge/</a><br>' +
                             'Blogs: <a href="https://www.dabbler.dk/" target="_new">https://www.dabbler.dk/</a>, ' +
                                    '<a href="https://www.simteq.com/technical-blog/" target="_new">https://www.simteq.com/technical-blog/</a> and ' +
                                    '<a href="https://scblog.lynge.org/" target="_new">https://scblog.lynge.org/</a><br><br><hr><br>' +
                             'Thanks goes to: Erik Hougaard (<a href="https://www.hougaard.com/" target="_new">https://www.hougaard.com/</a>) for ' +
                             'inspiration and the challange of doing this AL game for Microsoft Dynamics 365 Business Central.<br>' +
                             'I was challanged in the comments for <a href="https://youtu.be/SNWiG9endCc" target="_new">this YouTube video</a>.<br><br>' +
                             '<b>ENJOY the game!!</b>');
    end;

    local procedure GenerateBoardHTML(SizeX: Integer; SizeY: Integer; ElementId: Text) HTML: text
    var
        X: Integer;
        Y: Integer;
    begin
        HTML := '<table style="border-collapse: collapse;">';
        for Y := 1 to SizeY do begin
            HTML += '<tr height="20">';
            for X := 1 to SizeX do
                HTML += StrSubstNo('<td id="%1" style="border:1px solid black;" width="20"/>',
                                   StrSubstNo(ElementId, X, Y));
            HTML += '</tr>';
        end;
        HTML += '</table>';
    end;

    local procedure SetBoardCell(ElementId: Text; X: Integer; Y: Integer; Color: Text)
    begin
        CurrPage.ALTris.SetBGColor(StrSubstNo(ElementId, X, Y), Color);
    end;

    local procedure NewPiece(var NextPiece: Code[1]; var Piece: Code[1]; var X: Integer;
                             var Y: Integer; var Rotation: Integer; var NoOfpieces: Integer;
                             var Speed: Integer)
    begin
        ShowOrClearNextPiece(NextPiece, FALSE);

        Piece := NextPiece;
        if Piece = 'O' then
            X := 5
        else
            X := 4;
        Y := 1;
        Rotation := 1;
        NextPiece := PickNextPiece();
        ShowOrClearNextPiece(NextPiece, TRUE);
        NoOfPieces += 1;
        Speed := 500 - NoOfPieces * 5;
        if Speed < 1 then
            Speed := 1;
    end;

    local procedure ShowOrClearNextPiece(Piece: Code[1]; Show: Boolean)
    var
        CoordPairs: array[8] of Integer;
        PieceColor: Text;
        i: Integer;
        DeltaX: Integer;
    begin
        if Show then
            PieceColor := GetPieceColor(Piece)
        else
            PieceColor := GetPieceColor('');
        GetPieceCoord(Piece, 1, CoordPairs);
        if Piece = 'O' then
            DeltaX := 1;
        for i := 0 to 3 do
            SetBoardCell(NextPieceElementIdLbl, GetCoordPairX(CoordPairs, i) + DeltaX + 1,
                         GetCoordPairY(CoordPairs, i) + 1, PieceColor);
    end;

    local procedure ShowAndMovePiece(var PlayField: Code[200]; Piece: Code[1]; var X: Integer; var Y: Integer;
                                     var Rotation: Integer; DeltaX: Integer; DeltaY: Integer;
                                     DeltaRotation: Integer) Landed: Boolean
    var
        CoordPairs: array[8] of Integer;
        PreviousRotation: Integer;
        i: Integer;
    begin
        GetPieceCoord(Piece, Rotation, CoordPairs);
        if (DeltaX <> 0) or (DeltaY <> 0) or (DeltaRotation <> 0) then
            UpdatePlayField(CoordPairs, '_', X, Y, PlayField);
        if DeltaRotation <> 0 then begin
            PreviousRotation := Rotation;
            Rotation += DeltaRotation;
            if (Rotation > 4) then
                Rotation := 1;
            GetPieceCoord(Piece, Rotation, CoordPairs);
            for i := 0 to 3 do begin
                while (X + GetCoordPairX(CoordPairs, i) > 10) do
                    X -= 1;
                if (X < 1) or not IsPlayFieldCellEmpty(CoordPairs, i, PlayField, X, Y) then begin
                    Rotation := PreviousRotation;
                    GetPieceCoord(Piece, Rotation, CoordPairs);
                    break;
                end;
            end;
        end;
        if (X > 0) and (DeltaX <> 0) then begin
            X += DeltaX;
            for i := 0 to 3 do
                if (X < 1) or (X + GetCoordPairX(CoordPairs, i) > 10) or
                   not IsPlayFieldCellEmpty(CoordPairs, i, PlayField, X, Y) then begin
                    X -= DeltaX;
                    break;
                end;
        end;
        if Y > 0 then begin
            Y += DeltaY;
            for i := 0 to 3 do
                if (Y + GetCoordPairY(CoordPairs, i) > 20) or
                   not IsPlayFieldCellEmpty(CoordPairs, i, PlayField, X, Y) then begin
                    Y -= DeltaY;
                    Landed := true;
                    break;
                end;
        end;
        UpdatePlayField(CoordPairs, Piece, X, Y, PlayField);
    end;

    local procedure UpdatePlayField(CoordPairs: array[8] of Integer; Piece: Code[1]; X: Integer; Y: Integer; var PlayField: Code[200])
    var
        PieceColor: Text;
        i: Integer;
    begin
        PieceColor := GetPieceColor(Piece);
        for i := 0 to 3 do begin
            SetBoardCell(PlayFieldElementIdLbl, X + GetCoordPairX(CoordPairs, i),
                         Y + GetCoordPairY(CoordPairs, i), PieceColor);
            UpdatePlayFieldArray(PlayField, Piece, X + GetCoordPairX(CoordPairs, i),
                                                   Y + GetCoordPairY(CoordPairs, i));
        end;
    end;

    local procedure RemoveFullRows(var PlayField: Code[200]; var Points: Integer; NoOfpieces: Integer)
    var
        Y: Integer;
        Y2: Integer;
        X: Integer;
        i: Integer;
    begin
        for Y := 1 to 20 do
            if StrPos(CopyStr(PlayField, (Y - 1) * 10 + 1, 10), '_') = 0 then begin
                CurrPage.ALTris.Beep(999, 400, 200);
                Points += NoOfPieces * 100 * (21 - Y);
                if (Y = 20) then
                    Points += NoOfPieces * 10000;
                for Y2 := Y downto 2 do begin
                    i := (Y2 - 1) * 10 + 1;
                    PlayField := InsStr(DelStr(PlayField, i, 10), CopyStr(PlayField, i - 10, 10), i);
                    for X := 1 to 10 do
                        CurrPage.ALTris.SetBGColor(StrSubstNo(PlayFieldElementIdLbl, X, Y2),
                                                   GetPieceColor(GetFromPlayFieldArray(PlayField, X, Y2)));
                end;
                PlayField := '__________' + DelStr(PlayField, 1, 10);
                for X := 1 to 10 do
                    SetBoardCell(PlayFieldElementIdLbl, X, 1, GetPieceColor('_'));
                CurrPage.ALTris.Beep(999, 800, 200);
            end;
    end;

    local procedure GetPieceCoord(Piece: Code[1]; Rotation: Integer; var CoordPairs: array[8] of Integer)
    begin
        case Piece of
            'I':
                case Rotation of
                    1, 3:
                        SetCoordPairs(1, 1,               // ####
                                      2, 1,               // ....
                                      3, 1,               // ....
                                      4, 1, CoordPairs);  // ....
                    2, 4:
                        SetCoordPairs(1, 1,               // #...
                                      1, 2,               // #...
                                      1, 3,               // #...
                                      1, 4, CoordPairs);  // #...
                end;
            'J':
                case Rotation of
                    1:
                        SetCoordPairs(1, 1,               // ###.
                                      2, 1,               // ..#.
                                      3, 1,               // ....
                                      3, 2, CoordPairs);  // ....
                    2:
                        SetCoordPairs(2, 1,               // .#..
                                      2, 2,               // .#..
                                      1, 3,               // ##..
                                      2, 3, CoordPairs);  // ....
                    3:
                        SetCoordPairs(1, 1,               // #...
                                      1, 2,               // ###.
                                      2, 2,               // ....
                                      3, 2, CoordPairs);  // ....
                    4:
                        SetCoordPairs(1, 1,               // ##..
                                      2, 1,               // #...
                                      1, 2,               // #...
                                      1, 3, CoordPairs);  // ....
                end;
            'L':
                case Rotation of
                    1:
                        SetCoordPairs(1, 1,               // ###.
                                      2, 1,               // #...
                                      3, 1,               // ....
                                      1, 2, CoordPairs);  // ....
                    2:
                        SetCoordPairs(1, 1,               // ##..
                                      2, 1,               // .#..
                                      2, 2,               // .#..
                                      2, 3, CoordPairs);  // ....
                    3:
                        SetCoordPairs(3, 1,               // ..#.
                                      1, 2,               // ###.
                                      2, 2,               // ....
                                      3, 2, CoordPairs);  // ....
                    4:
                        SetCoordPairs(1, 1,               // #...
                                      1, 2,               // #...
                                      1, 3,               // ##..
                                      2, 3, CoordPairs);  // ....
                end;
            'O':
                SetCoordPairs(1, 1,                       // ##..
                              2, 1,                       // ##..
                              1, 2,                       // ....
                              2, 2, CoordPairs);          // ....
            'S':
                case Rotation of
                    1, 3:
                        SetCoordPairs(2, 1,               // .##.
                                      3, 1,               // ##..
                                      1, 2,               // ....
                                      2, 2, CoordPairs);  // ....
                    2, 4:
                        SetCoordPairs(1, 1,               // #...
                                      1, 2,               // ##..
                                      2, 2,               // .#..
                                      2, 3, CoordPairs);  // ....
                end;
            'T':
                case Rotation of
                    1:
                        SetCoordPairs(1, 1,               // ###.
                                      2, 1,               // .#..
                                      3, 1,               // ....
                                      2, 2, CoordPairs);  // ....
                    2:
                        SetCoordPairs(2, 1,               // .#..
                                      1, 2,               // ##..
                                      2, 2,               // .#..
                                      2, 3, CoordPairs);  // ....
                    3:
                        SetCoordPairs(2, 1,               // .#..
                                      1, 2,               // ###.
                                      2, 2,               // ....
                                      3, 2, CoordPairs);  // ....
                    4:
                        SetCoordPairs(1, 1,               // #...
                                      1, 2,               // ##..
                                      2, 2,               // #...
                                      1, 3, CoordPairs);  // ....
                end;
            'Z':
                case Rotation of
                    1, 3:
                        SetCoordPairs(1, 1,               // ##..
                                      2, 1,               // .##.
                                      2, 2,               // ....
                                      3, 2, CoordPairs);  // ....
                    2, 4:
                        SetCoordPairs(2, 1,               // .#..
                                      1, 2,               // ##..
                                      2, 2,               // #...
                                      1, 3, CoordPairs);  // ....
                end;
        end;
    end;

    local procedure SetCoordPairs(X1: Integer; Y1: Integer; X2: Integer; Y2: Integer; X3: Integer; Y3: Integer;
                                  X4: Integer; Y4: Integer; var CoordPairs: array[8] of Integer)
    begin
        CoordPairs[1] := X1;
        CoordPairs[2] := Y1;
        CoordPairs[3] := X2;
        CoordPairs[4] := Y2;
        CoordPairs[5] := X3;
        CoordPairs[6] := Y3;
        CoordPairs[7] := X4;
        CoordPairs[8] := Y4;
    end;

    local procedure GetCoordPairX(CoordPairs: array[8] of Integer; Index: Integer) X: Integer
    begin
        exit(CoordPairs[Index * 2 + 1] - 1);
    end;

    local procedure GetCoordPairY(CoordPairs: array[8] of Integer; Index: Integer) X: Integer
    begin
        exit(CoordPairs[Index * 2 + 2] - 1);
    end;

    local procedure GetPieceColor(Piece: Code[1]) Color: text
    begin
        case Piece of
            '':
                exit('white');
            'I':
                exit('cyan');
            'J':
                exit('blue');
            'L':
                exit('orange');
            'O':
                exit('yellow');
            'S':
                exit('green');
            'T':
                exit('purple');
            'Z':
                exit('red');
        end;
    end;

    local procedure PickNextPiece() NextPiece: Code[1]
    var
        PiecesLbl: label 'IJLOSTZ';
    begin
        exit(CopyStr(PiecesLbl, Random(StrLen(PiecesLbl)), 1));
    end;

    local procedure UpdatePlayFieldArray(var PlayField: Code[200]; Piece: Code[1]; X: Integer; Y: Integer)
    var
        i: Integer;
    begin
        i := GetPlayFieldArrayIndex(X, Y);
        PlayField := InsStr(DelStr(PlayField, i, 1), Piece, i);
    end;

    local procedure IsPlayFieldCellEmpty(CoordPairs: array[8] of Integer; Index: integer; PlayField: Code[200];
                                         X: Integer; Y: Integer) IsEmpty: Boolean
    begin
        exit(GetFromPlayFieldArray(PlayField, X + GetCoordPairX(CoordPairs, Index),
                                              Y + GetCoordPairY(CoordPairs, Index)) = '_');
    end;

    local procedure GetFromPlayFieldArray(PlayField: Code[200]; X: Integer; Y: Integer) Piece: Code[1]
    begin
        exit(CopyStr(PlayField, GetPlayFieldArrayIndex(X, Y), 1));
    end;

    local procedure GetPlayFieldArrayIndex(X: Integer; Y: Integer) Index: Integer
    begin
        exit(X + (Y - 1) * 10);
    end;

    local procedure GameOver(var IsGameOver: Boolean; var NextPiece: Code[1]; var Piece: Code[1])
    begin
        CurrPage.ALTris.StopTimer();
        CurrPage.ALTris.Beep(999, 220, 500);
        IsGameOver := true;
        ShowOrClearNextPiece(NextPiece, FALSE);
        NextPiece := '';
        Piece := '';
        CurrPage.ALTris.SetElementDisabled(NewGameButtonElementIdLbl, false);
    end;

    var
        GlobalPlayField: Code[200]; // This is the current playfield (10x20 cells)
        GlobalPiece: Code[1]; // Current piece
        GlobalNextPiece: Code[1];
        GlobalPoints: Integer;
        GlobalSpeed: Integer; // Or actual delay for JavaScript timer
        GlobalNoOfPieces: Integer;
        GlobalX: Integer; // X position of top/left piece corner
        GlobalY: Integer; // Y position of top/left piece corner
        GlobalRotation: Integer; // Piece rotation 1-4
        GlobalIsGameOver: Boolean;
        PlayFieldElementIdLbl: label 'PlayField%1,%2';
        NextPieceElementIdLbl: label 'NextPiece%1,%2';
        ScoreElementIdLbl: label 'Score';
        NewGameButtonElementIdLbl: label 'NewGameButton';
}