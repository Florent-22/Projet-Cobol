       DELETING SECTION.


       DELETE_MISSION.
           OPEN I-O fmis  
               ACCEPT MISS-REMOVE-SCREEN
               MOVE " " TO ERROR-MESSAGE
               READ fmis
                   INVALID KEY
                       MOVE "Cette mission n'existe pas !" 
                           TO ERROR-MESSAGE
                   NOT INVALID KEY
                       ACCEPT MISS-REMOVE-SCREEN
                       MOVE " " TO ERROR-MESSAGE
                       IF MENU-VALIDATE = "Y" THEN
                           DELETE fmis RECORD
                       ELSE
                           MOVE "SUPPRESSION ABORT" TO ERROR-MESSAGE
                       END-IF
               END-READ
           CLOSE fmis.

           
       DELETE_PERSONNEL.
           OPEN I-O fpers
               MOVE 0 TO Wfin
               MOVE 0 TO Wtrouve
               ACCEPT PERS-REMOVE-SCREEN
               MOVE " " TO ERROR-MESSAGE
               PERFORM WITH TEST AFTER UNTIL Wfin = 1 AND Wtrouve = 1
                   READ fpers
                   AT END
                       MOVE 1 TO Wfin
                   NOT AT END
                       IF 1fp_numP = fp_numP THEN
                           MOVE tamp_fpers TO 1tamp_fpers
                           ACCEPT PERS-REMOVE-SCREEN
                           MOVE " " TO ERROR-MESSAGE
                           IF MENU-VALIDATE = "Y" THEN
                               MOVE 0 TO fp_actif
                               REWRITE tamp_fpers
                           ELSE
                               MOVE "SUPPRESSION ABORT" TO ERROR-MESSAGE
                           END-IF
                           MOVE 1 TO Wtrouve
                       END-IF
                   END-READ
               END-PERFORM
           CLOSE fpers.


      * FIND THE RESERVATION AND DISPLAY THE SCREEN FOR REMOVAL
       DELETE_RESA.
           OPEN I-O fresa
              ACCEPT RESA-REMOVE-SCREEN
              MOVE " " TO ERROR-MESSAGE
              READ fresa
              INVALID KEY
                 MOVE "NO RESERVATION FOR THIS GIVEN NUMBER" 
                    TO ERROR-MESSAGE
              NOT INVALID KEY
                 OPEN INPUT fcli
                    MOVE fr_numCl TO fcl_numCl
                    READ fcli
                    INVALID KEY
                       MOVE "CORRUPT RESERVATION" 
                       TO ERROR-MESSAGE
                     NOT INVALID KEY
                       ACCEPT RESA-REMOVE-SCREEN
                       MOVE " " TO ERROR-MESSAGE
                       IF MENU-VALIDATE = "Y" THEN
                          DELETE fresa RECORD
                       ELSE
                          MOVE "SUPPRESSION ABORT" TO ERROR-MESSAGE
                       END-IF
                 CLOSE fcli
              END-READ 
           CLOSE fresa.


       DELETE_CLIENT.
           OPEN I-O fcli
               ACCEPT SRCH-CLI-SCREEN
               MOVE " " TO ERROR-MESSAGE
               READ fcli
                   INVALID KEY
                       MOVE "CUSTOMER DOESNT SEEM TO EXIST" 
                       TO ERROR-MESSAGE
                   NOT INVALID KEY
      * CHECK IF EXIST IN RESA
                       DELETE fcli RECORD
                       MOVE "CUSTOMER REMOVED" 
                       TO ERROR-MESSAGE
               END-READ
           CLOSE fcli.
