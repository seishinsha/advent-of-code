with Ada.Containers.Indefinite_Ordered_Maps;
with Ada.Text_IO; use Ada.Text_IO;

procedure Day_02 is

    type Result_Type is (Won, Drawn, Lost);
    type Hand_Shape is (Rock, Paper, Scissors);
    type Strategy is (Win, Draw, Lose);

    package Value_Maps is new Ada.Containers.Indefinite_Ordered_Maps
       (Hand_Shape, Integer);
    package Result_Maps is new Ada.Containers.Indefinite_Ordered_Maps
       (Result_Type, Integer);

    Values  : Value_Maps.Map;
    Results : Result_Maps.Map;

    File                                   : File_Type;
    Line                                   : String (1 .. 3);
    Input, Output                          : Character;
    Opponent_Hand_Shape, Player_Hand_Shape : Hand_Shape;

    Play_Result : Integer := 0;
    Game_Result : Integer := 0;

    function Play (Opponent, Player : Hand_Shape) return Result_Type is
    begin
        if Opponent = Rock and Player = Paper then
            return Won;
        elsif Opponent = Rock and Player = Scissors then
            return Lost;
        elsif Opponent = Paper and Player = Rock then
            return Lost;
        elsif Opponent = Paper and Player = Scissors then
            return Won;
        elsif Opponent = Scissors and Player = Rock then
            return Won;
        elsif Opponent = Scissors and Player = Paper then
            return Lost;
        else
            return Drawn;
        end if;
    end Play;

    function Read_Hand_Shape (Input : Character) return Hand_Shape is
    begin
        case Input is
            when 'A' | 'X' =>
                return Rock;
            when 'B' | 'Y' =>
                return Paper;
            when 'C' | 'Z' =>
                return Scissors;
            when others =>
                raise Constraint_Error;
        end case;
    end Read_Hand_Shape;

    function Read_Strategy (Input : Character) return Strategy is
    begin
        case Input is
            when 'X' =>
                return Lose;
            when 'Y' =>
                return Draw;
            when 'Z' =>
                return Win;
            when others =>
                raise Constraint_Error;
        end case;
    end Read_Strategy;

    function Read_Hand_Shape
       (Opponent : Hand_Shape; Input : Strategy) return Hand_Shape
    is
    begin
        if Opponent = Rock and Input = Win then
            return Paper;
        elsif Opponent = Rock and Input = Lose then
            return Scissors;
        elsif Opponent = Paper and Input = Win then
            return Scissors;
        elsif Opponent = Paper and Input = Lose then
            return Rock;
        elsif Opponent = Scissors and Input = Win then
            return Rock;
        elsif Opponent = Scissors and Input = Lose then
            return Paper;
        else
            return Opponent;
        end if;
    end Read_Hand_Shape;

    function Evaluate_Game (Opponent, Player : Hand_Shape) return Integer is
    begin
        return Values (Player) + Results (Play (Opponent, Player));
    end Evaluate_Game;

begin

    Values.Insert (Rock, 1);
    Values.Insert (Paper, 2);
    Values.Insert (Scissors, 3);

    Results.Insert (Won, 6);
    Results.Insert (Drawn, 3);
    Results.Insert (Lost, 0);

    Game_Result := 0;
    Open (File, In_File, "input.txt");
    while not End_Of_File (File) loop
        Line                := Get_Line (File);
        Input               := Line (Line'First);
        Output              := Line (Line'Last);
        Opponent_Hand_Shape := Read_Hand_Shape (Input);
        Player_Hand_Shape   := Read_Hand_Shape (Output);
        Play_Result := Evaluate_Game (Opponent_Hand_Shape, Player_Hand_Shape);
        Game_Result         := Game_Result + Play_Result;
        --  Put_Line (Input & " -> " & Output & ":" & Play_Result'Image);
    end loop;
    Close (File);
    Put_Line ("Game Result (Strategy 1) =" & Game_Result'Image);

    Game_Result := 0;
    Open (File, In_File, "input.txt");
    while not End_Of_File (File) loop
        Line                := Get_Line (File);
        Input               := Line (Line'First);
        Output              := Line (Line'Last);
        Opponent_Hand_Shape := Read_Hand_Shape (Input);
        Player_Hand_Shape   :=
           Read_Hand_Shape (Opponent_Hand_Shape, Read_Strategy (Output));
        Play_Result := Evaluate_Game (Opponent_Hand_Shape, Player_Hand_Shape);
        Game_Result         := Game_Result + Play_Result;
        --  Put_Line (Input & " -> " & Output & ":" & Play_Result'Image);
    end loop;
    Close (File);
    Put_Line ("Game Result (Strategy 2) =" & Game_Result'Image);

end Day_02;
