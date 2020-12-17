table 51100 "RegEx Pattern"
{
    fields
    {
        field(1; RegEx; Text[250])
        {
            Caption = 'RegEx';
        }
        field(2; Description; Text[1000])
        {
            Caption = 'Description';
        }
    }
    keys
    {
        key(PK; RegEx)
        {

        }
    }
    procedure create()
    begin
        InsertRec('\', 'Marks the next character as either a special character or escapes a literal.' +
                      'For example, "n" matches the character "n". "\n" ' +
                      'matches a newline character. The sequence "\\" matches "\" and "\\(" matches "(".');
        InsertRec('""', 'double quotes may be escaped by doubling them: "<a href=""...>"');
        InsertRec('^ ',
        'Depending on whether the MultiLine option is set, matches the position before the first character in a line, or the first charact'
        );
        InsertRec('$',
        'Depending on whether the MultiLine option is set, matches the position after the last character in a line,' +
        ' or the last character in a line, or the last character in the string.');
        InsertRec('*',
        'Matches the preceding character zero or more times. For example, "zo*" matches either "z" or "zoo".');
        InsertRec('+', 'Matches the preceding character one or more times. For example, "zo+" matches "zoo" but not "z".');
        InsertRec('?', 'Matches the preceding character zero or one time. For example, "a?ve?" matches the "ve" in "never".');
        InsertRec('.', 'Matches any single character except a newline character.');
        InsertRec('(pattern)',
        'Matches pattern and remembers the match. The matched substring can be retrieved from the resulting Matches collection, ' +
        'using Item [0]...[n]. To match parentheses characters ( ), use "\\(" or "\\)".');

        InsertRec('(?<name>pattern)', 'Matches pattern and gives the match a name.');
        InsertRec('(?:pattern)', 'A non-capturing group');
        InsertRec('(?=...)', 'A positive lookahead');
        InsertRec('(?!...)', 'A negative lookahead');
        InsertRec('(?<=...)', 'A positive lookbehind');
        InsertRec('(?<!...)', 'A negative lookbehind');
        InsertRec('x|y', 'Matches either x or y. For example, "z|wood" matches "z" or "wood". "(z|w)oo" matches "zoo" or "wood".');
        InsertRec('{n}',
        'n is a non-negative integer. Matches exactly n times. For example, "o{2}" does not match the "o" in "Bob,"' +
        ' but matches the first two oÙs in "foooood".');
        InsertRec('{n,}',
        'n is a non-negative integer. Matches at least n times. For example, "o{2,}" does not match the "o" in "Bob" ' +
        'and matches all the oÙs in "foooood." "o{1,}" is equivalent to "o+". "o{0,}" is equivalent to "o*".');
        InsertRec('{n,m}',
        'm and n are non-negative integers. Matches at least n and at most m times. For example, "o{1,3}" matches the first three oÙs ' +
        'in "fooooood." "o{0,1}" is equivalent to "o?".');
        InsertRec('[xyz]',
        'A character set. Matches any one of the enclosed characters. For example, "[abc]" matches the "a" in "plain".');
        InsertRec('[^xyz]',
        'A negative character set. Matches any character not enclosed. For example, "[^abc]" matches the "p" in "plain".');
        InsertRec('[a-z]',
        'A range of characters. Matches any character in the specified range. For example, "[a-z]" matches any lowercase alphabetic ' +
        'character in the range "a" through "z". ');
        InsertRec('[^m-z]',
        'A negative range characters. Matches any character not in the specified range. For example, "[m-z]" ' +
        'matches any character not in the range "m" through "z". ');
        InsertRec('\b',
        'Matches a word boundary, that is, the position between a word and a space. ' +
        'For example, "er\b" matches the "er" in "never" but not the "er" in "verb". ');
        InsertRec('\B', 'Matches a non-word boundary. "ea*r\B" matches the "ear" in "never early".');
        InsertRec('\d', 'Matches a digit character. Equivalent to [0-9].');
        InsertRec('\D', 'Matches a non-digit character. Equivalent to [^0-9].');
        InsertRec('\f', 'Matches a form-feed character.');
        InsertRec('\n', 'Matches a newline character.');
        InsertRec('\r', 'Matches a carriage return character.');
        InsertRec('\s', 'Matches any white space including space, tab, form-feed, etc. Equivalent to "[\f\n\r\t\v]".');
        InsertRec('\S', 'Matches any nonwhite space character. Equivalent to "[^ \f\n\r\t\v]".');
        InsertRec('\t', 'Matches a tab character.');
        InsertRec('\v', 'Matches a vertical tab character.');
        InsertRec('\w', 'Matches any word character including underscore. Equivalent to "[A-Za-z0-9_]".');
        InsertRec('\W', 'Matches any non-word character. Equivalent to "[^A-Za-z0-9_]".');
        InsertRec('\num', 'Matches num, where num is a positive integer. A reference back to remembered matches. ' +
        'For example, "(.)\1" matches two consecutive identical characters. ');
        InsertRec('\no', 'Matches no, where no is an octal escape value. Octal escape values must be 1, 2, or 3 digits long. ' +
        'For example, "\11" and "\011" both match a tab character. "\0011" is the equivalent of "\001" & "1".');
        //' Octal escape values must not exceed 256. If they do, only the first two digits comprise the expression.');
        //'Allows ASCII codes to be used in regular expressions.');
        InsertRec('\xn', 'Matches n, where n is a hexadecimal escape value. Hexadecimal escape values must be exactly two digits long.' +
        ' For example, "\x41 matches "A". "\x041" is equivalent to "\x04" & "1". Allows ASCII codes to be used in regular expressions.');
        InsertRec('\un', 'Matches a Unicode character expressed in hexadecimal notation with exactly four numeric digits.' +
        ' "\u0200" matches a space character.');
        InsertRec('\A', 'Matches the position before the first character in a string. Not affected by the MultiLine setting');
        InsertRec('\Z', 'Matches the position after the last character of a string. Not affected by the MultiLine setting.');
        InsertRec('\G', 'Specifies that the matches must be consecutive, without any intervening non-matching characters.');
        InsertRec('\k', 'a back-reference to a named group. ' +
        'With ^(?[0-9]*)=\k$ 123=123 match and 123=456 fail');
        InsertRec('\\(', 'Parenthesis');
        InsertRec('\\)', 'Parenthesis');

        InsertRec('([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})',
                  'Matches a valid email address');

        InsertRec('\d{1,2}\-{0,1}\s{0,1}\d{2}\s{0,1}[NS]', 'Matches a valid latitude');
        InsertRec('\d{1,3}\-{0,1}\s{0,1}\d{2}\s{0,1}[EW]', 'Matches a valid longitude');
        InsertRec('.+', 'All text');
        InsertRec('\d{1,2}[- /.]\w{3,3}[- /.]\d{1,4}', 'Matches a date dd/mm/yyyy');
        InsertRec('(\+|-)?[0-9]+(\.[0-9]*)?', 'Matches a decimal number');
    end;

    procedure InsertRec(R: Text[250]; D: Text[250])
    var
        Regex: Record "RegEx Pattern";
    begin
        Regex.INIT;
        Regex.RegEx := R;
        Regex.Description := D;
        if Regex.Insert() then;
    end;
}

page 51102 "Patterns"
{
    PageType = List;
    SourceTable = "RegEx Pattern";
    Editable = false;
    layout
    {
        area(Content)
        {
            repeater(rep)
            {

                field(RegEx; Rec.RegEx)
                {
                    ApplicationArea = All;
                    Width = 5;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    //MultiLine = true;
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        rec.create();
    end;
}