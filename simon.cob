       DISPLAY_ROOM.
           DISPLAY "┌───────────────────────────────────────┐"
           DISPLAY "│        AFFICHAGE DES CHAMBRES         │"
           DISPLAY "└───────────────────────────────────────┘"
           OPEN INPUT fch
               MOVE 0 TO Wfin
               PERFORM UNTIL Wfin = 1
                   READ fch
                       AT END
                           MOVE 1 TO Wfin
                       NOT AT END
                           DISPLAY "┌──────────────────────────────────"
                                   "─────┐"
                           DISPLAY "│                 CHAMBRE          "
                                   "     │"
                           DISPLAY "│                                  "
                                   "     │"
                           DISPLAY "│ NUMERO : " fc_numCh
                           DISPLAY "│ TYPE : " fc_typeCh
                           DISPLAY "│ SUPERFICIE : " fc_superficie
                           DISPLAY "│ NB LITS : " fc_lit
                           DISPLAY "│ DESCRIPTION : " fc_description
                           DISPLAY '| PRIX/H : ' fc_prix_heure
                           DISPLAY "└──────────────────────────────────"
                                   "─────┘"
                   END-READ
               END-PERFORM
           CLOSE fch.

       DISPLAY_RESERV.
           DISPLAY "┌───────────────────────────────────────┐"
           DISPLAY "│        AFFICHAGE DES RESERVATIONS     │"
           DISPLAY "└───────────────────────────────────────┘"
           OPEN INPUT fresa
               MOVE 0 TO Wfin
               PERFORM UNTIL Wfin = 1
                   READ fresa
                       AT END
                           MOVE 1 TO Wfin
                       NOT AT END
                           DISPLAY "┌──────────────────────────────────"
                                   "─────┐"
                           DISPLAY "│                 RESERVARTION     "
                                   "     │"
                           DISPLAY "│                                  "
                                   "     │"
                           DISPLAY "│ NUMERO : " fr_numResa
                           DISPLAY "│ NUMERO CHAMBRE : " fr_numCh
                           DISPLAY "│ NUMERO CLIENT : " fr_numCL
                           DISPLAY "│ DUREE : " fr_duree_hours ":" 
                                      fr_duree_minute
                           DISPLAY "│ DEBUT : " fr_date_debut_day "/"
                                      fr_date_debut_month "/"
                                      fr_date_debut_year " "
                                      fr_date_debut_hours ":"
                                      fr_date_debut_minute
                           DISPLAY "│ DEBUT : " fr_date_fin_day "/"
                                      fr_date_fin_month "/"
                                      fr_date_fin_year " "
                                      fr_date_fin_hours ":"
                                      fr_date_fin_minute
                           DISPLAY "└──────────────────────────────────"
                                   "─────┘"
                   END-READ
               END-PERFORM
           CLOSE fresa.

      
       SRCH_PERSONNEL.
           DISPLAY "┌───────────────────────────────────────┐"
           DISPLAY "│ RECHERCHE D'UN MEMBRE DU PERSONNEL    │"
           DISPLAY "└───────────────────────────────────────┘"
           OPEN INPUT fresa
                DISPLAY "│ Numero du personnel :             "
                               " │"
                       DISPLAY "└──────────────────────────────────────"
                               "─┘"
                       ACCEPT Wid_personnel_to_find
                MOVE 0 TO Wfin
                MOVE 0 TO Wtrouve
                PERFORM WITH TEST AFTER UNTIL Wfin = 1 OR Wtrouve = 1
                    READ fresa
                        AT END
                            MOVE 1 TO Wfin
                            DISPLAY "Pas de reservation pour ce numéro"
                        NOT AT END
                            IF fresa_numP = Wid_personnel_to_find THEN
                                DISPLAY "┌─────────────────────────────"
                                        "──────────┐"
                                DISPLAY "│                 RESERVARTION"
                                        "          │"
                                DISPLAY "│                             "
                                        "          │"
                                DISPLAY "│ NUMERO : " fr_numResa
                                DISPLAY "│ NUMERO CHAMBRE : " fr_numCh
                                DISPLAY "│ NUMERO CLIENT : " fr_numCL
                                DISPLAY "│ DUREE : " fr_duree_hours ":" 
                                           fr_duree_minute
                                DISPLAY "│ DEBUT : " fr_date_debut_day 
                                           "/"
                                           fr_date_debut_month "/"
                                           fr_date_debut_year " "
                                           fr_date_debut_hours ":"
                                           fr_date_debut_minute
                                DISPLAY "│ DEBUT : " fr_date_fin_day "/"
                                           fr_date_fin_month "/"
                                           fr_date_fin_year " "
                                           fr_date_fin_hours ":"
                                           fr_date_fin_minute
                                DISPLAY "└─────────────────────────────"
                                        "──────────┘"
                                MOVE 1 TO Wtrouve
                            END-IF
                    END-READ
                END-PERFORM
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


       