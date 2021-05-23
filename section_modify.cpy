       MODIF SECTION.


       MODIF_RESERVATION.
           MOVE 0 TO Wvalide
           OPEN I-O fresa
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

       MODIF_PERSONNEL.
           MOVE 0 TO Wvalide
           PERFORM WITH TEST AFTER UNTIL Wvalide = 1
               ACCEPT PERS-EDITING-SCREEN
               MOVE " " TO ERROR-MESSAGE
               MOVE 1 TO Wvalide
           END-PERFORM
           IF MENU-VALIDATE = "Y" THEN
               OPEN I-O fpers
                   PERFORM WITH TEST AFTER UNTIL Wfin = 1 
                                   AND Wtrouve = 1
                       READ fpers
                       AT END
                           MOVE 1 TO Wfin
                       NOT AT END
      *                    USE 1 tamp_fpers                 
                           IF tamp_fpers = 1tamp_fpers THEN
                               REWRITE tamp_fpers
                           END-IF
                       END-READ
                   END-PERFORM
               CLOSE fpers
           ELSE
               MOVE "MODIFICATION ABORT" TO ERROR-MESSAGE
           END-IF.
