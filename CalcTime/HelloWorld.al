// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage()
    var
        t: Time;
        intTime: Integer;
        Hour: Integer;
        Minute: Integer;
        Day: Integer;
    begin
        intTime := Time() - 000000T;
        Minute := 1000 * 60;
        Hour := Minute * 60;
        Day := Hour * 24;


        intTime += 5 * Hour;
        //intTime := intTime mod Day;

        t := 000000T + intTime;
        message('%1 = %2', 'CalcTime', CalcTime('1W4H', CurrentDateTime()));
    end;

    procedure CalcTime(TimeExpression: Text; StartDateTime: DateTime): DateTime
    var
        i: Integer;
        Op: Text;
        OpInt: Integer;
        ExpressionDuration: Duration;
    begin
        // Time Expression examples:
        //  1H
        //  -1H
        //  56H
        //  -56H // Hmmm...
        //  1H30M
        //  -1H30M
        //  1H-30M
        //  1H2M13S
        //StartTimeInteger := StartTime - 000000T;
        for i := 1 to strlen(TimeExpression) do begin
            if IsChar(TimeExpression[i]) then begin
                Evaluate(OpInt, Op);
                case TimeExpression[i] of
                    'W':
                        ExpressionDuration += OpInt * 7 * 24 * 60 * 60 * 1000;
                    'D':
                        ExpressionDuration += OpInt * 24 * 60 * 60 * 1000;
                    'H':
                        ExpressionDuration += OpInt * 60 * 60 * 1000;
                    'M':
                        ExpressionDuration += OpInt * 60 * 1000;
                    'S':
                        ExpressionDuration += OpInt * 1000;
                end;
                Op := '';
            end else
                Op += TimeExpression[i];
        end;
        exit(StartDateTime + ExpressionDuration);
    end;

    procedure CalcTime(TimeExpression: Text; StartTime: Time): Time
    var
        i: Integer;
        Op: Text;
        OpInt: Integer;
        StartTimeInteger: Integer;
    begin
        // Time Expression examples:
        //  1H
        //  -1H
        //  56H
        //  -56H // Hmmm...
        //  1H30M
        //  -1H30M
        //  1H-30M
        //  1H2M13S
        StartTimeInteger := StartTime - 000000T;
        for i := 1 to strlen(TimeExpression) do begin
            if IsChar(TimeExpression[i]) then begin
                Evaluate(OpInt, Op);
                case TimeExpression[i] of
                    'H':
                        StartTimeInteger += OpInt * 60 * 60 * 1000;
                    'M':
                        StartTimeInteger += OpInt * 60 * 1000;
                    'S':
                        StartTimeInteger += OpInt * 1000;
                end;
                Op := '';
            end else
                Op += TimeExpression[i];
        end;
        StartTimeInteger := StartTimeInteger mod (24 * 60 * 60 * 1000);
        exit(000000T + StartTimeInteger);
    end;

    procedure IsChar(c: Char): Boolean
    begin
        exit(c in ['A' .. 'Z', 'a' .. 'z']);
    end;
}