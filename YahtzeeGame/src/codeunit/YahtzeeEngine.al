codeunit 54580 Yahtzee
{
    procedure EndGame()
    begin
        GameRunning := false;
        UpdateBestScore(GameData);
        Message('Final score: %1', GetGameData()."P1 Score");
    end;

    procedure NewGame()
    var
        NewLine: Record "Yahtzee Data Game Line";
        CombEnum: Enum YahtzeeCombEnum;
    begin
        GameSetup := GameSetup.FindOrCreate();

        GameData.GameId := GetNewGameId();
        GameData.Insert();
        GameRunning := true;

        Clear(DiceRound);
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
        Commit();

        NewTurn(DiceRound);
    end;

    procedure ResetGame()
    begin
        GameData.Reset();
        DiceRound.Reset();
        GameRunning := false;
    end;

    procedure NewTurn(var GameDice: Record "Yahtzee Data Dice")
    begin
        if GameDice.TurnNum < 13 then begin
            GameDice.TryCount := 0;
            GameDice.TurnNum += 1;
            GameDice.DiceMarkAll(true);
            DiceRound := GameDice;
            Sleep(1500);
            DiceRollAll();
        end
        else
            EndGame();
    end;

    procedure ClearGameHistory()
    var
        Games: Record "Yahtzee Data Game";
    begin
        Games.DeleteAll(true);
        NumberSequence.Delete(GameId_NumSeq());
        GetGameSetup();
        GameSetup."Highest score" := 0;
        GameSetup.Modify();
    end;

    local procedure GetNewGameId(): Integer
    var
    begin
        if not NumberSequence.Exists(GameId_NumSeq) then
            NumberSequence.Insert(GameId_NumSeq, 1);
        exit(NumberSequence.Next(GameId_NumSeq));
    end;

    procedure GameId_NumSeq(): Text[20]
    var
        myInt: Integer;
    begin
        exit('YahtzeeGameId');
    end;

    procedure DiceRollAll(var DiceRoundOnPage: Record "Yahtzee Data Dice"): Boolean
    var
        RollOk: Boolean;
    begin
        if DiceRoundOnPage.ValidateAnyDiceMarked() then begin
            DiceRound := DiceRoundOnPage;
            DiceRollAll();
            DiceRoundOnPage := DiceRound;
        end;
        exit(RollOk);
    end;

    local procedure DiceRollAll(): Boolean
    var
        DiceIdx: Integer;
        RollOk: Boolean;
    begin
        if DiceRound.ValidateAnyDiceMarked() then begin
            for DiceIdx := 1 to 5 do begin
                DiceRoll(DiceIdx);
            end;
            DiceRound.TryCount += 1;
            // Unmark Dice
            DiceRound.DiceMarkAll(false);
            CalcDiceRoundStatistics();
        end;
        exit(RollOk);
    end;

    local procedure DiceRoll(DiceIdx: Integer)
    begin
        if DiceRound.IsDiceMarked(DiceIdx) then begin
            Dice.Roll();
            updateDiceRound(DiceIdx, Dice.GetValue(), Dice.GetImage());
        end;
    end;

    procedure ApplyScore(var Line: Record "Yahtzee Data Game Line"): Boolean
    var
        Applied: Boolean;
    begin
        if Line.Combination <> line.Combination::NumRepeatBonus then begin
            Line.Validate(P1Score, GetPossibleScore(Line.Combination));
            Line.Modify();
            Applied := true;
            if line.Combination.AsInteger() <= line.Combination::NumRepeatSixes.AsInteger() then
                ApplyScoreBonus();
            GameData.CalcFields("P1 Score");
        end;
        UpdateBestScore(GameData);
        exit(Applied);
    end;

    procedure ApplyScoreBonus()
    var
        UpperBonus: Integer;
        BonusLine: Record "Yahtzee Data Game Line";
    begin
        if IsGameRunning() then begin
            BonusLine.SetRange(GameId, GetGameData().GameId);
            BonusLine.SetRange(Combination, BonusLine.Combination::NumRepeatBonus);
            BonusLine.FindFirst();
            if not BonusLine.P1Set then begin
                UpperBonus := GetPossibleScoreForUpperBonus();
                if UpperBonus > 0 then begin
                    BonusLine.Validate(P1Score, GetPossibleScoreForUpperBonus());
                    BonusLine.Modify();
                end;
            end;
        end;
    end;

    procedure GetHighestScore(): Integer;
    var
    begin
        GetGameSetup();
        exit(GameSetup."Highest score");
    end;

    procedure GetPossibleScore(Comb: Enum YahtzeeCombEnum): Integer
    var
        Scoring: Integer;
        FullHouseScore: Integer;
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
            Comb::NumRepeatBonus:
                Scoring := GetPossibleScoreForUpperBonus();
            Comb::ThreeOfAKind:
                Scoring := GetPossibleScoreByOccurrences(3);
            Comb::FourOfAKind:
                Scoring := GetPossibleScoreByOccurrences(4);
            Comb::FullHouse:
                begin
                    if not GameSetup."Full-house for dice-price" then
                        FullHouseScore := 25;
                    Scoring := GetPossibleScoreRegex('^[0]{0,4}([2,3])[0]{0,4}([2,3])[0]{0,4}$', FullHouseScore);
                end;
            Comb::StraightSmall:
                Scoring := GetPossibleScoreRegex('[1-2]{4}', 30);
            Comb::StraightLarge:
                Scoring := GetPossibleScoreRegex('[1]{5}', 40);
            Comb::Yahtzee:
                Scoring := GetPossibleScoreByOccurrences(5, 50);
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

    procedure GetPossibleScoreByOccurrences(NumOfOccurrences: Integer): Integer
    begin
        exit(GetPossibleScoreByOccurrences(NumOfOccurrences, 0));
    end;

    procedure GetPossibleScoreByOccurrences(NumOfOccurrences: Integer; DefaultScore: Integer): Integer
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

    procedure GetPossibleScoreForUpperBonus(): Integer
    var
        YahtzeeGame: Record "Yahtzee Data Game";
        Bonus, MinOfPoints, SumOfPoints : Integer;
    begin
        YahtzeeGame := GetGameData();
        YahtzeeGame.CalcFields("P1 Sum Of Upper Points");
        MinOfPoints := 63;
        SumOfPoints := YahtzeeGame."P1 Sum Of Upper Points";
        Bonus := SumOfPoints - MinOfPoints;
        if Bonus >= 0 then
            Bonus := 35;
        exit(Bonus);
    end;

    procedure GetPossibleScoreRegex(RegexPattern: Text; FixedScore: Integer): Integer
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

    procedure GetDiceRoundData(): Record "Yahtzee Data Dice"
    begin
        exit(DiceRound);
    end;

    procedure CalcDiceRoundStatistics()
    begin
        CalcDiceRoundStatistics(DiceRound);
    end;

    procedure CalcDiceRoundStatistics(var GameDice: Record "Yahtzee Data Dice")
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

    procedure GetGameSetup(): Record "Yahtzee Data Setup"
    begin
        if not GameSetup.Get() then
            GameSetup := GameSetup.FindOrCreate();
        exit(GameSetup);
    end;

    procedure GetGameData(): Record "Yahtzee Data Game"
    begin
        exit(GameData);
    end;

    procedure IsGameRunning(): Boolean
    begin
        exit(GameRunning);
    end;

    local procedure UpdateBestScore(var CurrGame: Record "Yahtzee Data Game")
    var
        BestScore: Integer;
    begin
        GetGameSetup();
        BestScore := GameSetup."Highest score";
        if BestScore = 0 then
            BestScore := CurrGame.CalcHighestScore();
        if BestScore < CurrGame."P1 Score" then
            BestScore := CurrGame."P1 Score";
        if GameSetup."Highest score" < BestScore then begin
            GameSetup.Validate("Highest score", BestScore);
            GameSetup.Modify();
        end;
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

    trigger OnRun()
    var
    begin
        GameSetup := GameSetup.FindOrCreate();
    end;

    var
        GameRunning: Boolean;
        GameSetup: Record "Yahtzee Data Setup";
        GameData: Record "Yahtzee Data Game";
        GameDataLine: Record "Yahtzee Data Game Line";
        DiceRound: Record "Yahtzee Data Dice";
        Dice: Codeunit "Dice Six-Sided";
        RoundStatArray: Array[6] of Integer;
        RoundStatStr: Text[6];
}

