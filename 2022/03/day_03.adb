with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Strings.Fixed;     use Ada.Strings.Fixed;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Containers;        use Ada.Containers;
with Ada.Containers.Ordered_Sets;
with Ada.Containers.Vectors;

procedure Day_03 is

    File            : File_Type;
    Line            : Unbounded_String;
    Line_Counter    : Positive := 1;
    Total_Priority  : Integer  := 0;
    Badges_Priority : Integer  := 0;

    package Char_Sets is new Ada.Containers.Ordered_Sets (Character);
    use Char_Sets;
    S : Set;

    package String_Vectors is new Ada.Containers.Vectors
       (Natural, Unbounded_String);
    use String_Vectors;

    Group_Rucksacks : Vector;

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

    function Find_Repeated_Items (Rucksacks : Vector) return Set is
        Result : Set;
        C      : Character;
    begin
        if Rucksacks.Length < 2 then
            raise Constraint_Error;
        end if;
        for I in 1 .. To_String (Rucksacks.First_Element)'Last loop
            C := To_String (Rucksacks.First_Element) (I);
            iteration :
            for J in 1 .. Rucksacks.Last_Index loop
                if Ada.Strings.Fixed.Count
                      (To_String (Rucksacks (J)), "" & C) =
                   0
                then
                    exit iteration;
                elsif J = Rucksacks.Last_Index then
                    Result.Include (C);
                end if;
            end loop iteration;
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
            elsif Element >= 'A' and Element <= 'Z' then
                Value := Character'Pos (Element) - UC_Offset;
            end if;
            Result := Result + Value;
        end loop;
        return Result;
    end Evaluate_Priority;

    function Repeated_Items_In_Rucksack
       (Read_Line : out Unbounded_String) return Integer
    is
        Line               : String   := Get_Line (File);
        Compartment_Length : Positive := Line'Length / 2;
    begin
        Read_Line := To_Unbounded_String (Line);
        return
           Evaluate_Priority
              (Find_Repeated_Items
                  (Line (1 .. Compartment_Length),
                   Line (Compartment_Length + 1 .. Line'Length)));
    end Repeated_Items_In_Rucksack;

begin
    Open (File, In_File, "input.txt");
    while not End_Of_File (File) loop
        Total_Priority := Total_Priority + Repeated_Items_In_Rucksack (Line);
        Group_Rucksacks.Append (Line);
        if Line_Counter mod 3 = 0 then
            S               := Find_Repeated_Items (Group_Rucksacks);
            Badges_Priority := Badges_Priority + Evaluate_Priority (S);
            for I in reverse
               Group_Rucksacks.First_Index .. Group_Rucksacks.Last_Index
            loop
                Group_Rucksacks.Delete (I);
            end loop;
        end if;
        Line_Counter := Line_Counter + 1;
    end loop;
    Close (File);
    Put_Line ("Total priority (Repeated Items) =" & Total_Priority'Image);
    Put_Line ("Total priority (Badges)         =" & Badges_Priority'Image);
end Day_03;
