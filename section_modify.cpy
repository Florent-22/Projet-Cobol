       MODIF SECTION.


       MODIF_RESERVATION.
           MOVE 0 TO Wvalide
           PERFORM WITH TEST AFTER UNTIL Wvalide = 1
               ACCEPT RESA-EDITING-SCREEN
               MOVE " " TO ERROR-MESSAGE
               MOVE 1 TO Wvalide
           END-PERFORM
           IF MENU-VALIDATE = "Y" THEN
               OPEN I-O fresa
                   READ fresa
                   INVALID KEY
                       DISPLAY "Cette réservation n'existe pas !"
                   NOT INVALID KEY
                       REWRITE tamp_fresa
                   END-READ
               CLOSE fresa
           ELSE
               MOVE "MODIFICATION ABORT" TO ERROR-MESSAGE
           END-IF.

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
       


       MODIF_ROOM.
           MOVE 0 TO Wvalide
           OPEN INPUT fch
           ACCEPT ROOM_GET_ID
           MOVE " " TO ERROR-MESSAGE
           MOVE fch_numCh TO WS-NUM-CH
           MOVE 0 TO Wfin
           MOVE 0 TO Wtrouve
           MOVE 0 TO Wcompteur
           PERFORM WITH TEST AFTER UNTIL Wfin = 1 OR Wtrouve = 1
               READ fch
                   AT END
                       MOVE 1 TO Wfin
                       MOVE "INEXISTING ROOM" TO ERROR-MESSAGE
                   NOT AT END
                       IF fc_numCh NOT EQUAL WS-NUM-CH THEN
                           ADD 1 TO Wcompteur
                           MOVE 1 TO Wtrouve
                       END-IF
               END-READ
           END-PERFORM
           CLOSE fch
           
       
           IF Wtrouve = 1 THEN
              MOVE 0 TO Wtrouve
              PERFORM WITH TEST AFTER UNTIL Wvalide = 1
                   ACCEPT ROOM-EDITING-SCREEN
                   MOVE " " TO ERROR-MESSAGE
                   IF fc_lit = 0 OR fc_lit = 1 OR fc_lit = 2 THEN
                       MOVE 1 TO Wvalide
                   ELSE
                       MOVE "WRONG BED TYPE" TO ERROR-MESSAGE
                   END-IF
              END-PERFORM
              IF MENU-VALIDATE = "Y" THEN
                  OPEN I-O fch
                  PERFORM WITH TEST AFTER UNTIL Wtrouve = 1 OR Wfin = 1
                    READ fch
                       AT END
                         MOVE 1 TO Wfin
                         MOVE "READING ERROR" TO ERROR-MESSAGE
                       NOT AT END
                          IF Wcompteur EQUAL 0 THEN
                          WRITE tamp_fch
                          END-WRITE
                          END-IF
                         SUBTRACT 1 FROM Wcompteur
                    END-READ
                  END-PERFORM
                      
                  CLOSE fch
              ELSE
                 MOVE "MODIFICATION ABORT" TO ERROR-MESSAGE
              END-IF
           END-IF.
