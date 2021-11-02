codeunit 54500 "Game Engine"
{
    procedure UserClicked(var Board: Record "TTT Board"; Position: Text): Integer
    var
        i: Integer;
    begin
        // Process a user click
        if not GameRunning then
            exit;
        if evaluate(i, copystr(Position, 2, 1)) then
            if CurrentBoard[i] = PositionType::Blank then begin
                SetBitmapOnPosition(Board, HumanPlayer, i);
                CurrentBoard[i] := HumanPlayer;
                if CheckWinning(Board, i, HumanPlayer) then begin
                    Message('You won!');
                    GameRunning := false;
                end else
                    exit(i);
            end;
    end;

    procedure SetBitmapOnPosition(var Board: Record "TTT Board"; ImageType: Enum PositionType; Position: Integer)
    var
        convert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        Ref: RecordRef;
        OutS: OutStream;
    begin
        Ref.GetTable(Board);
        TempBlob.CreateOutStream(OutS);
        convert.FromBase64(format(ImageType), OutS);
        TempBlob.ToRecordRef(Ref, Position);
        Ref.SetTable(Board);
    end;

    procedure NewGameAndClearBoard(var Board: Record "TTT Board")
    var
        i: Integer;
    begin
        // Reset playing board and start new game
        for i := 1 to 9 do begin
            CurrentBoard[i] := PositionType::Blank;
            SetBitmapOnPosition(Board, PositionType::Blank, i);
        end;
        GameRunning := true;
        HumanPlayer := PositionType::X;
        ComputerPlayer := PositionType::O;
    end;

    procedure PlayComputer(var Board: Record "TTT Board"; UserClicked: Integer)
    var
        Position: Integer;
        Moves: Dictionary of [Integer, Decimal];
        Options: Dictionary of [Integer, Integer];
        Position2: Integer;
        GridValue: Decimal;
        BestGrid: Integer;
        BestValue: Decimal;
    begin
        // Make computer move
        for Position := 1 to 9 do begin
            // Calculate score for each blank field in the puzzle
            GridValue := 0;
            GridValue := Position mod 2;
            if CurrentBoard[Position] = PositionType::Blank then begin
                GetOptionsForGridPosition(Position, Options);
                foreach Position2 in Options.Keys() do begin
                    if CurrentBoard[Position2] <> HumanPlayer then
                        GridValue += 1;
                    if CurrentBoard[Options.Get(Position2)] <> HumanPlayer then
                        GridValue += 1;
                    if CurrentBoard[Position2] = HumanPlayer then
                        GridValue += 2;
                    if CurrentBoard[Options.Get(Position2)] = HumanPlayer then
                        GridValue += 2;
                    if (CurrentBoard[Position2] = HumanPlayer) and
                       (CurrentBoard[Options.Get(Position2)] = HumanPlayer) then
                        GridValue += 10;
                    if (CurrentBoard[Position2] = ComputerPlayer) and
                       (CurrentBoard[Options.Get(Position2)] = ComputerPlayer) then
                        GridValue += 100;
                end;
                Moves.Add(Position, GridValue);
            end;
        end;
        // Find best move!
        BestValue := -1;
        CalculatedScoresInfo := '';
        for Position := 1 to 9 do
            if Moves.ContainsKey(Position) then begin
                if Moves.Get(Position) > BestValue then begin
                    BestValue := Moves.Get(Position);
                    BestGrid := Position;
                end else
                    if (Moves.Get(Position) = BestValue) and
                        (Random(100) > 50) then begin  // Another move is equally good, perhaps (50%) try that.
                        BestValue := Moves.Get(Position);
                        BestGrid := Position;
                    end;
                CalculatedScoresInfo += format(Position) + '=' + format(Moves.Get(Position)) + '    ';
            end;
        // Update Board
        CurrentBoard[BestGrid] := ComputerPlayer;
        SetBitmapOnPosition(Board, ComputerPlayer, BestGrid);
        if CheckWinning(Board, BestGrid, ComputerPlayer) then begin
            Message('Computer Wins');
            GameRunning := false;
        end;
    end;

    procedure RoomLeft(): Boolean
    var
        Position: Integer;
    begin
        // Verify if there's any blank space left
        for Position := 1 to 9 do
            if CurrentBoard[Position] = PositionType::Blank then
                exit(true);
        GameRunning := false;
    end;

    procedure CheckWinning(var Board: Record "TTT Board"; i: Integer; ForType: Enum PositionType): Boolean
    var
        Options: Dictionary of [Integer, Integer];
        Position2: Integer;
    begin
        // Verify if a placed piece results in a winning combination
        GetOptionsForGridPosition(i, Options);
        foreach Position2 in Options.Keys() do
            if (CurrentBoard[Position2] = ForType) and
               (CurrentBoard[Options.get(Position2)] = ForType) then
                exit(true);
        exit(false);
    end;

    procedure GetOptionsForGridPosition(Position: Integer; var Options: Dictionary of [Integer, Integer])
    begin
        // Get a Dictionary of place-pairs that goes with a specific position
        Clear(Options);
        case Position of
            1:
                begin
                    Options.Add(2, 3);
                    Options.Add(4, 7);
                    Options.Add(5, 9);
                end;
            2:
                begin
                    Options.Add(5, 8);
                    Options.Add(1, 3);
                end;
            3:
                begin
                    Options.add(6, 9);
                    Options.Add(2, 1);
                    Options.Add(5, 7);
                end;
            4:
                begin
                    Options.Add(5, 6);
                    Options.Add(1, 7);
                end;
            5:
                begin
                    Options.Add(1, 9);
                    Options.Add(7, 3);
                    Options.Add(2, 8);
                    Options.Add(4, 6);
                end;
            6:
                begin
                    Options.Add(3, 9);
                    Options.Add(5, 4);
                end;
            7:
                begin
                    Options.Add(8, 9);
                    Options.Add(5, 3);
                    Options.Add(4, 1);
                end;
            8:
                begin
                    Options.Add(5, 2);
                    Options.Add(7, 9);
                end;
            9:
                begin
                    Options.Add(8, 7);
                    Options.Add(6, 3);
                    Options.Add(5, 1);
                end;
        end;
    end;

    procedure CalcInfo(): Text
    begin
        // Return the calculated scores
        Exit(CalculatedScoresInfo);
    end;

    var
        CurrentBoard: array[9] of enum PositionType;
        GameRunning: Boolean;
        CalculatedScoresInfo: Text;
        HumanPlayer: Enum PositionType;
        ComputerPlayer: Enum PositionType;
}

enum 54500 PositionType
{
    value(1; Blank)
    {
        Caption = 'iVBORw0KGgoAAAANSUhEUgAAAMgAAADICAYAAACtWK6eAAACFElEQVR4nO3TAQ3AMAzAsH78OfcEtiCwIUTKt7s7wNWRBd4MAsEgEAwCwSAQDALBIBAMAsEgEAwCwSAQDALBIBAMAsEgEAwCwSAQDALBIBAMAsEgEAwCwSAQDALBIBAMAsEgEAwCwSAQDALBIBAMAsEgEAwCwSAQDALBIBAMAsEgEAwCwSAQDALBIBAMAsEgEAwCwSAQDALBIBAMAsEgEAwCwSAQDALBIBAMAsEgEAwCwSAQDALBIBAMAsEgEAwCwSAQDALBIBAMAsEgEAwCwSAQDALBIBAMAsEgEAwCwSAQDALBIBAMAsEgEAwCwSAQDALBIBAMAsEgEAwCwSAQDALBIBAMAsEgEAwCwSAQDALBIBAMAsEgEAwCwSAQDALBIBAMAsEgEAwCwSAQDALBIBAMAsEgEAwCwSAQDALBIBAMAsEgEAwCwSAQDALBIBAMAsEgEAwCwSAQDALBIBAMAsEgEAwCwSAQDALBIBAMAsEgEAwCwSAQDALBIBAMAsEgEAwCwSAQDALBIBAMAsEgEAwCwSAQDALBIBAMAsEgEAwCwSAQDALBIBAMAsEgEAwCwSAQDALBIBAMAsEgEAwCwSAQDALBIBAMAsEgEAwCwSAQDALBIBAMAsEgEAwCwSAQDALBIBAMAsEgEAwCwSAQDALBIBAMAsEgEAwCwSAQDALBIBAMAsEgEAwCwSAQDALBIPAyMz9T2QWMmCB7ogAAAABJRU5ErkJggg==', Locked = true;
    }
    value(2; X)
    {
        Caption = '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Em6GLlYvqKtFN1F5ebnS5XTVqFGjxI8//iiuuOIKvQpuMQTECRUVFSI6OlrYpam8vb1FZWWluPnmmxUojdrQxXLCiBEjxBtvvKF8OZ21dOlShMNJeII46Z9//hExMTGOER+dTZo0SWzZskX4+vpqXQ+rICAu0L2r5e/vL/bv3y+uv/56BUqjB3SxXKB7Vys3NxfhcBGeIC7StasVFxcn1q9fL7y8vBQojT4QkD6g2fWRI0eKzs5OLcobHBzsKHNQUJACpdELulh9EBkZKTIyMrQp79q1axGOPsITpI/oe+R33XWXKC0tVbqczz//vBLfb9cVAtIPVVVVIioqStmuVlhYmPj5559FQECAAqXRE7pY/UCTbSp3tT766COEo58QkH6iLszYsWOVKxcNR48ZM0aBkugNXSwTqNbVovdYiouLhZ+fnwKl0RueICagrtaSJUuUKIuPj49j1ArhMAcCYpKkpCTHBCK39957z/HjHMyBLpaJqqurHU8Trq4W/RbauXOnYzk7mAMtaaKbbrpJZGdns52/rKxM7N27l+38doSAmOzXX39lOzc9ueLj40VzczNbGewGATHRV199JVatWsVaBnpT8PXXX2ctg53gN4hJjh8/7vj9UV9fr0R5ioqKRGxsrAIl0RueICagrg2NYqkSDvLEE0+Iuro6BUqiNwTEBGvWrBH5+flKlenEiRNi3rx5ttloggu6WP1UU1MjIiIiREdHh5LlW7dunXj88ccVKImeEJB+aG1tFePHjxe7du1Stow0o07zM8OHD1egNPpBF6sfsrKylA6HuPjeSkJCgrhw4YICpdEPniB9RDPWOm3bSWFesGCBAiXRCwLSB2fPnnVs3fnHH39oU2barGH37t2O/YbBeehi9cHChQu1Cgehv4MzZ84UTU1NCpRGHwiIi7788kvx/vvva1Xmfx04cECkpqaqURhNoIvlApotDw8Pd3SxdEZbj957771a18EqeII4iWbLn332We3DQWbNmiVqa2sVKIn6EBAn0badtBjRDmgJSnJysjYb33FCF8sJ1HenhYiqzpb3FYWe5kigZwhIL2gvXpotV32DuL6gTyDs27dPhIaG6ld4i6CL1YvMzExbhoO0t7eL2bNnO5bMQPcQEAmaLbfzRzzFxTrSLDt0D12sHjQ0NDg+lvPnn38qWT6zUVBuu+02e1XKBHiC9CAl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', Locked = true;
    }
    value(3; O)
    {
        Caption = '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', Locked = true;
    }
}