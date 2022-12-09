with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Strings;           use Ada.Strings;
with Ada.Strings.Fixed;     use Ada.Strings.Fixed;
with Ada.Strings.Maps;      use Ada.Strings.Maps;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure Day_04 is

    File                 : File_Type;
    Line                 : Unbounded_String;
    F, S                 : Unbounded_String;
    Overlapping_Sections : Natural := 0;

    procedure Read_Section_Pair
       (Input : String; First_Sec, Second_Sec : out Unbounded_String)
    is
        First_Pos, Last_Pos : Natural := 0;
    begin
        Find_Token (Input, To_Set (','), 1, Inside, First_Pos, Last_Pos);
        First_Sec := To_Unbounded_String (Input (Input'First .. Last_Pos - 1));
        Second_Sec := To_Unbounded_String (Input (Last_Pos + 1 .. Input'Last));
    end Read_Section_Pair;

    procedure Check_Containment (F, S : Unbounded_String) is
        A, B, C, D, H1, H2 : Natural := 0;
        Result             : Natural := 0;
    begin
        Find_Token (F, To_Set ('-'), 1, Outside, H1, H2);
        A := Integer'Value (To_String (F) (H1 .. H2));
        Find_Token (F, To_Set ('-'), H2 + 1, Outside, H1, H2);
        B := Integer'Value (To_String (F) (H1 .. H2));

        Find_Token (S, To_Set ('-'), 1, Outside, H1, H2);
        C := Integer'Value (To_String (S) (H1 .. H2));
        Find_Token (S, To_Set ('-'), H2 + 1, Outside, H1, H2);
        D := Integer'Value (To_String (S) (H1 .. H2));

        if (A >= C and B <= D) or (C >= A and D <= B) then
            Overlapping_Sections := Overlapping_Sections + 1;
        end if;
    end Check_Containment;

begin
    Open (File, In_File, "input.txt");

    while not End_Of_File (File) loop
        Read_Section_Pair (Get_Line (File), F, S);
        Check_Containment (F, S);
    end loop;
    Put_Line ("Number of overlapping sections:" & Overlapping_Sections'Image);

    Close (File);
end Day_04;
