       ADD_MISSION.
           OPEN I-O fmission
           DISPLAY "Année du début de la mission : "
           ACCEPT fm_debut_year
           DISPLAY "Mois de début de la mission : "
           ACCEPT fm_debut_month
           DISPLAY "Jour de début de la mission : "
           ACCEPT fm_debut_day
           DISPLAY "Heure de début de la mission : "
           ACCEPT fm_debut_hour
           DISPLAY "Heure de début de la mission : "
           ACCEPT fm_debut_minute 

           DISPLAY "Année de fin de la mission : "
           ACCEPT fm_fin_year
           DISPLAY "Mois de début de la mission : "
           ACCEPT fm_fin_month
           DISPLAY "Jour de début de la mission : "
           ACCEPT fm_fin_day
           DISPLAY "Heure de début de la mission : "
           ACCEPT fm_fin_hour
           DISPLAY "Heure de début de la mission : "
           ACCEPT fm_fin_minute 
           
           WRITE tamp_fmi
              INVALID KEY 
                 DISPLAY "Echec de l'ajout"
              NOT INVALID KEY 
                 DISPLAY "Ajout réussi"
           END-WRITE

           CLOSE fmission.

           DISPLAY_PERSONNEL.
           DISPLAY "***** AFFICHAGE PERSONNELS *****"
           OPEN INPUT fpers
               MOVE 0 TO Wfin
               PERFORM UNTIL Wfin = 1
                   READ fpers
                       AT END
                           MOVE 1 TO Wfin
                       NOT AT END
                           DISPLAY "*** PERSONNEL ***"
                           DISPLAY "Numéro du personnel : " fp_numpP
                           DISPLAY "Nom du personnel : " fp_nom
                           DISPLAY "Prénom du personnel : " fp_prenom
                           DISPLAY "Type du personnel : " fp_type
                           DISPLAY "Mot de passe du personnel : " 
                               fp_motDePasse
                           DISPLAY "Année d'embauche du personnel : " 
                               fp_year
                           DISPLAY "Mois d'embauche du personnel : " 
                               fp_month
                           DISPLAY "Jour d'embauche du personnel : "
                               fp_day
                           DISPLAY "Type du personnel : " fp_actif
                           DISPLAY "----------------------------------"
                   END-READ
               END-PERFORM 
           CLOSE fpers
           DISPLAY " ".

           ADD_RESERV.
           OPEN I-O fres
           CLOSE fres.

           SRCH_ROOM.
              OPEN INPUT fcha   
               PERFORM WITH TEST AFTER UNTIL Wchoix = 1 OR Wchoix = 2 OR
                Wchoix = 2 OR Wchoix = 3         
                 DISPLAY "Recherche par id"
                 DISPLAY "Recherche par type"
                 DISPLAY "Recherche chambres disponibles"
                 DISPLAY "Annuler la recherche"
                 ACCEPT Wchoix
                END-PERFORM

                 EVALUATE Wchoix
                       WHEN 1                       
                       WHEN 2
                       WHEN 3
                 END-EVALUATE           
              CLOSE fcha.
