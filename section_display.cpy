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