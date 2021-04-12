       ADD_CLIENT.
           DISPLAY "┌───────────────────────────────────────┐"
           DISPLAY "│          AJOUT D'UN CLIENT            │"
           DISPLAY "└───────────────────────────────────────┘"
           OPEN I-O fcli
               DISPLAY "┌───────────────────────────────────────┐"
               DISPLAY "│ Numéro de client :                    │"
               ACCEPT fcl_numCl
               DISPLAY "│ Nom :                                 │"
               ACCEPT fcl_nom
               DISPLAY "│ Prénom :                              │"
               ACCEPT fcl_prenom
               DISPLAY "│ Numéro de téléphone :                 │"
               ACCEPT fcl_tel
               DISPLAY "│ Adresse :                             │"
               ACCEPT fcl_adr
               DISPLAY "│ Année de naissance :                   │"
               ACCEPT fp_year
               DISPLAY "│ Mois de naissance :                   │"
               ACCEPT fp_month
               DISPLAY "│ Jour de naissance :                   │"
               ACCEPT fp_day
               DISPLAY "└───────────────────────────────────────┘"
               
               DISPLAY "┌───────────────────────────────────────┐"
               WRITE tamp_fcli
                   INVALID KEY
                       DISPLAY "│    Echec de l'ajout du client   "
                               " │"
                   NOT INVALID KEY
                       DISPLAY "│               Ajout réussi           "
                               " │"
               END-WRITE
               DISPLAY "└───────────────────────────────────────┘"
           CLOSE fcli.

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