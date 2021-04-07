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

       77  MENU-VALIDATE PIC A.
           88  MENU-VALIDATE-IS-VALID VALUE "Y", "N".
      
       77  ERROR-MESSAGE PIC X(79).
       77  WS-LOGIN PIC 9(4).
       77  WS-PASSWORD PIC X(30).
      

       SCREEN SECTION.

       COPY "screens_declarations.cpy".

       PROCEDURE DIVISION.
       
           PERFORM START_PROG
           MOVE "Florent" TO WS-CURRENT-USER-FIRSTNAME.
           MOVE FUNCTION CURRENT-DATE TO WS-CURRENT-DATE-DATA.
           
           PERFORM ADD_PERSONNEL.

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


       ADD_PERSONNEL.
           OPEN INPUT fpers
               MOVE 0 TO Wfin
               MOVE 0 TO fp_numP
               MOVE 0 TO Wvalide
               PERFORM WITH TEST AFTER UNTIL Wfin = 1
                 READ fpers
                    AT END 
                       MOVE 1 TO Wfin                         
                 END-READ
               END-PERFORM
               ADD 1 TO fp_numP
               PERFORM WITH TEST AFTER UNTIL Wvalide = 1
                 ACCEPT PERS-EDITING-SCREEN
                 IF fp_type = 0 OR fp_type = 1 OR fp_type = 2 THEN
                    IF fp_actif = 0 OR fp_actif = 1 OR fp_actif = 2 THEN
                       MOVE 1 TO Wvalide
                    ELSE
                       MOVE "WRONG ACTIF TYPE" TO ERROR-MESSAGE
                       ACCEPT PERS-EDITING-SCREEN
                       MOVE " " TO ERROR-MESSAGE
                    END-IF
                 ELSE 
                    MOVE "WRONG TYPE TYPE" TO ERROR-MESSAGE
                    ACCEPT PERS-EDITING-SCREEN
                    MOVE " " TO ERROR-MESSAGE
                 END-IF
               END-PERFORM
           CLOSE fpers
           IF MENU-VALIDATE = "Y" THEN
              OPEN EXTEND fpers
                 WRITE tamp_fpers
                 END-WRITE
              CLOSE fpers
           ELSE
              MOVE "CREATION ABORT" TO ERROR-MESSAGE
           END-IF.
          