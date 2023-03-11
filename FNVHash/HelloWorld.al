// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50135 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    begin
        message('FNV Result = %1 (should be 2267144173)', FNVHash('jdfgsdhfsdfsd 6445dsfsd7fg/*/+bfjsdgf%$^'));
    end;

    local procedure FNVHash(str: Text): BigInteger
    var
        fnv_prime: BigInteger;
        wrap: BigInteger;
        i: Integer;
        hash: BigInteger;
        c: Byte;
    begin
        fnv_prime := 2166136261L; // 0x811C9DC5;
        wrap := power(2, 32);
        for i := 1 to strlen(str) do begin
            hash *= fnv_prime;
            if Hash > wrap then
                Hash := hash mod wrap;

            c := str[i];
            hash := BitwiseXor(hash, c);

        end;
        exit(hash);
    end;

    local procedure BitwiseXor(A: BigInteger; B: BigInteger): BigInteger
    var
        Result: BigInteger;
        BitMask: BigInteger;
        BitIndex: Integer;
        MaxBitIndex: Integer;
    begin
        BitMask := 1;
        Result := 0;
        MaxBitIndex := 32;
        for BitIndex := 1 to MaxBitIndex do begin
            if (A mod 2) <> (B mod 2) then
                Result += BitMask;
            A := A div 2;
            B := B div 2;
            if BitIndex < MaxBitIndex then
                BitMask += BitMask;
        end;
        exit(Result);
    end;
}