       SEARCHING SECTION.

      
      * PERSONNEL ID MUST BE IN WS-LOGIN BEFORE CALL SEARCH_PERSONNEL
       SEARCH_PERSONNEL.
           OPEN INPUT fpers
              MOVE 0 TO Wfin
              PERFORM WITH TEST AFTER UNTIL Wfin = 1 OR Wtrouve = 1
                 READ fpers
                    AT END 
                       MOVE 1 TO Wfin  
                    NOT AT END
                       IF fp_numP = WS-LOGIN THEN
                          MOVE 1 TO Wtrouve
                       END-IF                     
                 END-READ
               END-PERFORM
               IF Wtrouve = 0 THEN
                 MOVE " " TO fp_motDePasse
               END-IF
           CLOSE fpers.

      * WS-NUMCLI MUST BE FULL BEFORE CALL THIS FUNCTION
       SEARCH_CLIENT.
           OPEN INPUT fcli
              ACCEPT SRCH-CLI-SCREEN
              MOVE " " TO ERROR-MESSAGE
              READ fcli
                 INVALID KEY 
                    MOVE "THIS CLIENT DOESN'T EXIST" TO ERROR-MESSAGE
               END-READ
           CLOSE fcli.

      * SEARCH RESA WITH THE RESA NUMBER
       SEARCH_RESA.
           MOVE 0 TO Wtrouve
           OPEN INPUT fresa
           ACCEPT SEARCH_RESA_NUM_SCREEN
              MOVE " " TO ERROR-MESSAGE
              READ fresa
                 INVALID KEY 
                    MOVE "THIS RESERVATION DOESN'T EXIST" 
                    TO ERROR-MESSAGE
                    MOVE 0 TO Wtrouve
                 NOT INVALID KEY
                    MOVE 1 TO Wtrouve
              END-READ
           CLOSE fresa.
           

      * A COMPLETER
       SRCH_ROOM.
      *       OPEN INPUT fch
      *       MOVE 0 to Wchoix1
      *        PERFORM WITH TEST AFTER UNTIL 
      *        Wchoix1 = 1 OR Wchoix1 = 2 OR Wchoix1 = 2 OR Wchoix1 = 3         
      *          DISPLAY "1 - Recherche par id"
      *          DISPLAY "2 - Recherche par type"
      *          ACCEPT Wchoix1
      *         END-PERFORM
      *          EVALUATE Wchoix1
      *                WHEN 1
      *                   DISPLAY "id de la chambre recherché :"   
      *                   ACCEPT Wchoix2                                        
      *                WHEN 2
      *                   DISPLAY "type de la chambre recherché :"   
      *                   ACCEPT Wchoix2
      *          END-EVALUATE 
      *         MOVE 0 TO Wfin
      *         PERFORM UNTIL Wfin = 1 
      *         read fch
      *         AT END
      *             MOVE 1 TO Wfin
      *         NOT AT END
      *          IF Wchoix2 = fc_numch THEN
      *             DISPLAY fc_numch
      *          END-IF
      *          IF Wchoix2 = fc_typeCh THEN
      *             DISPLAY fc_typeCh
      *          END-IF
      *         END-PERFORM
      *       CLOSE fch.

       SEARCH_MISSION.
           MOVE 0 TO Wtrouve
           MOVE 0 TO Wvalide
           PERFORM WITH TEST AFTER UNTIL Wvalide = 1
               ACCEPT MISS-SEARCH-SCREEN
               MOVE " " TO ERROR-MESSAGE
               MOVE 1 TO Wvalide
           END-PERFORM
           IF MENU-VALIDATE = "Y" OR MENU-VALIDATE = "y" THEN
               OPEN INPUT fmis
                READ fmis
                    INVALID KEY 
                        MOVE "THIS MISSION DOESN'T EXIST" 
                            TO ERROR-MESSAGE
                        MOVE 0 TO Wtrouve
                    NOT INVALID KEY
                        MOVE 1 TO Wtrouve
                END-READ
               CLOSE fmis
           END-IF.
