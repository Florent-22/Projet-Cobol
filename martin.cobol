       ADD_ROOM.
           DISPLAY "┌───────────────────────────────────────┐"
           DISPLAY "│          AJOUT D'UNE CHAMBRE          │"
           DISPLAY "└───────────────────────────────────────┘"
           OPEN I-O froom
<<<<<<< HEAD
               DISPLAY "┌───────────────────────────────────────┐"
               DISPLAY "│ Numéro de chambre :                   │"
=======
               DISPLAY "?????????????????????????????????????????"
               DISPLAY "? Num�ro de chambre :                   ?"
>>>>>>> 0f6f003b2668a5814b335a53f9610fca8e0a224c
               ACCEPT fc_numCh
               DISPLAY "│ Type de chambre :                     │"
               ACCEPT fc_typeCh
               DISPLAY "│ Superficie de la chambre :            │"
               ACCEPT fc_superficie
               DISPLAY "│ Type de lit :                         │"
               ACCEPT fc_lit
               DISPLAY "│ Description de la chmabre :           │"
               ACCEPT fc_description
               DISPLAY "└───────────────────────────────────────┘"
               
               DISPLAY "┌───────────────────────────────────────┐"
               WRITE tamp_froom
                   INVALID KEY
                       DISPLAY "│    Echec de l'ajout de la chambre    "
                               " │"
                   NOT INVALID KEY
<<<<<<< HEAD
                       DISPLAY "│               Ajout réussi           "
                               " │"
=======
                       DISPLAY "?               Ajout r�ussi           "
                               " ?"
>>>>>>> 0f6f003b2668a5814b335a53f9610fca8e0a224c
               END-WRITE
               DISPLAY "└───────────────────────────────────────┘"
           CLOSE froom.

       DISPLAY_CLIENT.
           DISPLAY "┌───────────────────────────────────────┐"
           DISPLAY "│        AFFICHAGE DES CLIENTS          │"
           DISPLAY "└───────────────────────────────────────┘"
           OPEN INPUT fclient
               MOVE 0 TO Wfin
               PERFORM UNTIL Wfin = 1
                   READ fclient
                       AT END
                           MOVE 1 TO Wfin
                       NOT AT END
                           DISPLAY "┌──────────────────────────────────"
                                   "─────┐"
                           DISPLAY "│                 CLIENT           "
                                   "     │"
                           DISPLAY "│                                  "
                                   "     │"
                           DISPLAY "│ NUMERO : " fcl_numCl
                           DISPLAY "│ NOM : " fcl_nom
                           DISPLAY "│ PRENOM : " fcl_prenom
                           DISPLAY "│ TELEPHONE : " fcl_tel
                           DISPLAY "│ ADRESSE : " fcl_adr
                           DISPLAY "│ DATE DE NAISSANCE : " 
                                   fp_year "/"
                                   fp_month "/"
                                   fp_day "/"
                           DISPLAY "└──────────────────────────────────"
                                   "─────┘"
                   END-READ
               END-PERFORM
           CLOSE fclient.
       
       MODIF_RESERVATION.
           DISPLAY "┌───────────────────────────────────────┐"
           DISPLAY "│     MODIFICATION D'UNE RESERVATION    │"
           DISPLAY "└───────────────────────────────────────┘"
           OPEN I-O freservation
               DISPLAY "┌───────────────────────────────────────┐"
               DISPLAY "│ Numero de la reservation :            │"
               ACCEPT fr_numResa
               DISPLAY "└───────────────────────────────────────┘"

               DISPLAY "┌───────────────────────────────────────┐"
               READ freservation
                   INVALID KEY DISPLAY
                       DISPLAY ""
                   NOT INVALID KEY DISPLAY
                       DISPLAY "│  NOUVELLES VALEURS DE LA RESERVATION "
                               " │"
                       DISPLAY "│ Numero de chambre :                  "
                               " │"
                       ACCEPT fr_numCh
                       DISPLAY "│ Numero de client :                   "
                               " │"
                       ACCEPT fr_numCl
                       DISPLAY "│ Jour de début de la reservation :    "
                               " │"
                       ACCEPT fr_date_debut_day
                       DISPLAY "│ Mois de début de la resevration :    "
                               " │"
                       ACCEPT fr_date_debut_month
                       DISPLAY "│ Année de début de la reservation :   "
                               " │"
                       ACCEPT fr_date_debut_year
                       DISPLAY "│ Heure de début de la rervation :     "
                               " │"
                       ACCEPT fr_date_debut_hours
                       DISPLAY "│ Minute de début de la resevation :   "
                               " │"
                       ACCEPT fr_date_debut_minute
                       DISPLAY "│ Jour de fin de la reservation :      "
                               " │"
                       ACCEPT fr_date_fin_day
                       DISPLAY "│ Mois de fin de la resevration :      "
                               " │"
                       ACCEPT fr_date_fin_month
                       DISPLAY "│ Année de fin de la reservation :     "
                               " │"
                       ACCEPT fr_date_fin_year
                       DISPLAY "│ Heure de fin de la rervation :       "
                               " │"
                       ACCEPT fr_date_fin_hours
                       DISPLAY "│ Minute de fin de la resevation :     "
                               " │"
                       ACCEPT fr_date_fin_minute
                       REWRITE tamp_freservation
                       DISPLAY "└──────────────────────────────────────"
                               "─┘"
               END-READ
           CLOSE freservation.
               