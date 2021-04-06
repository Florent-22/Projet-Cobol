       IDENTIFICATION DIVISION.
       PROGRAM-ID. CUPIDON.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           COPY "files_assignments.cpy".

       DATA DIVISION.
       FILE SECTION.
       COPY "files_declarations.cpy".
       
       WORKING-STORAGE SECTION.
           COPY "ws_variables.cpy".
      
       77  MENU-PICK PIC 9 VALUE 0.
           88  MENU-PICK-IS-VALID VALUE 0 THRU 3.
      
       77  ERROR-MESSAGE PIC X(79).
       77  WS-LOGIN PIC 9(4).
       77  WS-PASSWORD PIC X(30).
      

       SCREEN SECTION.

       01  CONNECTION-SCREEN.
           05  BLANK SCREEN.
           05  LINE  2 COL  71 PIC 9(8) FROM WS-CURRENT-DATE.
           05  LINE  6 COL 15 VALUE "PLEASE LOGIN:".
           05  LINE  8 COL 20 VALUE "IDENTIFICATION CODE:".
           05  LINE  9 COL 20 VALUE "PASSWORD:".
           05  LINE 8 COL 41 PIC 9(4) USING WS-LOGIN.
           05  LINE 9 COL 41 PIC X(30) USING WS-PASSWORD.
           05  LINE 24 COL  1 PIC X(79) FROM ERROR-MESSAGE.

       01  A-RECEPTION-SCREEN.
           05  BLANK SCREEN.
           05  LINE  2 COL  71 PIC 9(8) FROM WS-CURRENT-DATE.
           05  LINE  2 COL  2 VALUE "WELCOME".
           05  LINE  2 COL  10 PIC A(30) FROM WS-CURRENT-USER-FIRSTNAME.
           05  LINE  6 COL 20 VALUE "PLEASE SELECT:".
           05  LINE  8 COL 25 VALUE "1. PLANNING".
           05  LINE  9 COL 25 VALUE "2. RESERVATIONS".
           05  LINE 10 COL 25 VALUE "3. CUSTOMERS".
           05  LINE 11 COL 25 VALUE "4. ROOM STATISTICS".
           05  LINE 12 COL 25 VALUE "5. ADMINISTRATION PANNEL".
           05  LINE 14 COL 25 VALUE "0. EXIT".
           05  LINE 20 COL  1 VALUE "YOUR SELECTION".
           05  LINE 20 COL 16 PIC Z USING MENU-PICK.
           05  LINE 24 COL  1 PIC X(79) FROM ERROR-MESSAGE.
      
       01  RECEPTION-SCREEN.
           05  BLANK SCREEN.
           05  LINE  2 COL  71 PIC 9(8) FROM WS-CURRENT-DATE.
           05  LINE  2 COL  2 VALUE "WELCOME".
           05  LINE  2 COL  10 PIC A(30) FROM WS-CURRENT-USER-FIRSTNAME.
           05  LINE  6 COL 20 VALUE "PLEASE SELECT:".
           05  LINE  8 COL 25 VALUE "1. PLANNING".
           05  LINE  9 COL 25 VALUE "2. RESERVATIONS".
           05  LINE 10 COL 25 VALUE "3. CUSTOMERS".
           05  LINE 11 COL 25 VALUE "4. ROOM STATISTICS".
           05  LINE 13 COL 25 VALUE "0. EXIT".
           05  LINE 20 COL  1 VALUE "YOUR SELECTION".
           05  LINE 20 COL 16 PIC Z USING MENU-PICK.
           05  LINE 24 COL  1 PIC X(79) FROM ERROR-MESSAGE.

       01  ADMINISTRATION-SCREEN.
           05  BLANK SCREEN.
           05  LINE  2 COL  71 PIC 9(8) FROM WS-CURRENT-DATE.
           05  LINE  2 COL  2 VALUE "WELCOME".
           05  LINE  2 COL  10 PIC A(30) FROM WS-CURRENT-USER-FIRSTNAME.
           05  LINE  6 COL 20 VALUE "PLEASE SELECT:".
           05  LINE  8 COL 25 VALUE "1. ROOMS".
           05  LINE  9 COL 25 VALUE "2. STAFF".
           05  LINE 10 COL 25 VALUE "3. MISSIONS SUPPRESSION".
           05  LINE 11 COL 25 VALUE "4. CUSTOMERS SUPPRESSION".
           05  LINE 13 COL 25 VALUE "0. EXIT".
           05  LINE 20 COL  1 VALUE "YOUR SELECTION".
           05  LINE 20 COL 16 PIC Z USING MENU-PICK.
           05  LINE 24 COL  1 PIC X(79) FROM ERROR-MESSAGE.

       PROCEDURE DIVISION.
       
           PERFORM START_PROG
           MOVE "Florent" TO WS-CURRENT-USER-FIRSTNAME.
           MOVE FUNCTION CURRENT-DATE TO WS-CURRENT-DATE-DATA.
           ACCEPT CONNECTION-SCREEN.
           ACCEPT A-RECEPTION-SCREEN.
           STOP RUN.

           
       START_PROG.
           PERFORM CREATE_FILES
       .


       CREATE_FILES.
          OPEN I-O fresa
             IF cr_fresa = 35 THEN
                OPEN OUTPUT fresa
             END-IF
          CLOSE fresa
   
          OPEN I-O fresaarch
             IF cr_fresaarch = 35 THEN
                OPEN OUTPUT fresaarch
             END-IF
          CLOSE fresaarch
   
          OPEN I-O fcli
             IF cr_fcli = 35 THEN
                OPEN OUTPUT fcli
             END-IF
          CLOSE fcli
   
          OPEN I-O fch
             IF cr_fch = 35 THEN
                OPEN OUTPUT fch
             END-IF
          CLOSE fch

          OPEN I-O fpers
             IF cr_fpers = 35 THEN
                OPEN OUTPUT fpers
             END-IF
          CLOSE fpers

          OPEN I-O fmis
             IF cr_fmis = 35 THEN
                OPEN OUTPUT fmis
             END-IF
          CLOSE fmis.
