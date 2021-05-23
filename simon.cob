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


       