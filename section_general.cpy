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
           OPEN INPUT fcli
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
           ADD fr_duree_hours TO fr_date_fin_hours
           IF fr_date_fin_hours >= 24 THEN
               SUBTRACT 24 FROM fr_date_fin_hours
               ADD 1 TO fr_date_fin_day
           END-IF
