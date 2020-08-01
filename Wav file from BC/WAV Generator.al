codeunit 50133 "WAV Generator"
{
    var
        samples: Integer;
        samplesPerSecond: Integer;
        Scale: Dictionary of [Text, Decimal];

    procedure BuildScale()
    begin
        clear(Scale);
        Scale.Add('C', 261.625);
        Scale.Add('C#', 277.183);
        Scale.Add('D', 293.664);
        Scale.Add('D#', 311.127);
        Scale.Add('E', 329.627);
        Scale.Add('F', 349.228);
        Scale.Add('F#', 369.995);
        Scale.Add('G', 391.995);
        Scale.Add('G#', 415.305);
        Scale.Add('A', 220.000 * 2);
        Scale.Add('Bb', 233.082 * 2);
        Scale.Add('B', 246.942 * 2);
        Scale.Add('C2', 261.625 * 2);
        Scale.Add('C#2', 277.183 * 2);
        Scale.Add('D2', 293.664 * 2);
        Scale.Add('D#2', 311.127 * 2);
        Scale.Add('E2', 329.627 * 2);
        Scale.Add('F2', 349.228 * 2);
        Scale.Add('F#2', 369.995 * 2);
        Scale.Add('G2', 391.995 * 2);
        Scale.Add('G#2', 415.305 * 2);
        Scale.Add('A2', 220.000 * 4);
        Scale.Add('Bb2', 233.082 * 4);
        Scale.Add('B2', 246.942 * 4);
    end;



    procedure Generate()
    var
        Music: Codeunit "Temp Blob";
        Wav: Codeunit "Temp Blob";
        Writer: OutStream;
        InS: InStream;
        FileName: Text;
        i: Integer;
    begin
        samples := 88200;
        samplesPerSecond := 44100;
        BuildScale();

        Music.CreateOutStream(Writer);


        for i := 1 to 2 do begin
            AddTone(writer, 'C', 6);
            AddTone(writer, 'E', 9);
            AddTone(writer, 'G', 6);
            AddTone(writer, 'A', 9);
            AddTone(writer, 'Bb', 6);
            AddTone(writer, 'A', 9);
            AddTone(writer, 'G', 6);
            AddTone(writer, 'E', 9);
        end;

        Wav.CreateOutStream(Writer);
        AddWavHeader(Writer, Music.Length());
        Music.CreateInStream(InS);
        copystream(Writer, InS);


        Wav.CreateInStream(InS);
        FileName := 'sound.wav';
        DownloadFromStream(InS, '', '', '', FileName);
    end;

    procedure AddTone(writer: OutStream; Note: Text; Length: Integer)
    var
        i: Integer;
        t: Decimal;
        s: Integer;
        Math: codeunit Math;
        s1, s2 : Byte;
        aNatural: Decimal;
        ampl: Decimal;
        perfect: Decimal;
        concert: Decimal;
        freq: Decimal;
    begin
        Scale.Get(Note, aNatural);
        ampl := 10000;
        perfect := 1.5;
        concert := 1.498307077;
        freq := aNatural * perfect;
        for i := 0 to round(samples / Length, 1, '<') do begin
            t := i / samplesPerSecond;
            s := round(ampl * (Math.Sin(t * freq * 2.0 * Math.PI)), 1);
            IntegerToShort(s, s1, s2);
            writer.Write(s1);
            writer.Write(s2);
        end;
    end;

    procedure IntegerToShort(Freq: Integer; var b1: byte; var b2: byte)
    var
        mem: Codeunit "Temp Blob";
        InS: InStream;
        OutS: OutStream;
    begin
        Mem.CreateOutStream(OutS);
        OutS.Write(Freq); // write 4 bytes in
        Mem.CreateInStream(InS);
        InS.Read(b1); // read 1 byte out
        Ins.Read(b2); // read 1 byte out
    end;

    local procedure AddWavHeader(var Writer: OutStream; DataLength: Integer)
    var
        RIFF: Integer;
        WAVE: Integer;
        formatChunkSize: Integer;
        headerSize: Integer;
        _format: Integer;
        formatType: Byte;
        tracks: Byte;
        bitsPerSample: Byte;
        frameSize: Byte;
        bytesPerSecond: Integer;
        waveSize: Integer;
        data: Integer;
        datachunkSize: Integer;
        Null: Byte;
        fileSize: Integer;
    begin
        Null := 0;
        RIFF := 1179011410;
        WAVE := 1163280727;
        formatChunkSize := 16;
        headerSize := 8;
        _format := 544501094;
        formatType := 1;
        tracks := 1;
        bitsPerSample := 16;
        frameSize := round((tracks * ((bitsPerSample + 7) / 8)), 1, '<');
        bytesPerSecond := samplesPerSecond * frameSize;
        waveSize := 4;
        data := 1635017060;
        fileSize := waveSize + headerSize + formatChunkSize + headerSize + DataLength;
        writer.Write(RIFF);
        writer.Write(fileSize);
        writer.Write(WAVE);
        writer.Write(_format);
        writer.Write(formatChunkSize);
        writer.Write(formatType); // Should be short
        Writer.Write(Null);
        writer.Write(tracks); // Should be short
        Writer.Write(Null);
        writer.Write(samplesPerSecond);
        writer.Write(bytesPerSecond);
        writer.Write(frameSize); // Should be short
        Writer.Write(Null);
        writer.Write(bitsPerSample); // Should be short
        Writer.Write(Null);
        writer.Write(data);
        writer.Write(DataLength);
    end;

}