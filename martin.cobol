       ADD_ROOM.
           DISPLAY "┌───────────────────────────────────────┐"
           DISPLAY "│          AJOUT D'UNE CHAMBRE          │"
           DISPLAY "└───────────────────────────────────────┘"
           OPEN I-O fch
               DISPLAY "┌───────────────────────────────────────┐"
               DISPLAY "│ Numéro de chambre :                   │"
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
               WRITE tamp_fch
                   INVALID KEY
                       DISPLAY "│    Echec de l'ajout de la chambre    "
                               " │"
                   NOT INVALID KEY
                       DISPLAY "│               Ajout réussi           "
                               " │"
               END-WRITE
               DISPLAY "└───────────────────────────────────────┘"
           CLOSE fch.

       DISPLAY_CLIENT.
           DISPLAY "┌───────────────────────────────────────┐"
           DISPLAY "│        AFFICHAGE DES CLIENTS          │"
           DISPLAY "└───────────────────────────────────────┘"
           OPEN INPUT fcli
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
           CLOSE fcli.
       
       MODIF_RESERVATION.
           DISPLAY "┌───────────────────────────────────────┐"
           DISPLAY "│     MODIFICATION D'UNE RESERVATION    │"
           DISPLAY "└───────────────────────────────────────┘"
           OPEN I-O fresa
               DISPLAY "┌───────────────────────────────────────┐"
               DISPLAY "│ Numero de la reservation :            │"
               ACCEPT fr_numResa
               DISPLAY "└───────────────────────────────────────┘"

               DISPLAY "┌───────────────────────────────────────┐"
               READ fresa
                   INVALID KEY
                       DISPLAY "Cette réservation n'existe pas !"
                   NOT INVALID KEY
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
                       REWRITE tamp_fresa
               END-READ
               DISPLAY "└───────────────────────────────────────┘"
           CLOSE fresa.

       DELETE_MISSION.
           DISPLAY "┌───────────────────────────────────────┐"
           DISPLAY "│       SUPPRESSION D'UNE MISSION       │"
           DISPLAY "└───────────────────────────────────────┘"
           OPEN I-O fmis
               DISPLAY "┌───────────────────────────────────────┐"
               DISPLAY "│ Numero de la mission :                │"
               ACCEPT fm_numM
               DISPLAY "└───────────────────────────────────────┘"
 
               DISPLAY "┌───────────────────────────────────────┐"
               READ fmis
                   INVALID KEY
                       DISPLAY "│ Cette mission n'existe pas !"
                   NOT INVALID KEY
                       DELETE fmis RECORD
                       DISPLAY "│ La mission a bien été supprimée      "
                           " │"
               END-READ
               DISPLAY "└───────────────────────────────────────┘"
           CLOSE fmis.