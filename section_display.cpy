       DISPLAYING SECTION.


      * DISPLAY MISSIONS OF THE CONNECTED USER
      * SEARCH BY ZONE ON fm_numP
       DISPLAY_MISSION.
           OPEN INPUT fmis
           MOVE WS-CURRENT-USER-NUM TO fm_numP
                 START fmis KEY IS EQUAL fm_numP 
                    INVALID KEY
                       MOVE "NO MISSIONS FOR YOU" TO ERROR-MESSAGE
                       DISPLAY DISP-MISSIONS-SCREEN
                    NOT INVALID KEY
                       MOVE 0 TO Wfin
                       MOVE 0 TO Wstop
                       PERFORM WITH TEST AFTER UNTIL Wfin = 1
                       AND Wstop = 1
                          MOVE 1 TO Wdisp
                          READ fmis NEXT
                             AT END
                                DISPLAY DISP-MISSIONS-SCREEN
                                MOVE 1 TO Wfin
                             NOT AT END
                               IF fm_numP = WS-CURRENT-USER-NUM THEN
                                   IF fm_fin < WS-CURRENT-DATE-DATA THEN
                                      MOVE 0 TO Wfin    
                                   ELSE
                                      IF Wdisp = 1 THEN
                                         MOVE tamp_fmis TO 1tamp_fmis
                                      ELSE IF Wdisp = 2 THEN
                                         MOVE tamp_fmis TO 2tamp_fmis
                                      ELSE IF Wdisp = 3 THEN
                                         MOVE tamp_fmis TO 3tamp_fmis
                                      ELSE IF Wdisp = 4 THEN
                                         MOVE tamp_fmis TO 4tamp_fmis
                                      ELSE IF Wdisp = 5 THEN
                                         MOVE tamp_fmis TO 5tamp_fmis
                                      ELSE IF Wdisp = 6 THEN
                                         MOVE tamp_fmis TO 6tamp_fmis
                                         MOVE 0 TO Wdisp
                                         DISPLAY DISP-MISSIONS-SCREEN
                                      END-IF
                                      ADD 1 TO Wdisp
                                   END-IF
                                ELSE
                                   MOVE 1 TO Wstop
                                END-IF
                          END-READ
                       END-PERFORM 
                 END-START
           CLOSE fmis.
           

      * DISPLAY PERSONNEL
       DISPLAY_PERSONNEL.
           OPEN INPUT fpers
           MOVE 0 TO Wfin
           MOVE 0 TO Wstop
               PERFORM WITH TEST AFTER UNTIL Wfin = 1
               AND Wstop = 1
                   MOVE 1 TO Wdisp
                   READ fmis NEXT
                       AT END
                           DISPLAY DISP-PERSONNEL-SCREEN
                           MOVE 1 TO Wfin
                       NOT AT END
                           IF Wdisp = 1 THEN
                               MOVE tamp_fpers TO 1tamp_fpers
                           ELSE IF Wdisp = 2 THEN
                               MOVE tamp_fpers TO 2tamp_fpers
                           ELSE IF Wdisp = 3 THEN
                               MOVE tamp_fpers TO 3tamp_fpers
                           ELSE IF Wdisp = 4 THEN
                               MOVE tamp_fpers TO 4tamp_fpers
                           ELSE IF Wdisp = 5 THEN
                               MOVE tamp_fpers TO 5tamp_fpers
                           ELSE IF Wdisp = 6 THEN
                               MOVE tamp_fpers TO 6tamp_fpers
                               MOVE 0 TO Wdisp
                           DISPLAY DISP-PERSONNEL-SCREEN
                           ADD 1 TO Wdisp
                   END-READ
               END-PERFORM
           CLOSE fpers.

       DISPLAY_NB_MISSION_JOUR.
           OPEN INPUT fmis
              ACCEPT NB-MIS-JOUR-SCREEN
              MOVE " " TO ERROR-MESSAGE
              MOVE 0 TO WS-NB-MIS
              MOVE fm_numP TO WS-NUMP
              MOVE fm_fin_date TO WS-FIN-MIS-DATE
              START fmis KEY IS EQUAL fm_numP 
                    INVALID KEY
                       MOVE "NO MISSIONS FOR THIS STAFF" TO 
                          ERROR-MESSAGE
                       DISPLAY NB-MIS-JOUR-SCREEN
                    NOT INVALID KEY
                       MOVE 0 TO Wfin
                       MOVE 0 TO Wstop
                       PERFORM WITH TEST AFTER UNTIL Wfin = 1
                       AND Wstop = 1
                          READ fmis NEXT
                             AT END
                                DISPLAY NB-MIS-JOUR-SCREEN
                                MOVE 1 TO Wfin
                             NOT AT END
                              IF fm_numP = WS-NUMP THEN
                                   IF fm_fin_date = WS-FIN-MIS-DATE THEN
                                      MOVE 0 TO Wfin    
                                      ADD 1 TO WS-NB-MIS
                                   END-IF
                                ELSE
                                   MOVE 1 TO Wstop
                                END-IF
                          END-READ
                       END-PERFORM 
                 END-START
              DISPLAY NB-MIS-JOUR-SCREEN
           CLOSE fmis.

      * DISPLAY CLIENT
       DISPLAY_CLIENT.
           OPEN INPUT fcli
           MOVE 0 TO Wfin
           MOVE 0 TO Wstop
               PERFORM WITH TEST AFTER UNTIL Wfin = 1
               AND Wstop = 1
                   MOVE 1 TO Wdisp
                   READ fcli NEXT
                       AT END
                           DISPLAY DISP-CLIENT-SCREEN
                           MOVE 1 TO Wfin
                       NOT AT END                  
                           IF Wdisp = 1 THEN
                               MOVE tamp_fcli TO 1tamp_fcli
                           ELSE IF Wdisp = 2 THEN
                               MOVE tamp_fcli TO 2tamp_fcli
                           ELSE IF Wdisp = 3 THEN
                               MOVE tamp_fcli TO 3tamp_fcli
                           ELSE IF Wdisp = 4 THEN
                               MOVE tamp_fcli TO 4tamp_fcli
                           ELSE IF Wdisp = 5 THEN
                               MOVE tamp_fcli TO 5tamp_fcli
                           ELSE IF Wdisp = 6 THEN
                               MOVE tamp_fcli TO 6tamp_fcli
                               MOVE 0 TO Wdisp
                           DISPLAY DISP-CLIENT-SCREEN
                           ADD 1 TO Wdisp
                       END-READ
               END-PERFORM
           CLOSE fcli.
