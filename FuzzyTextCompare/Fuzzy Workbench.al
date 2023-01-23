page 58100 "Fuzzy"
{
    PageType = Card;
    layout
    {
        area(Content)
        {
            field(A; A)
            {
                ApplicationArea = all;
                trigger OnValidate()
                begin
                    Output := T.TextDistance(A, B);
                    Output2 := FuzzyCompare(A, B);
                end;
            }
            field(B; B)
            {
                ApplicationArea = all;
                trigger OnValidate()
                begin
                    Output := T.TextDistance(A, B);
                    Output2 := FuzzyCompare(A, B);
                end;
            }
            field(Output; Output)
            {
                ApplicationArea = all;
            }
            field(Output2; Output2)
            {
                ApplicationArea = all;
            }
        }
    }

    PROCEDURE FuzzyCompare(s1: Text; s2: Text): Decimal;
    VAR
        hit: Integer;
        p1: Integer;
        p2: Integer;
        l1: Integer;
        l2: Integer;
        pt: Integer;
        diff: Integer;
        hstr: Text;
        test: ARRAY[2500] OF Boolean;
    BEGIN
        begin
            if StrLen(s1) < StrLen(s2) then begin
                hstr := s2;
                s2 := s1;
                s1 := hstr;
            end;
            l1 := StrLen(s1);
            l2 := StrLen(s2);
            p1 := 1;
            p2 := 1;
            if l1 > l2 then
                diff := l2 div 3 + Abs(l1 - l2)
            else
                diff := l1 div 3 + Abs(l1 - l2);
            repeat
                if not test[p1] then begin
                    if (s1[p1] = s2[p2]) and (Abs(p1 - p2) <= diff) then begin
                        test[p1] := true;
                        hit := hit + 1;
                        p1 := p1 + 1;
                        p2 := p2 + 1;
                        if p1 > l1 then
                            p1 := 1;
                    end else begin
                        test[p1] := false;
                        p1 := p1 + 1;
                        if p1 > l1 then begin
                            while (p1 > 1) and not (test[p1]) do
                                p1 := p1 - 1;
                            p2 := p2 + 1
                        end;
                    end;
                end else begin
                    p1 := p1 + 1;
                    if p1 > l1 then begin
                        repeat
                            p1 := p1 - 1;
                        until (p1 = 1) or test[p1];
                        p2 := p2 + 1;
                    end;
                end;
            until p2 > l2;
            exit(hit / l1);
        end;
    END;

    var
        T: Codeunit "Type Helper";
        A, B : Text;
        Output: Integer;
        Output2: Decimal;
}