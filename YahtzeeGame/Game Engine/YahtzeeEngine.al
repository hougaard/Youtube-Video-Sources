codeunit 54580 "Yahtzee Engine"
{
    procedure NewGame()
    var
        NewLine: Record "Yahtzee Game Line";
        CombEnum: Enum YahtzeeCombEnum;
    begin
        GameData.GameId := GetNewGameId();
        GameData.Insert();
        GameRunning := true;

        DiceRound.GameId := GameData.GameId;
        DiceRound.Insert();

        NewLine.CreateGameLine(GameData.GameId, CombEnum::NumRepeatOnes);
        NewLine.CreateGameLine(GameData.GameId, CombEnum::NumRepeatTwos);
        NewLine.CreateGameLine(GameData.GameId, CombEnum::NumRepeatThrees);
        NewLine.CreateGameLine(GameData.GameId, CombEnum::NumRepeatFours);
        NewLine.CreateGameLine(GameData.GameId, CombEnum::NumRepeatFives);
        NewLine.CreateGameLine(GameData.GameId, CombEnum::NumRepeatSixes);
        NewLine.CreateGameLine(GameData.GameId, CombEnum::NumRepeatBonus);
        NewLine.CreateGameLine(GameData.GameId, CombEnum::ThreeOfAKind);
        NewLine.CreateGameLine(GameData.GameId, CombEnum::FourOfAKind);
        NewLine.CreateGameLine(GameData.GameId, CombEnum::FullHouse);
        NewLine.CreateGameLine(GameData.GameId, CombEnum::StraightSmall);
        NewLine.CreateGameLine(GameData.GameId, CombEnum::StraightLarge);
        NewLine.CreateGameLine(GameData.GameId, CombEnum::Yahtzee);
        NewLine.CreateGameLine(GameData.GameId, CombEnum::Chance);

        NewTurn();
    end;

    procedure NewTurn()
    begin
        DiceRound.TryCount := 0;
        DiceRound.DiceMarkAll(true);
        DiceRollAll();
    end;

    local procedure GetNewGameId(): Integer
    var
        NumSeqName: Text[20];
    begin
        NumSeqName := 'YahtzeeGameId';
        if not NumberSequence.Exists(NumSeqName) then
            NumberSequence.Insert(NumSeqName, 1);
        exit(NumberSequence.Next(NumSeqName));
    end;

    procedure DiceRollAll(var DiceRoundOnPage: Record "Yahtzee Data Dice Round")
    begin
        DiceRound := DiceRoundOnPage;
        DiceRollAll();
        DiceRoundOnPage := DiceRound;
    end;

    local procedure DiceRollAll()
        DiceIdx: Integer;
    begin
        for DiceIdx := 1 to 5 do begin
            DiceRoll(DiceIdx);
        end;
        DiceRound.TryCount += 1;
        // Unmark Dice
        DiceRound.DiceMarkAll(false);
        CalcDiceRoundStatistics();
    end;

    local procedure DiceRoll(DiceIdx: Integer)
    begin
        if DiceRound.IsDiceMarked(DiceIdx) then begin
            Dice.Roll();
            updateDiceRound(DiceIdx, Dice.GetValue(), Dice.GetImage());
        end;
    end;

    procedure GetCombinationPossibleScore(Comb: Enum YahtzeeCombEnum): Integer
    var
        Scoring: Integer;
    begin
        case Comb of
            Comb::NumRepeatOnes:
                Scoring := RoundStatArray[1] * 1;
            Comb::NumRepeatTwos:
                Scoring := RoundStatArray[2] * 2;
            Comb::NumRepeatThrees:
                Scoring := RoundStatArray[3] * 3;
            Comb::NumRepeatFours:
                Scoring := RoundStatArray[4] * 4;
            Comb::NumRepeatFives:
                Scoring := RoundStatArray[5] * 5;
            Comb::NumRepeatSixes:
                Scoring := RoundStatArray[6] * 6;
            Comb::ThreeOfAKind:
                Scoring := GetCombinationPossibleScoreByOccurrences(3);
            Comb::FourOfAKind:
                Scoring := GetCombinationPossibleScoreByOccurrences(4);
            Comb::FullHouse:
                Scoring := GetCombinationPossibleScoreRegex('^[0]{0,4}([2,3])[0]{0,4}([2,3])[0]{0,4}$', 25);
            Comb::StraightSmall:
                Scoring := GetCombinationPossibleScoreRegex('[1-2]{4}', 30);
            Comb::StraightLarge:
                Scoring := GetCombinationPossibleScoreRegex('[1]{5}', 40);
            Comb::Yahtzee:
                Scoring := GetCombinationPossibleScoreByOccurrences(5, 50);
            Comb::Chance:
                Scoring := (RoundStatArray[1] * 1) +
                           (RoundStatArray[2] * 2) +
                           (RoundStatArray[3] * 3) +
                           (RoundStatArray[4] * 4) +
                           (RoundStatArray[5] * 5) +
                           (RoundStatArray[6] * 6);
        end;
        exit(Scoring);
    end;

    procedure GetCombinationPossibleScoreByOccurrences(NumOfOccurrences: Integer): Integer
    begin
        exit(GetCombinationPossibleScoreByOccurrences(NumOfOccurrences, 0));
    end;

    procedure GetCombinationPossibleScoreByOccurrences(NumOfOccurrences: Integer; DefaultScore: Integer): Integer
    var
        iDiceNum: Integer;
        Scoring: Integer;
    begin
        iDiceNum := RoundStatStr.IndexOf(Format(NumOfOccurrences));
        if iDiceNum > 0 then begin
            if DefaultScore > 0 then
                Scoring := DefaultScore
            else
                Scoring := NumOfOccurrences * iDiceNum;
        end;
        exit(Scoring);
    end;

    procedure GetCombinationPossibleScoreRegex(RegexPattern: Text; FixedScore: Integer): Integer
    var
        Regex: Codeunit Regex;
        RegexMatches: Record Matches;
        RegexGroups: Record Groups;
        Scoring: Integer;
        Occurrences, OccurPosition : Integer;
    begin
        if Regex.IsMatch(RoundStatStr, RegexPattern) then begin
            Scoring := FixedScore;
            if Scoring = 0 then begin
                Regex.Match(RoundStatStr, RegexPattern, RegexMatches);
                Regex.Groups(RegexMatches, RegexGroups);
                if RegexGroups.IsEmpty() then begin
                    if RegexMatches.MatchIndex = 0 then
                        RegexMatches.Next();
                    Evaluate(Occurrences, RegexMatches.ReadValue());
                    OccurPosition := RegexMatches.Index + 1;
                    scoring := (OccurPosition * Occurrences);
                end
                else begin
                    if RegexGroups.GroupIndex = 0 then
                        RegexGroups.Next();
                    repeat begin
                        Evaluate(Occurrences, RegexGroups.ReadValue());
                        OccurPosition := RegexGroups.Index + 1;
                        scoring += (OccurPosition * Occurrences);
                    end until RegexGroups.Next = 0;
                end;
            end;
        end;
        exit(Scoring);
    end;

    procedure GetDiceRoundData(): Record "Yahtzee Data Dice Round"
    begin
        exit(DiceRound);
    end;

    procedure CalcDiceRoundStatistics()
    begin
        CalcDiceRoundStatistics(DiceRound);
    end;

    procedure CalcDiceRoundStatistics(var GameDice: Record "Yahtzee Data Dice Round")
    var
        DiceVal: Integer;
        iDice: Integer;
        iNum: Integer;
    begin
        Clear(RoundStatArray);
        RoundStatStr := '';
        if GameDice.TryCount > 0 then begin
            for iDice := 1 to 5 do begin
                DiceVal := GameDice.GetDiceValue(iDice);
                RoundStatArray[DiceVal] += 1;
            end;
            for inum := 1 to 6 do begin
                RoundStatStr += Format(RoundStatArray[iNum]);
            end;
        end;
    end;

    procedure GetGameData(): Record "Yahtzee Game"
    begin
        exit(GameData);
    end;

    procedure IsGameRunning(): Boolean
    begin
        exit(GameRunning);
    end;

    procedure updateDiceRound(DiceIdx: Integer; DiceValue: Integer; Img64: Text)
    var
        blober: Codeunit "Temp Blob";
        converter: Codeunit "Base64 Convert";
        outS: OutStream;
        RecRef: RecordRef;
        FldPosition: Integer;
    begin
        DiceRound.SetDiceValue(DiceIdx, DiceValue);
        FldPosition := DiceRound.DiceIdx2ImgFldPosition(DiceIdx);

        RecRef.GetTable(DiceRound);
        blober.CreateOutStream(outS);
        converter.FromBase64(Img64, outS);
        blober.ToRecordRef(RecRef, FldPosition);
        RecRef.SetTable(DiceRound);
    end;

    var
        GameRunning: Boolean;
        GameData: Record "Yahtzee Game";
        GameDataLine: Record "Yahtzee Game Line";
        DiceRound: Record "Yahtzee Data Dice Round";
        Dice: Codeunit "Dice 06";
        RoundStatArray: Array[6] of Integer;
        RoundStatStr: Text[6];
}

