with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Strings;           use Ada.Strings;
with Ada.Strings.Fixed;     use Ada.Strings.Fixed;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Maps;      use Ada.Strings.Maps;
with Ada.Containers.Vectors;

procedure Day_05 is

    package String_Vectors is new Ada.Containers.Vectors
       (Positive, Unbounded_String);
    use String_Vectors;

    File   : File_Type;
    Stacks : Vector;

    procedure Read_Initial_Stack is

        Number_Of_Stacks : Positive := 1;
        Rows             : Vector;
        R, S             : Natural  := 1;
        Max              : Natural  := 0;

        procedure Process_Line (Line : String) is
            Sanitized_Line : Unbounded_String;
        begin
            for I in Line'Range loop
                if (I - 2) mod 4 = 0 then
                    Sanitized_Line := Sanitized_Line & Line (I);
                end if;
            end loop;
            Rows.Append (Sanitized_Line);
            if Length (Sanitized_Line) > Max then
                Max := Length (Sanitized_Line);
            end if;
        end Process_Line;

    begin
        while not End_Of_Line (File) loop
            Process_Line (Get_Line (File));
        end loop;

        for Row of Rows loop
            Stacks.Append (Max * ' ');
        end loop;

        for Row of Rows loop
            S := 1;
            for Stack of Stacks loop
                Replace_Element (Stack, R, Element (Row, S));
                S := S + 1;
            end loop;
            R := R + 1;
        end loop;

        for Stack of Stacks loop
            Trim (Stack, Left);
        end loop;

    end Read_Initial_Stack;

    function Get_Stack_Tops return String is
        Result : Unbounded_String;
    begin
        for Stack of Stacks loop
            Result := Result & Head (Stack, 1);
        end loop;
        return To_String (Result);
    end Get_Stack_Tops;

    procedure Process_Instructions is
        procedure Process_Instruction (Instruction : String) is
            F, L, C, P1, P2 : Natural;
            Whitespace      : constant Character_Set := To_Set (' ');
        begin
            Find_Token (Instruction, Whitespace, 1, Outside, F, L);
            if Instruction (F .. L) = "move" then
                Find_Token (Instruction, Whitespace, L + 1, Outside, F, L);
                C := Natural'Value (Instruction (F .. L));
                Find_Token (Instruction, Whitespace, L + 1, Outside, F, L);
                if Instruction (F .. L) = "from" then
                    Find_Token (Instruction, Whitespace, L + 1, Outside, F, L);
                    P1 := Natural'Value (Instruction (F .. L));
                    Find_Token (Instruction, Whitespace, L + 1, Outside, F, L);
                    if Instruction (F .. L) = "to" then
                        Find_Token
                           (Instruction, Whitespace, L + 1, Outside, F, L);
                        P2 := Natural'Value (Instruction (F .. L));
                        for N in 1 .. C loop
                            declare
                                From_Stack : Unbounded_String :=
                                   Element (Stacks, P1);
                                To_Stack   : Unbounded_String :=
                                   Element (Stacks, P2);
                                Item : Character := Element (From_Stack, 1);
                            begin
                                Delete (From_Stack, 1, 1);
                                To_Stack := Item & To_Stack;
                                Stacks.Replace_Element (P1, From_Stack);
                                Stacks.Replace_Element (P2, To_Stack);
                            end;
                        end loop;
                    end if;
                end if;
            end if;
        end Process_Instruction;
    begin
        while not End_Of_File (File) loop
            Process_Instruction (Get_Line (File));
        end loop;
    end Process_Instructions;

begin

    Open (File, In_File, "input.txt");
    Read_Initial_Stack;
    Process_Instructions;
    Put_Line ("Stacks top elements: " & Get_Stack_Tops);
    Close (File);

end Day_05;
