with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure Day_01 is

    File        : File_Type;
    S           : Unbounded_String;
    Current_Cal : Natural                    := 0;
    Current_Elf : Positive                   := 1;
    Current_Sum : Natural                    := 0;
    Top_Elves   : array (1 .. 3) of Positive := (others => 1);
    Top_Sums    : array (1 .. 3) of Natural  := (others => 0);
    Top_Sum     : Natural                    := 0;

begin

    Open (File, In_File, "input.txt");

    while not End_Of_File (File) loop

        if not End_Of_Line (File) then
            Get (File, Current_Cal);
            Current_Sum := Current_Sum + Current_Cal;
        else

            for I in Top_Sums'Range loop
                if Current_Sum > Top_Sums (I) then
                    for J in reverse I + 1 .. Top_Sums'Last loop
                        Top_Sums (J)  := Top_Sums (J - 1);
                        Top_Elves (J) := Top_Elves (J - 1);
                    end loop;
                    Top_Sums (I)  := Current_Sum;
                    Top_Elves (I) := Current_Elf;
                    exit;
                end if;
            end loop;

            Current_Elf := Current_Elf + 1;
            Current_Sum := 0;
        end if;

        S := To_Unbounded_String (Get_Line (File));
    end loop;

    Close (File);

    for I in Top_Elves'Range loop
        Put_Line
           ("Elf #" & Top_Elves (I)'Image & " carries" & Top_Sums (I)'Image &
            " calories.");
        Top_Sum := Top_Sum + Top_Sums (I);
    end loop;

    Put_Line
       ("Total calories by top calories-carrying elves:" & Top_Sum'Image);

end Day_01;
