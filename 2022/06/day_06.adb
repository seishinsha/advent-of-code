with Ada.Text_IO;       use Ada.Text_IO;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Sequential_IO;

procedure Day_06 is

    package Char_IO is new Ada.Sequential_IO (Character);
    use Char_IO;

    File                    : Char_IO.File_Type;
    Start_Of_Packet_Length  : Positive := 4;
    Start_Of_Message_Length : Positive := 14;

    function Locate_Distinct_Position (Size : Positive) return Natural is
        Result : Natural := Size;
        C      : Character;
        Buffer : String (1 .. Size);

        function Check_Buffer
           (Char : Character; Buffer : String) return Boolean
        is
            Dup : Boolean := False;
        begin
            Loop_I :
            for I in Buffer'Range loop
                if Char = Buffer (I) then
                    Dup := True;
                    exit Loop_I;
                end if;
            end loop Loop_I;
            if not Dup and Buffer'Length > 0 then
                return
                   Check_Buffer
                      (Head (Buffer, 1) (1), Tail (Buffer, Buffer'Length - 1));
            end if;
            return Dup;
        end Check_Buffer;

        function Check_Buffer (Buffer : String) return Boolean is
        begin
            return
               Check_Buffer
                  (Head (Buffer, 1) (1), Tail (Buffer, Buffer'Length - 1));
        end Check_Buffer;

    begin
        for I in Buffer'Range loop
            Read (File, Buffer (I));
        end loop;
        while Check_Buffer (Buffer) and not End_Of_File (File) loop
            Read (File, C);
            Buffer := Insert (Delete (Buffer, 1, 1), Buffer'Last, "" & C);
            Result := Result + 1;
        end loop;
        return Result;
    end Locate_Distinct_Position;

    function Locate_Start_Of_Packet return Natural is
    begin
        return Locate_Distinct_Position (Start_Of_Packet_Length);
    end Locate_Start_Of_Packet;

    function Locate_Start_Of_Message return Natural is
    begin
        return Locate_Distinct_Position (Start_Of_Message_Length);
    end Locate_Start_Of_Message;

begin
    Open (File, In_File, "input.txt");
    Put_Line ("Start of Packet  @" & Locate_Start_Of_Packet'Image);
    Close (File);
    Open (File, In_File, "input.txt");
    Put_Line ("Start of Message @" & Locate_Start_Of_Message'Image);
    Close (File);
end Day_06;
