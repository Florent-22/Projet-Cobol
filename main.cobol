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
      

       PROCEDURE DIVISION.
       
           PERFORM START_PROG

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