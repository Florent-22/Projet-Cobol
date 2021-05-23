       ADDING SECTION.

       ADD_MISSION.
           OPEN I-O fmis
               DISPLAY "Année du début de la mission : "
               ACCEPT fm_debut_year
               DISPLAY "Mois de début de la mission : "
               ACCEPT fm_debut_month
               DISPLAY "Jour de début de la mission : "
               ACCEPT fm_debut_day
               DISPLAY "Heure de début de la mission : "
               ACCEPT fm_debut_hours
               DISPLAY "Heure de début de la mission : "
               ACCEPT fm_debut_minute 
    
               DISPLAY "Année de fin de la mission : "
               ACCEPT fm_fin_year
               DISPLAY "Mois de début de la mission : "
               ACCEPT fm_fin_month
               DISPLAY "Jour de début de la mission : "
               ACCEPT fm_fin_day
               DISPLAY "Heure de début de la mission : "
               ACCEPT fm_fin_hours
               DISPLAY "Heure de début de la mission : "
               ACCEPT fm_fin_minute 
               
               WRITE tamp_fmis
                  INVALID KEY 
                     DISPLAY "Echec de l'ajout"
                  NOT INVALID KEY 
                     DISPLAY "Ajout réussi"
               END-WRITE
           CLOSE fmis.


       ADD_PERSONNEL.
           OPEN INPUT fpers
               MOVE 0 TO Wfin
               MOVE 0 TO fp_numP
               MOVE 0 TO Wvalide
               PERFORM WITH TEST AFTER UNTIL Wfin = 1
                 READ fpers
                    AT END 
                       MOVE 1 TO Wfin                         
                 END-READ
               END-PERFORM
               ADD 1 TO fp_numP
               MOVE " " TO fp_nom
               MOVE " " TO fp_prenom
               MOVE 0 TO fp_type
               MOVE " " TO fp_motDePasse
           	   MOVE 0 TO fp_year
           	   MOVE 0 TO fp_month
           	   MOVE 0 TO fp_day
               MOVE 0 TO fp_actif
               PERFORM WITH TEST AFTER UNTIL 
               Wvalide = 1 OR MENU-VALIDATE = "N"
                 ACCEPT PERS-EDITING-SCREEN
                 MOVE " " TO ERROR-MESSAGE
                 IF fp_type = 0 OR fp_type = 1 OR fp_type = 2 THEN
                    IF fp_actif = 0 OR fp_actif = 1 OR fp_actif = 2 THEN
                       MOVE 1 TO Wvalide
                    ELSE
                       MOVE "WRONG ACTIF TYPE" TO ERROR-MESSAGE
                    END-IF
                 ELSE 
                    MOVE "WRONG TYPE TYPE" TO ERROR-MESSAGE
                 END-IF
               END-PERFORM
           CLOSE fpers
           IF MENU-VALIDATE = "Y" THEN
              OPEN EXTEND fpers
                 WRITE tamp_fpers
                 END-WRITE
              CLOSE fpers
           ELSE
              MOVE "CREATION ABORT" TO ERROR-MESSAGE
           END-IF.


       ADD_RESERV.
           OPEN I-O fresa
               MOVE 0 TO Wvalide
               MOVE 0 TO Wtrouve
               PERFORM GET_LASTID_RESA
               MOVE 0 TO fr_numCh
               MOVE 0 TO fr_numCL
               MOVE " " TO fr_duree
               MOVE " " TO fr_date_debut
               MOVE " " TO fr_date_fin
               PERFORM WITH TEST AFTER UNTIL Wvalide = 1
                   ACCEPT RESA-EDITING-SCREEN
                   MOVE " " TO ERROR-MESSAGE
                   PERFORM CLIENT_EXIST
                   IF Wtrouve = 0 THEN
                       MOVE "CLIENT DOESN'T EXIST" TO ERROR-MESSAGE
                   ELSE
                       PERFORM ROOM_EXIST
                       IF Wtrouve = 0 THEN
                           MOVE "ROOM DOESN'T EXIST" TO ERROR-MESSAGE
                       ELSE
                           MOVE 1 TO Wvalide
                       END-IF
                   END-IF
                   IF MENU-VALIDATE = "N" THEN
                       MOVE 1 TO Wvalide
                   END-IF
               END-PERFORM
               IF MENU-VALIDATE = "Y" THEN
                   WRITE tamp_fresa
                       INVALID KEY 
                           MOVE "CREATION ERROR" TO ERROR-MESSAGE
                       NOT INVALID KEY 
                           MOVE "CREATION SUCCESS" TO ERROR-MESSAGE
                   END-WRITE
               ELSE
                   MOVE "CREATION ABORT" TO ERROR-MESSAGE
               END-IF.
           CLOSE fresa.


       ADD_ROOM.
           MOVE 0 TO Wvalide
           OPEN INPUT fch
               PERFORM GET_LASTID_ROOM
               MOVE " " TO fc_typeCh
               MOVE 0 TO fc_superficie
               MOVE 0 TO fc_lit
               MOVE " " TO fc_description
               MOVE 0 TO fc_prix_heure_entier
               MOVE 0 TO fc_prix_heure_decimal
               PERFORM WITH TEST AFTER UNTIL Wvalide = 1
                   ACCEPT ROOM-EDITING-SCREEN
                   MOVE " " TO ERROR-MESSAGE
                   IF fc_lit = 0 OR fc_lit = 1 OR fc_lit = 2 THEN
                       MOVE 1 TO Wvalide
                   ELSE
                       MOVE "WRONG BED TYPE" TO ERROR-MESSAGE
                   END-IF
               END-PERFORM
           CLOSE fch
           IF MENU-VALIDATE = "Y" THEN
               OPEN EXTEND fch
                   WRITE tamp_fch
                   END-WRITE
               CLOSE fch
           ELSE
              MOVE "CREATION ABORT" TO ERROR-MESSAGE
           END-IF.

       ADD_CLIENT.
           MOVE 0 TO Wvalide
           OPEN I-O fcli
               
               PERFORM GET_LASTID_CLIENT
               PERFORM WITH TEST AFTER UNTIL Wvalide = 1
                   ACCEPT ADD-CLI-SCREEN
                   MOVE " " TO ERROR-MESSAGE
                   IF (WS-CURRENT-YEAR - fcl_year) >= 18 THEN
                       MOVE 1 TO Wvalide
                   ELSE
                       MOVE "CUSTOMER MUST HAVE AT LEAST 18 YEARS OLD" 
                          TO ERROR-MESSAGE
                   END-IF
               END-PERFORM
               IF MENU-VALIDATE = "Y" THEN
                    
                        WRITE tamp_fcli
                          INVALID KEY
                             MOVE "ERROR OCCURED DURING CREATION"
                             TO ERROR-MESSAGE
                          NOT INVALID KEY
                             MOVE "CUSTOMER ADDED"
                             TO ERROR-MESSAGE
                        END-WRITE
                   
              ELSE     
                 MOVE "CREATION ABORT" TO ERROR-MESSAGE
              END-IF
           CLOSE fcli.
