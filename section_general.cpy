       GENERAL SECTION.
      * NEED TO OPEN ROOM FILE BEFORE PERFORM
      * RETURN fc_numCh + 1
       GET_LASTID_ROOM.
           MOVE 0 TO Wfin
           MOVE 0 TO fc_numCh
           PERFORM UNTIL Wfin = 1
               READ fch
                   AT END
                       MOVE 1 TO Wfin
               END-READ
           END-PERFORM
           ADD 1 TO fc_numch.
       
       GET_LASTID_RESA.
           MOVE 0 TO Wfin
           MOVE 0 TO fr_numResa
           PERFORM UNTIL Wfin = 1
               READ fresa
                   AT END
                       MOVE 1 TO Wfin
               END-READ
           END-PERFORM
           ADD 1 TO fr_numResa.

      * fcl_numCl MUST BE COMPLETED BEFORE PERFORM THIS FUNCTION
       CLIENT_EXIST.
           MOVE 0 TO Wfin
           MOVE 0 TO Wtrouve
           OPEN INPUT fcli
               MOVE fr_numCL TO fcl_numCl
               READ fcli
                   INVALID KEY
                       MOVE 0 TO Wtrouve
                   NOT INVALID KEY
                       MOVE 1 TO Wtrouve
               END-READ
           CLOSE fcli.

       ROOM_EXIST.
           MOVE 0 TO Wfin
           MOVE 0 TO Wtrouve
           OPEN INPUT fch
               PERFORM WITH TEST AFTER UNTIL Wfin = 1 OR Wtrouve = 1
                   READ fch
                       AT END
                           MOVE 1 TO Wfin
                       NOT AT END
                           IF fc_numCh EQUAL fr_numCh THEN
                               MOVE 1 TO Wtrouve
                           END-IF
                   END-READ
               END-PERFORM
           CLOSE fch.

       GET_LASTID_CLIENT.
           MOVE 0 TO Wfin
           MOVE 0 TO fcl_numCl
           PERFORM UNTIL Wfin = 1
               READ fcli
                   AT END
                       MOVE 1 TO Wfin
               END-READ
           END-PERFORM
           ADD 1 TO fcl_numCl.

      * tamp_fresa must be completed
       CALCULATE_HOUR_RESA.
      *    ADD 2 HOUR TO CLEAN THE ROOM    
           ADD 2 TO fr_duree_hours
           ADD fr_duree_hours TO fr_date_fin_hours
           IF fr_date_fin_hours >= 24 THEN
               SUBTRACT 24 FROM fr_date_fin_hours
               ADD 1 TO fr_date_fin_day
           END-IF.

      * tamp_fresa MUST BE COMPLETED BEFORE CALL
       MISSION_EXIST.
           MOVE 0 TO Wstop
           MOVE 0 TO Wtrouve
           OPEN INPUT fmis
               MOVE fr_numCh TO fm_numCh
               START fmis, KEY = fm_numCh
               NOT INVALID KEY 
                   PERFORM WITH TEST AFTER UNTIL Wstop = 1
                       READ fmis NEXT
                       NOT AT END
                           IF fm_debut_day = WS-CURRENT-DAY AND 
                               fm_debut_hours = fr_date_fin_hours THEN
                               MOVE 1 TO Wtrouve
                           END-IF
                   END-PERFORM
               END-START
           CLOSE fmis.
       
       GET_LASTID_MISSION.
           MOVE 0 TO Wstop
           MOVE 0 TO fm_numM
           PERFORM UNTIL Wstop = 1
               READ fmis
                   AT END
                       MOVE 1 TO Wstop
               END-READ
           END-PERFORM
           ADD 1 TO fm_numM.

       GET_NB_PERS.
           MOVE 0 TO Wstop
           MOVE 0 TO Wcompteur
           OPEN INPUT fpers
           PERFORM WITH TEST AFTER UNTIL Wstop = 1
               READ fpers
               AT END
                   MOVE 1 TO Wstop
               NOT AT END
                   ADD 1 TO Wcompteur
               END-READ
           END-PERFORM
           CLOSE fpers.

       RESA_EXIST_DATE.
           MOVE 0 TO Wfin
           MOVE 0 TO Wtrouve
           PERFORM WITH TEST AFTER UNTIL Wfin = 1
               READ fresa
               AT END
                   MOVE 1 TO Wfin
               NOT AT END
                   IF fr_date_debut_day = 1fr_date_debut_day THEN
                       IF fr_date_debut_month = 1fr_date_debut_month 
                           THEN
                           IF fr_date_debut_year = 1fr_date_debut_year
                               THEN
                                   MOVE 1 TO Wtrouve
                           END-IF
                       END-IF
                   END-IF
               END-READ
           END-PERFORM.
