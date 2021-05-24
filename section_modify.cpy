       MODIF SECTION.


       MODIF_RESERVATION.
           IF Wtrouve EQUAL 1 THEN
              MOVE 0 TO Wtrouve
              MOVE 0 TO Wvalide
              PERFORM WITH TEST AFTER UNTIL Wvalide = 1
                  ACCEPT RESA-EDITING-SCREEN
                  MOVE " " TO ERROR-MESSAGE
                  MOVE 1 TO Wvalide
              END-PERFORM
              IF MENU-VALIDATE = "Y" OR MENU-VALIDATE = "y" THEN
                  OPEN I-O fresa
                      READ fresa
                      INVALID KEY
                          MOVE "INEXISTING RESERVATION" TO ERROR-MESSAGE
                      NOT INVALID KEY
                          REWRITE tamp_fresa
                      END-READ
                  CLOSE fresa
              ELSE
                  MOVE "MODIFICATION ABORT" TO ERROR-MESSAGE
              END-IF
            END-IF.


       MODIF_PERSONNEL.
           MOVE 0 TO Wvalide
           PERFORM WITH TEST AFTER UNTIL Wvalide = 1
               ACCEPT PERS-EDITING-SCREEN
               MOVE " " TO ERROR-MESSAGE
               MOVE 1 TO Wvalide
           END-PERFORM
           IF MENU-VALIDATE = "Y" OR MENU-VALIDATE = "y" THEN
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
       


       MODIF_CLIENT.
           MOVE 0 TO Wvalide
           PERFORM WITH TEST AFTER UNTIL Wvalide = 1
                   ACCEPT ADD-CLI-SCREEN
                   MOVE tamp_fcli TO 1tamp_fcli
                   MOVE " " TO ERROR-MESSAGE
                   IF (WS-CURRENT-YEAR - fcl_year) >= 18 THEN
                       MOVE 1 TO Wvalide
                   ELSE
                       MOVE "CUSTOMER MUST HAVE AT LEAST 18 YEARS OLD" 
                          TO ERROR-MESSAGE
                   END-IF
           END-PERFORM
           IF MENU-VALIDATE = "Y" OR MENU-VALIDATE = "y" THEN
               OPEN I-O fcli
                   READ fcli
                   INVALID KEY
                       MOVE "INEXISTING CLIENT" TO ERROR-MESSAGE
                   NOT INVALID KEY
                       MOVE 1tamp_fcli TO tamp_fcli
                       MOVE "MODIFICATION SUCCESS" TO ERROR-MESSAGE
                       REWRITE tamp_fcli
                   END-READ
               CLOSE fcli
           ELSE
               MOVE "MODIFICATION ABORT" TO ERROR-MESSAGE
           END-IF.


       MODIF_ROOM.
           MOVE 0 TO Wvalide
           OPEN INPUT fch
           ACCEPT ROOM_GET_ID
           MOVE " " TO ERROR-MESSAGE
           MOVE fc_numCh TO WS-NUM-CH
           MOVE 0 TO Wfin
           MOVE 0 TO Wtrouve
           MOVE 0 TO Wcompteur
           PERFORM WITH TEST AFTER UNTIL Wfin = 1 OR Wtrouve = 1
               READ fch
                   AT END
                       MOVE 1 TO Wfin
                       MOVE "INEXISTING ROOM" TO ERROR-MESSAGE
                   NOT AT END
                       IF fc_numCh EQUAL WS-NUM-CH THEN
                           MOVE 1 TO Wtrouve
                           PERFORM WITH TEST AFTER UNTIL Wvalide = 1
                          ACCEPT ROOM-EDITING-SCREEN
                          MOVE " " TO ERROR-MESSAGE
                          IF fc_lit = 0 OR fc_lit = 1 OR fc_lit = 2 THEN
                              MOVE 1 TO Wvalide
                          ELSE
                              MOVE "WRONG BED TYPE" TO ERROR-MESSAGE
                          END-IF
                          END-PERFORM
                      IF MENU-VALIDATE = "Y" OR MENU-VALIDATE = "y" THEN
                  
                 
                          WRITE tamp_fch
                          END-WRITE
                      
                  
              ELSE
                 MOVE "MODIFICATION ABORT" TO ERROR-MESSAGE
              END-IF
                       END-IF
               END-READ
           END-PERFORM
           CLOSE fch.
