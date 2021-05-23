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
       
       CLIENT_EXIST.
           MOVE 0 TO Wfin
           OPEN fcli
               READ fcli
                   INVALID KEY
                       Wvalide = 0
                   NOT INVALID KEY
                       Wvalide = 1
               END-READ
           CLOSE fcli.
