       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY-01-PART-01.
       AUTHOR. ALEJANDRO VILLANUEVA.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. MAC OS X.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT NOT OPTIONAL INPUT-FILE ASSIGN TO DISK "INPUT.TXT"         
           ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  INPUT-FILE.
       01  INPUT-LINE PIC X(80).

       WORKING-STORAGE SECTION.
       77  DIGITS PIC X(9) VALUE "123456789".
       77  CHAR-POS PIC 9.
       77  CHAR-COUNT PIC 99.                                            
       77  END-COUNT PIC 99.
       77  FIRST-DIGIT PIC 9.
       77  LAST-DIGIT PIC 9.
       77  CALIBRATION-VALUE PIC 99.                         
       77  TOTAL-CALIBRATION-VALUE PIC 999999 VALUE ZERO.
       01  DIGIT-NAMES.
           05 DIGIT-NAME OCCURS 9 TIMES.
               10 THE-NAME   PIC X(5).
               10 THE-VALUE  PIC 9.
               10 THE-LENGTH PIC 9.
       77  LINE-LENGTH PIC 99.

       PROCEDURE DIVISION.
       BEGIN.
           PERFORM INITIALIZE-DATA
           OPEN INPUT INPUT-FILE
           PERFORM GET-LINES
           CLOSE INPUT-FILE
           STOP RUN.

       INITIALIZE-DATA.
           MOVE "one"   TO THE-NAME(1)                                 
           MOVE "two"   TO THE-NAME(2)
           MOVE "three" TO THE-NAME(3)
           MOVE "four"  TO THE-NAME(4)
           MOVE "five"  TO THE-NAME(5)
           MOVE "six"   TO THE-NAME(6)
           MOVE "seven" TO THE-NAME(7)
           MOVE "eight" TO THE-NAME(8)
           MOVE "nine"  TO THE-NAME(9)
           PERFORM VARYING CHAR-POS FROM 1 BY 1 UNTIL CHAR-POS = 0
               MOVE CHAR-POS TO THE-VALUE(CHAR-POS)
               INSPECT THE-NAME(CHAR-POS) TALLYING THE-LENGTH(CHAR-POS)
               FOR ALL CHARACTERS BEFORE " "
           END-PERFORM.

       GET-LINES.
           READ INPUT-FILE
               AT END MOVE HIGH-VALUES TO INPUT-LINE
           END-READ
           PERFORM UNTIL INPUT-LINE = HIGH-VALUES
               PERFORM PROCESS-LINE                                             
               READ INPUT-FILE
                   AT END MOVE HIGH-VALUES TO INPUT-LINE
               END-READ
           END-PERFORM
           DISPLAY "TOTAL CALIBRATION VALUE: " TOTAL-CALIBRATION-VALUE.

       PROCESS-LINE.
           MOVE 0 TO LINE-LENGTH
           INSPECT INPUT-LINE TALLYING LINE-LENGTH
               FOR ALL CHARACTERS BEFORE " "
           PERFORM PROCESS-NUMBER-NAMES
           MOVE 80 TO END-COUNT
           PERFORM VARYING CHAR-POS FROM 1 BY 1 UNTIL CHAR-POS = 0
               MOVE 1 TO CHAR-COUNT
               INSPECT INPUT-LINE TALLYING CHAR-COUNT FOR ALL CHARACTERS
                   BEFORE INITIAL DIGITS(CHAR-POS:1)
               IF CHAR-COUNT < END-COUNT
                   MOVE CHAR-COUNT TO END-COUNT   
               END-IF
           END-PERFORM
           MOVE INPUT-LINE(END-COUNT:1) TO FIRST-DIGIT                     

           MOVE 0 TO END-COUNT
           PERFORM VARYING CHAR-POS FROM 1 BY 1 UNTIL CHAR-POS = 0
               PERFORM VARYING CHAR-COUNT FROM 80 BY -1
               UNTIL CHAR-COUNT = 0
                   IF INPUT-LINE(CHAR-COUNT:1) EQUALS DIGITS(CHAR-POS:1)
                   AND CHAR-COUNT > END-COUNT
                       MOVE CHAR-COUNT TO END-COUNT                 
                   END-IF
               END-PERFORM
           END-PERFORM
           MOVE INPUT-LINE(END-COUNT:1) TO LAST-DIGIT

           COMPUTE CALIBRATION-VALUE = 10 * FIRST-DIGIT + LAST-DIGIT
           DISPLAY CALIBRATION-VALUE ": " INPUT-LINE
           ADD CALIBRATION-VALUE TO TOTAL-CALIBRATION-VALUE.

       PROCESS-NUMBER-NAMES.
           PERFORM VARYING CHAR-COUNT FROM 1 BY 1
           UNTIL CHAR-COUNT > LINE-LENGTH
               PERFORM VARYING CHAR-POS FROM 1 BY 1 UNTIL CHAR-POS = 0
                   IF INPUT-LINE(CHAR-COUNT:THE-LENGTH(CHAR-POS))
                   EQUALS THE-NAME(CHAR-POS)(1:THE-LENGTH(CHAR-POS))
                       STRING INPUT-LINE(1:CHAR-COUNT - 1)
                       THE-VALUE(CHAR-POS)
                       INPUT-LINE(CHAR-COUNT + THE-LENGTH(CHAR-POS):)
                       INTO INPUT-LINE
                       COMPUTE LINE-LENGTH =
                       LINE-LENGTH - THE-LENGTH(CHAR-POS) + 1
                   END-IF
               END-PERFORM
           END-PERFORM.
