pageextension 50123 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        CryptoMgt: Codeunit "Cryptography Management";
        HashAlgorithmTypeKey: Option HMACMD5,HMACSHA1,HMACSHA256,HMACSHA384,HMACSHA512;
        DateToSign: Text;
        AwsRegion: Text;
        KeyInitial: Text;
        KeyDate: Text;
        KeyRegion: Text;
        TxtMsg001_Lbl: Label 'Key Region should be 0b6b58ba4ebc8e5dcf13ed80b7f4e0fcd5877fc75127356c7d6a9fc20a198dde but GenerateHash returns %1';
    begin
        DateToSign := '20230926';
        AwsRegion := 'eu-west-1';
        KeyInitial := 'AWS40qXUUYp9B30DgnqoNNhhXhJDjjxsd6examplekey';

        KeyDate := Lowercase(CryptoMgt.GenerateHash(DateToSign, KeyInitial, HashAlgorithmTypeKey::HMACSHA256));
        // KeyDate 2a240e8406f3b48d3a9fdac9092558b1ab477509f055c739ab19a512e3b3857e is OK 

        // Uncomment to use the Stream conversion (not really know if it is ok)
        KeyDate := GetKeyTextFromHex(KeyDate);

        // Key Region should be 0b6b58ba4ebc8e5dcf13ed80b7f4e0fcd5877fc75127356c7d6a9fc20a198dde
        // but GenerateHash returns ac59005ae81017cb3935fc0b5f7a16e741d83f314cd6af78446bcf4186518552
        KeyRegion := Lowercase(CryptoMgt.GenerateBase64KeyedHash(AwsRegion, KeyDate, HashAlgorithmTypeKey::HMACSHA256));
        Message(StrSubstNo(TxtMsg001_Lbl, KeyRegion));
    end;

    local procedure GetKeyTextFromHex(KeyHex: Text) KeyText: Text
    var
        TempBlob: Codeunit "Temp Blob";
        base64: Codeunit "Base64 Convert";
        OutS: OutStream;
        InS: InStream;
        i: Integer;
        b: Byte;
        c: Char;
        l: Integer;
        HexByte: Text[2];
    begin
        TempBlob.CreateOutStream(OutS);
        l := StrLen(KeyHex);
        for i := 1 to l - 2 do begin
            HexByte := CopyStr(KeyHex, i, 2);
            //b := GetByteFromHexByte(HexByte);
            b := GetByteFromHexByte(HexByte);
            i += 1;
            OutS.Write(b);
        end;
        TempBlob.CreateInStream(InS);
        //InS.ReadText(KeyText);
        exit(base64.ToBase64(InS));
    end;

    local procedure GetByteFromHexByte(HexByte: Text[2]) b: Byte
    var
        b1: Byte;
        b2: Byte;
    begin
        b1 := GetValueFromHexChar(HexByte[1]);
        b2 := GetValueFromHexChar(HexByte[2]);
        b := (b1 * 16) + b2;
        exit(b);
    end;

    local procedure GetValueFromHexChar(HexChar: Text[1]) HexCharValue: Integer
    begin
        if not Evaluate(HexCharValue, HexChar) then begin
            case HexChar of
                'a':
                    HexCharValue := 10;
                'b':
                    HexCharValue := 11;
                'c':
                    HexCharValue := 12;
                'd':
                    HexCharValue := 13;
                'e':
                    HexCharValue := 14;
                'f':
                    HexCharValue := 15;
            end;
        end;
        exit(HexCharValue);
    end;
}