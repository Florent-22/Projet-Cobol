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
           MOVE FUNCTION CURRENT-DATE TO WS-CURRENT-DATE-DATA.
           
           PERFORM ADD_PERSONNEL.

           STOP RUN.

           
       START_PROG.
           PERFORM CREATE_FILES
           PERFORM CONNECTION
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


       CONNECTION.
           MOVE 0 TO Wvalide
           PERFORM WITH TEST AFTER UNTIL 
               Wvalide = 1
                 ACCEPT CONNECTION-SCREEN
                 MOVE " " TO ERROR-MESSAGE
                 PERFORM SEARCH_PERSONNEL
                 IF fp_motDePasse = " " THEN
                    MOVE "INEXISTING USER" TO ERROR-MESSAGE
                 ELSE 
                    IF WS-PASSWORD = fp_motDePasse THEN
                       MOVE tamp_fpers TO WS-CURRENT-USER
                       MOVE 1 TO Wvalide
                    ELSE
                       MOVE "WRONG PASSWORD" TO ERROR-MESSAGE
                    END-IF
                 END-IF
               END-PERFORM.

      * PERSONNEL ID MUST BE IN WS-LOGIN BEFORE CALL SEARCH_PERSONNEL
       SEARCH_PERSONNEL.
           OPEN INPUT fpers
              MOVE 0 TO Wfin
              MOVE 0 TO Wtrouve
              PERFORM WITH TEST AFTER UNTIL Wfin = 1 OR Wtrouve = 1
                 READ fpers
                    AT END 
                       MOVE 1 TO Wfin  
                    NOT AT END
                       IF fp_numP = WS-LOGIN THEN
                          MOVE 1 TO Wtrouve
                       END-IF                     
                 END-READ
               END-PERFORM
               IF Wtrouve = 0 THEN
                 MOVE " " TO fp_motDePasse
               END-IF
           CLOSE fpers.
           

      * ADD SECTION

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
               MOVE " " TO fp_nom
               MOVE " " TO fp_prenom
               MOVE 0 TO fp_type
               MOVE " " TO fp_motDePasse
           	   MOVE 0 TO fp_year
           	   MOVE 0 TO fp_month
           	   MOVE 0 TO fp_day
               MOVE 0 TO fp_actif
               PERFORM WITH TEST AFTER UNTIL 
               Wvalide = 1 OR MENU-VALIDATE = "N"
                 ACCEPT PERS-EDITING-SCREEN
                 MOVE " " TO ERROR-MESSAGE
                 IF fp_type = 0 OR fp_type = 1 OR fp_type = 2 THEN
                    IF fp_actif = 0 OR fp_actif = 1 OR fp_actif = 2 THEN
                       MOVE 1 TO Wvalide
                    ELSE
                       MOVE "WRONG ACTIF TYPE" TO ERROR-MESSAGE
                    END-IF
                 ELSE 
                    MOVE "WRONG TYPE TYPE" TO ERROR-MESSAGE
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

       ADD_ROOM.
           MOVE 0 TO Wvalide
           OPEN INPUT fch
               PERFORM GET_LASTID_ROOM
               PERFORM WITH TEST AFTER UNTIL Wvalide = 1
                   ACCEPT ROOM-EDITING-SCREEN
                   IF fc_lit = 0 OR fc_lit = 1 OR fc_lit = 2 THEN
                       MOVE 1 TO Wvalide
                   ELSE
                       MOVE "WRONG BED TYPE" TO ERROR-MESSAGE
                       ACCEPT ROOM-EDITING-SCREEN
                       MOVE " " TO ERROR-MESSAGE
                   END-IF
               END-PERFORM
           CLOSE fch
           IF MENU-VALIDATE = "Y" THEN
               OPEN OUTPUT fch
                   WRITE tamp_fch
                   END-WRITE
               CLOSE fch
           ELSE
              MOVE "CREATION ABORT" TO ERROR-MESSAGE
           END-IF.


      * GENERAL SECTION

       GET_LASTID_ROOM.
           MOVE 0 TO Wfin
           MOVE 0 TO fc_numCh
           PERFORM UNTIL Wfin = 1
               READ fch
                   AT END
                       MOVE 1 TO Wfin
               END-READ
           END-PERFORM
           ADD 1 TO fc_numch.



      * 
       DISPLAY_MISSION.

