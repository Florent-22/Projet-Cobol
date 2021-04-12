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
              MOVE 0 to Wchoix1
               PERFORM WITH TEST AFTER UNTIL 
               Wchoix1 = 1 OR Wchoix1 = 2 OR Wchoix1 = 2 OR Wchoix1 = 3         
                 DISPLAY "1 - Recherche par id"
                 DISPLAY "2 - Recherche par type"
                 DISPLAY "3 - Voir les chambres disponibles"
                 DISPLAY "4 - Annuler la recherche"
                 ACCEPT Wchoix1
                END-PERFORM
                 EVALUATE Wchoix1
                       WHEN 1
                          DISPLAY "id de la chambre recherché :"   
                          ACCEPT Wchoix2                                            
                       WHEN 2
                          DISPLAY "type de la chambre recherché :"   
                          ACCEPT Wchoix2
                 END-EVALUATE 
                MOVE 0 TO Wfin
                PERFORM UNTIL Wfin = 1 
                read fcha
                AT END
                    MOVE 1 TO Wfin
                NOT AT END
                 IF Wchoix2 = fc_id THEN
                    DISPLAY fc_id
                 IF Wchoix2 = fc_type THEN
                    DISPLAY fc_typeCh
                 IF Wchoix = 3 
                END-PERFORM
              CLOSE fcha.
