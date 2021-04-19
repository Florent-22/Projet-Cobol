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
       
           MOVE FUNCTION CURRENT-DATE TO WS-CURRENT-DATE-DATA.
           PERFORM DELETE_RESA.
      *    PERFORM DISPLAY_MISSION.
      *    PERFORM ADD_PERSONNEL.

           STOP RUN.

           
       START_PROG.
           PERFORM CREATE_FILES.
           PERFORM CONNECTION.
           IF 


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

       COPY "section_general.cpy".

       COPY "section_add.cpy".

       COPY "section_delete.cpy".

       COPY "section_modify.cpy".

       COPY "section_search.cpy".

       COPY "section_display.cpy".
