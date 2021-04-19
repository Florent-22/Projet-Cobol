MODIF SECTION.


       MODIF_RESERVATION.
           MOVE 0 TO Wvalide
           OPEN I-O fresa
               ACCEPT fr_numResa
               READ fresa
                   INVALID KEY
                       DISPLAY "Cette réservation n'existe pas !"
                   NOT INVALID KEY
                       PERFORM WITH TEST AFTER UNTIL Wvalide = 1
                           ACCEPT RESA-EDITING-SCREEN
                           MOVE " " TO ERROR-MESSAGE
                           MOVE 1 TO Wvalide
                       END-PERFORM
                       IF MENU-VALIDATE = "Y" THEN
                           REWRITE tamp_fresa
                       ELSE
                           MOVE "MODIFICATION ABORT" TO ERROR-MESSAGE
                       END-IF
               END-READ
           CLOSE fresa.