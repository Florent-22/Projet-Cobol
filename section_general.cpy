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
