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
           88  MENU-PICK-IS-VALID VALUE 0 THRU 5.

       77  MENU-VALIDATE PIC A.
           88  MENU-VALIDATE-IS-VALID VALUE "Y", "N".
      
       77  ERROR-MESSAGE PIC X(79).
       77  WS-LOGIN PIC 9(4).
       77  WS-PASSWORD PIC X(30).
      

       SCREEN SECTION.

       COPY "screens_declarations.cpy".

       PROCEDURE DIVISION.
       
           MOVE FUNCTION CURRENT-DATE TO WS-CURRENT-DATE-DATA.
           PERFORM START_PROG.
           
      *    PERFORM REMOVE_RESA.
      *    PERFORM DISPLAY_MISSION.
      *    PERFORM ADD_PERSONNEL.

           

           
       START_PROG.
           PERFORM CREATE_FILES.
           PERFORM CONNECTION.
      
           PERFORM MENUS.


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

      * 0 -> RECEPTION; 1 -> CLEANING; 2 -> ADMIN
       MENUS.
           EVALUATE WS-CURRENT-USER-TYPE
               WHEN 0
                  PERFORM MENU_RECEP 
               WHEN 1
                  PERFORM MENU_CLEAN
               WHEN 2
                  PERFORM MENU_A_RECEP
           END-EVALUATE.

       MENU_CLEAN.
           PERFORM WITH TEST AFTER UNTIL MENU-PICK = 0
                ACCEPT CLEANING-SCREEN
                MOVE " " TO ERROR-MESSAGE
                EVALUATE MENU-PICK
                    WHEN 1
                       PERFORM DISPLAY_YOUR_MISSIONS
                    WHEN 2
                       PERFORM ASSIGNING_MISSION
                    WHEN 3
                       PERFORM CLOCK_IN_MISSION
                    WHEN 4
                       PERFORM STATS_PERF
                 END-EVALUATE
           END-PERFORM
           PERFORM LOGOUT.


       MENU_A_RECEP.
           PERFORM WITH TEST AFTER UNTIL MENU-PICK = 0
                ACCEPT A-RECEPTION-SCREEN
                MOVE " " TO ERROR-MESSAGE
                EVALUATE MENU-PICK
                    WHEN 1
                       PERFORM DISPLAY_PLANNING
                    WHEN 2
                       PERFORM MENU_RESERVATIONS
                    WHEN 3
                       PERFORM MENU_CUSTOMERS
                    WHEN 4
                       PERFORM STATS_ROOM
                    WHEN 5
                       PERFORM MENU_ADMIN
                 END-EVALUATE
           END-PERFORM
           PERFORM LOGOUT.

       MENU_ADMIN.
           PERFORM WITH TEST AFTER UNTIL MENU-PICK = 0
                ACCEPT ADMINISTRATION-SCREEN
                MOVE " " TO ERROR-MESSAGE
                EVALUATE MENU-PICK
                    WHEN 1
                       PERFORM ROOMS-MENU
                    WHEN 2
                       PERFORM STAFF-MENU
                    WHEN 3
                       PERFORM DELETE_MISSION
                    WHEN 4
                       PERFORM DELETE-CUSTOMER
                 END-EVALUATE
           END-PERFORM
           PERFORM MENU_A_RECEP.

       MENU_RECEP.
           PERFORM WITH TEST AFTER UNTIL MENU-PICK = 0
                ACCEPT RECEPTION-SCREEN
                MOVE " " TO ERROR-MESSAGE
                EVALUATE MENU-PICK
                    WHEN 1
                       PERFORM DISPLAY_PLANNING
                    WHEN 2
                       PERFORM MENU_RESERVATIONS
                    WHEN 3
                       PERFORM MENU_CUSTOMERS
                    WHEN 4
                       PERFORM STATS_ROOM
                 END-EVALUATE
           END-PERFORM
           PERFORM LOGOUT.

       DISPLAY_YOUR_MISSIONS.
           PERFORM DISPLAY_MISSION.

       ASSIGNING_MISSION.
       MOVE "NOT IMPLEMENTED YET" TO ERROR-MESSAGE.

       CLOCK_IN_MISSION.
       MOVE "NOT IMPLEMENTED YET" TO ERROR-MESSAGE.



       STATS_PERF.
           MOVE "NOT IMPLEMENTED YET" TO ERROR-MESSAGE.

       DISPLAY_PLANNING.
           MOVE "NOT IMPLEMENTED YET" TO ERROR-MESSAGE.

       MENU_RESERVATIONS.
           PERFORM WITH TEST AFTER UNTIL MENU-PICK = 0
                ACCEPT RESA-MENU-SCREEN
                MOVE " " TO ERROR-MESSAGE
                EVALUATE MENU-PICK
                   WHEN 1
                       PERFORM SEARCH_RESA
                   WHEN 2
                       PERFORM SEARCH_RESA
                       PERFORM MODIF_RESERVATION
                   WHEN 3
                       PERFORM ADD_RESERV
                   WHEN 4
                       PERFORM DELETE_RESA
                 END-EVALUATE
           END-PERFORM
           MOVE 1 TO MENU-PICK.

       MENU_CUSTOMERS.
           PERFORM WITH TEST AFTER UNTIL MENU-PICK = 0
                ACCEPT CUSTOMERS-MENU-SCREEN
                MOVE " " TO ERROR-MESSAGE
                EVALUATE MENU-PICK
                   WHEN 1
                       PERFORM SEARCH_CLIENT
      *             WHEN 2
      *                PERFORM MODIF_CLIENT
      *             WHEN 3
      *                PERFORM ADD_CLIENT
      *             WHEN 4
      *                PERFORM DELETE_CLIENT
                 END-EVALUATE
           END-PERFORM
           MOVE 1 TO MENU-PICK.

       STATS_ROOM.
           PERFORM WITH TEST AFTER UNTIL MENU-PICK = 0
                ACCEPT STATS-MENU-SCREEN
                MOVE " " TO ERROR-MESSAGE
                EVALUATE MENU-PICK
                   WHEN 2
                       PERFORM DISPLAY_BEST_HOUR
                 END-EVALUATE
           END-PERFORM
           MOVE 1 TO MENU-PICK.

       ROOMS-MENU.
           PERFORM WITH TEST AFTER UNTIL MENU-PICK = 0
                ACCEPT ROOMS-MENU-SCREEN
                MOVE " " TO ERROR-MESSAGE
                EVALUATE MENU-PICK
                   WHEN 3
                       PERFORM ADD_ROOM
                 END-EVALUATE
           END-PERFORM
           MOVE 1 TO MENU-PICK.

       STAFF-MENU.
           PERFORM WITH TEST AFTER UNTIL MENU-PICK = 0
                ACCEPT STAFF-MENU-SCREEN
                MOVE " " TO ERROR-MESSAGE
      *         EVALUATE MENU-PICK
      *             WHEN 1
      *                PERFORM SEARCH_PERS
      *             WHEN 2
      *                PERFORM MODIF_PERS
      *             WHEN 3
      *                PERFORM ADD_PERS
      *             WHEN 4
      *                PERFORM DELETE_PERS
      *          END-EVALUATE
           END-PERFORM
           MOVE 1 TO MENU-PICK.

       DELETE-CUSTOMER.
           MOVE "NOT IMPLEMENTED YET" TO ERROR-MESSAGE.



       LOGOUT.
           DISPLAY LOGOUT-SCREEN
           DISPLAY CUPIDON
           STOP RUN.

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
      * 0 -> FIRED; 1 -> HIRED; 2 -> LEAVE
                       IF fp_actif = 1 THEN
                          MOVE tamp_fpers TO WS-CURRENT-USER
                          MOVE 1 TO Wvalide
                       ELSE
                          MOVE "NON-ACTIF USER" TO ERROR-MESSAGE
                       END-IF
                    ELSE
                       MOVE "WRONG PASSWORD" TO ERROR-MESSAGE
                    END-IF
                 END-IF
               END-PERFORM.

       COPY "section_general.cpy".

       COPY "section_adding.cpy".

       COPY "section_delete.cpy".

       COPY "section_modify.cpy".

       COPY "section_search.cpy".

       COPY "section_display.cpy".
