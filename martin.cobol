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
                                   fp_day
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
               DISPLAY "└───────────────────────────────────────┘"
               ACCEPT fr_numResa

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
               DISPLAY "└───────────────────────────────────────┘"
               ACCEPT fm_numM
 
               DISPLAY "┌───────────────────────────────────────┐"
               READ fmis
                   INVALID KEY
                       DISPLAY "│ Cette mission n'existe pas !         "
                           " │"
                   NOT INVALID KEY
                       DELETE fmis RECORD
                       DISPLAY "│ La mission a bien été supprimée      "
                           " │"
               END-READ
               DISPLAY "└───────────────────────────────────────┘"
           CLOSE fmis.
       
       SRCH_MISSION.
           DISPLAY "┌───────────────────────────────────────┐"
           DISPLAY "│        RECHERCHE D'UNE MISSION        │"
           DISPLAY "└───────────────────────────────────────┘"
           
           
           OPEN INPUT fmis
               PERFORM UNTIL Wchoix < 0 or Wchoix > 4
                  DISPLAY "┌───────────────────────────────────────┐"
                  DISPLAY "│ Ajout d'un filtre de recherche :      │"
                  DISPLAY "│                                       │"
                  DISPLAY "│ Par numéro de mission (0)             │"
                  DISPLAY "│ Par numéro de personnel (1)           │"
                  DISPLAY "│ Par numéro de chambre (2)             │"
                  DISPLAY "│ Par numéro de date de début (3)       │"
                  DISPLAY "│ Par numéro de date de fin (4)         │"
                  DISPLAY "└───────────────────────────────────────┘"
                  ACCEPT Wchoix
               END-PERFORM
        
               DISPLAY "┌───────────────────────────────────────┐"
               EVALUATE Wchoix
                   WHEN 0
                       DISPLAY "│ Numero de la mission :               "
                               " │"
                       DISPLAY "└──────────────────────────────────────"
                               "─┘"
                       ACCEPT Wfiltre
                       MOVE Wfiltre TO fm_numM
    
                       START fmis KEY IS fm_numM
                       INVALID KEY
                           DISPLAY "Pas de mission pour ce numéro"
                   WHEN 1
                       DISPLAY "│ Numero du personnel :                "
                               " │"
                       DISPLAY "└──────────────────────────────────────"
                               "─┘"
                       ACCEPT Wfiltre
                       MOVE Wfiltre TO fm_numP
    
                       START fmis KEY IS fm_numP
                       INVALID KEY
                           DISPLAY "Pas de mission pour ce personnel"
                   WHEN 2
                       DISPLAY "│ Numero de la chambre :               "
                               " │"
                       DISPLAY "└──────────────────────────────────────"
                               "─┘"
                       ACCEPT Wfiltre
                       MOVE Wfiltre TO fm_numCh
    
                       START fmis KEY IS fm_numCh
                       INVALID KEY
                           DISPLAY "Pas de mission pour cette chambre"
                   WHEN 3

                       START fm_debut KEY IS fm_debut
                       INVALID KEY
                   WHEN 4
               END-EVALUATE
               DISPLAY "└───────────────────────────────────────┘"

               PERFORM WITH TEST AFTER UNTIL Wfin = 0
                   READ fmis next
                       AT END
                           MOVE 0 TO Wfin
                       NOT AT END
                           EVALUATE Wchoix
                               WHEN 0
                                   IF fm_numM = Wfiltre
                                       THEN
                                           PERFORM SHOW_MISSION
                                   ELSE
                                       MOVE 0 TO Wfin
                                   END-IF
                               WHEN 1
                                   IF fm_numP = Wfiltre
                                       THEN
                                           PERFORM SHOW_MISSION
                                   ELSE
                                       MOVE 0 TO Wfin
                                   END-IF
                               WHEN 2
                                   IF fm_numCh = Wfiltre
                                       THEN
                                           PERFORM SHOW_MISSION
                                   ELSE
                                       MOVE 0 TO Wfin
                                   END-IF
                               WHEN 3
                               WHEN 4
                           END-EVALUATE
                   END-READ
               END-PERFORM
               END-START
           CLOSE fmis.

       SHOW_MISSION.
           DISPLAY "┌───────────────────────────────────────┐"
           DISPLAY "│                MISSION                │"
           DISPLAY "│                                       │"
           DISPLAY "│ NUMERO : " fm_numM
           DISPLAY "│ PERSONNEL : " fm_numP
           DISPLAY "│ CHAMBRE : " fm_numCh
           DISPLAY "│ DATE DE DÉBUT : " 
                   fm_debut_year "/"
                   fm_debut_month "/"
                   fm_debut_day
           DISPLAY "│ HEURE DE DÉBUT : " 
                   fm_debut_hours ":"
                   fm_debut_minute
           DISPLAY "│ DATE DE FIN : " 
                   fm_fin_year "/"
                   fm_fin_month "/"
                   fm_fin_day
           DISPLAY "│ HEURE DE DÉBUT : " 
                   fm_fin_hours ":"
                   fm_fin_minute
           DISPLAY "└───────────────────────────────────────┘"