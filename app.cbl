    *> *****************************************************************
    *> Author: Austin Hrin
    *> Date: 02/28/2020
    *> Purpose: Learning
    *> Tectonics: cobc
    *> *****************************************************************
    IDENTIFICATION DIVISION.
    PROGRAM-ID. Clock.
    DATA DIVISION.
    FILE SECTION.
    WORKING-STORAGE SECTION.
    01 green constant as 2.
    01  HELLO PIC x(22) VALUE 'Hello from COBOL!'.
    01 current-time.
    05 ct-hours      pic 99.
    05 ct-minutes    pic 99.
    05 ct-seconds    pic 99.
    05 ct-hundredths pic 99.
    PROCEDURE DIVISION.
    MAIN-PROCEDURE.
    MAIN-PARA.
    *> DISPLAY 'Hello world'
    *>     DISPLAY HELLO
    ACCEPT current-time FROM TIME
    *>    DISPLAY current-time
    *>    DISPLAY ct-hours ':' ct-minutes
    GO TO LOOP-TIME-PARA
    STOP RUN.

    LOOP-TIME-PARA.
        ACCEPT current-time FROM TIME
        CALL X"E4"
        DISPLAY 'The current time is' AT LINE 1, COL 2 FOREGROUND-COLOR green
        IF ct-hours GREATER THAN OR EQUAL TO 12
            SUBTRACT 12 FROM ct-hours
            DISPLAY ct-hours AT LINE 2, COL 2 FOREGROUND-COLOR green
            DISPLAY ':' AT LINE 2, COL 4 FOREGROUND-COLOR green
            DISPLAY ct-minutes AT LINE 2, COL 5 FOREGROUND-COLOR green
            DISPLAY ':' AT LINE 2, COL 7 FOREGROUND-COLOR green
            DISPLAY ct-seconds AT LINE 2, COL 8 FOREGROUND-COLOR green
            DISPLAY 'PM' AT LINE 2, COL 11 FOREGROUND-COLOR green
        ELSE
            IF ct-hours EQUAL TO 00
                ADD 12 TO ct-hours
            END-IF
            DISPLAY ct-hours AT LINE 2, COL 2 FOREGROUND-COLOR green
            DISPLAY ':' AT LINE 2, COL 4 FOREGROUND-COLOR green
            DISPLAY ct-minutes AT LINE 2, COL 5 FOREGROUND-COLOR green
            DISPLAY ':' AT LINE 2, COL 7 FOREGROUND-COLOR green
            DISPLAY ct-seconds AT LINE 2, COL 8 FOREGROUND-COLOR green
            DISPLAY 'AM' AT LINE 2, COL 11 FOREGROUND-COLOR green
        END-IF
    *>    wait 1 second
        CALL "CBL_OC_NANOSLEEP" using "1000000000" end-call
        GO TO LOOP-TIME-PARA
    STOP RUN.

    END PROGRAM Clock.
