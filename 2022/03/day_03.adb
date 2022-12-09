with Ada.Text_IO;       use Ada.Text_IO;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Containers.Ordered_Sets;

procedure Day_03 is

    File               : File_Type;
    Compartment_Length : Positive := 1;
    Total_Priority     : Integer  := 0;

    package Char_Sets is new Ada.Containers.Ordered_Sets (Character);
    use Char_Sets;

    function Find_Repeated_Items (Left, Right : String) return Set is
        Result : Set;
    begin
        for I in Left'Range loop
            for J in Right'Range loop
                if Left (I) = Right (J) then
                    Result.Include (Left (I));
                end if;
            end loop;
        end loop;
        return Result;
    end Find_Repeated_Items;

    function Evaluate_Priority (Items : Set) return Integer is
        Result    : Integer := 0;
        Value     : Integer := 0;
        LC_Offset : Integer := Character'Pos ('a') - 1;
        UC_Offset : Integer := Character'Pos ('A') - 1 - 26;
    begin
        for Element of Items loop
            if Element >= 'a' and Element <= 'z' then
                Value := Character'Pos (Element) - LC_Offset;
                --  Put_Line (Element & ":" & Value'Image);
            elsif Element >= 'A' and Element <= 'Z' then
                Value := Character'Pos (Element) - UC_Offset;
                --  Put_Line (Element & ":" & Value'Image);
            end if;
            Result := Result + Value;
        end loop;
        return Result;
    end Evaluate_Priority;

begin
    Open (File, In_File, "input.txt");
    while not End_Of_File (File) loop
        declare
            Line : String := Get_Line (File);
        begin
            Compartment_Length := Line'Length / 2;
            Total_Priority     :=
               Total_Priority +
               Evaluate_Priority
                  (Find_Repeated_Items
                      (Line (1 .. Compartment_Length),
                       Line (Compartment_Length + 1 .. Line'Length)));
        end;
    end loop;
    Close (File);
    Put_Line ("Total priority =" & Total_Priority'Image);
end Day_03;
