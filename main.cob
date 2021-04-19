       IDENTIFICATION DIVISION.
       PROGRAM-ID. CUPIDON.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           COPY "files_assignments.cpy".

       DATA DIVISION.
       FILE SECTION.
       COPY "files_declarations.cpy".
       
       WORKING-STORAGE SECTION.
           COPY "ws_variables.cpy".
      
       77  MENU-PICK PIC 9 VALUE 0.
           88  MENU-PICK-IS-VALID VALUE 0 THRU 3.

       77  MENU-VALIDATE PIC A.
           88  MENU-VALIDATE-IS-VALID VALUE "Y", "N".
      
       77  ERROR-MESSAGE PIC X(79).
       77  WS-LOGIN PIC 9(4).
       77  WS-PASSWORD PIC X(30).
      

       SCREEN SECTION.

       COPY "screens_declarations.cpy".

       PROCEDURE DIVISION.
       
      *    PERFORM START_PROG
           MOVE FUNCTION CURRENT-DATE TO WS-CURRENT-DATE-DATA.
           PERFORM REMOVE_RESA.
      *    PERFORM DISPLAY_MISSION.
      *    PERFORM ADD_PERSONNEL.

           STOP RUN.

           
       START_PROG.
           PERFORM CREATE_FILES.
           PERFORM CONNECTION.


       CREATE_FILES.
          OPEN I-O fresa
             IF cr_fresa = 35 THEN
                OPEN OUTPUT fresa
             END-IF
          CLOSE fresa
   
          OPEN I-O fresaarch
             IF cr_fresaarch = 35 THEN
                OPEN OUTPUT fresaarch
             END-IF
          CLOSE fresaarch
   
          OPEN I-O fcli
             IF cr_fcli = 35 THEN
                OPEN OUTPUT fcli
             END-IF
          CLOSE fcli
   
          OPEN I-O fch
             IF cr_fch = 35 THEN
                OPEN OUTPUT fch
             END-IF
          CLOSE fch

          OPEN I-O fpers
             IF cr_fpers = 35 THEN
                OPEN OUTPUT fpers
             END-IF
          CLOSE fpers

          OPEN I-O fmis
             IF cr_fmis = 35 THEN
                OPEN OUTPUT fmis
             END-IF
          CLOSE fmis.


       CONNECTION.
           MOVE 0 TO Wvalide
           PERFORM WITH TEST AFTER UNTIL 
               Wvalide = 1
                 ACCEPT CONNECTION-SCREEN
                 MOVE " " TO ERROR-MESSAGE
                 PERFORM SEARCH_PERSONNEL
                 IF fp_motDePasse = " " THEN
                    MOVE "INEXISTING USER" TO ERROR-MESSAGE
                 ELSE 
                    IF WS-PASSWORD = fp_motDePasse THEN
                       MOVE tamp_fpers TO WS-CURRENT-USER
                       MOVE 1 TO Wvalide
                    ELSE
                       MOVE "WRONG PASSWORD" TO ERROR-MESSAGE
                    END-IF
                 END-IF
               END-PERFORM.


       GENERAL SECTION.


      * NEED TO OPEN ROOM FILE BEFORE PERFORM
      * RETURN fc_numCh + 1
       GET_LASTID_ROOM.
           MOVE 0 TO Wfin
           MOVE 0 TO fc_numCh
           PERFORM UNTIL Wfin = 1
               READ fch
                   AT END
                       MOVE 1 TO Wfin
               END-READ
           END-PERFORM
           ADD 1 TO fc_numch.


       ADDING SECTION.


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


       ADD_ROOM.
           MOVE 0 TO Wvalide
           OPEN INPUT fch
               PERFORM GET_LASTID_ROOM
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


       MODIF SECTION.


       MODIF_RESERVATION.
           MOVE 0 TO Wvalide
           OPEN I-O fresa
               ACCEPT fr_numResa
               READ fresa
                   INVALID KEY
                       DISPLAY "Cette réservation n'existe pas !"
                   NOT INVALID KEY
                       PERFORM WITH TEST AFTER UNTIL Wvalide = 1
                           ACCEPT RESA-EDITING-SCREEN
                           MOVE 1 TO Wvalide
                       END-PERFORM
                       IF MENU-VALIDATE = "Y" THEN
                           REWRITE tamp_fresa
                       ELSE
                           MOVE "MODIFICATION ABORT" TO ERROR-MESSAGE
                       END-IF
               END-READ
           CLOSE fresa.


       DISPLAYING SECTION.


      * DISPLAY MISSIONS OF THE CONNECTED USER
      * SEARCH BY ZONE ON fm_numP
       DISPLAY_MISSION.
           OPEN INPUT fmis
           MOVE WS-CURRENT-USER-NUM TO fm_numP
                 START fmis KEY IS EQUAL fm_numP 
                    INVALID KEY
                       MOVE "NO MISSIONS FOR YOU" TO ERROR-MESSAGE
                       DISPLAY DISP-MISSIONS-SCREEN
                    NOT INVALID KEY
                       MOVE 0 TO Wfin
                       MOVE 0 TO Wstop
                       PERFORM WITH TEST AFTER UNTIL Wfin = 1
                       AND Wstop = 1
                          MOVE 1 TO Wdisp
                          READ fmis NEXT
                             AT END
                                DISPLAY DISP-MISSIONS-SCREEN
                                MOVE 1 TO Wfin
                             NOT AT END
                               IF fm_numP = WS-CURRENT-USER-NUM THEN
                                   IF fm_fin < WS-CURRENT-DATE-DATA THEN
                                      MOVE 0 TO Wfin    
                                   ELSE
                                      IF Wdisp = 1 THEN
                                         MOVE tamp_fmis TO 1tamp_fmis
                                      ELSE IF Wdisp = 2 THEN
                                         MOVE tamp_fmis TO 2tamp_fmis
                                      ELSE IF Wdisp = 3 THEN
                                         MOVE tamp_fmis TO 3tamp_fmis
                                      ELSE IF Wdisp = 4 THEN
                                         MOVE tamp_fmis TO 4tamp_fmis
                                      ELSE IF Wdisp = 5 THEN
                                         MOVE tamp_fmis TO 5tamp_fmis
                                      ELSE IF Wdisp = 6 THEN
                                         MOVE tamp_fmis TO 6tamp_fmis
                                         MOVE 0 TO Wdisp
                                         DISPLAY DISP-MISSIONS-SCREEN
                                      END-IF
                                      ADD 1 TO Wdisp
                                   END-IF
                                ELSE
                                   MOVE 1 TO Wstop
                                END-IF
                          END-READ
                       END-PERFORM 
                 END-START
           CLOSE fmis.
           

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


       DELETE_ROOM.


       SEARCH_CLIENT.


       EDIT_MISSION.
              
       
       DELET SECTION.


       DELETE_MISSION.
           OPEN I-O fmis
      * ACCEPT IS TO TEST ONLY WAIT FOR DELETE SCREEN    
               ACCEPT fm_numM
               READ fmis
                   INVALID KEY
                       DISPLAY "Cette mission n'existe pas !"
                   NOT INVALID KEY
                       DELETE fmis RECORD
               END-READ
           CLOSE fmis.

           
       DELETE_PERSONNEL.
           DISPLAY "Matricule du personnel a licencier : "
           ACCEPT Wchoix
           OPEN INPUT fpers
               IF fp_numP = Wchoix
      * ACTION DE SUPPRIMER LE PERSONNEL
               END IF      
           CLOSE fpers.


      * FIND THE RESERVATION AND DISPLAY THE SCREEN FOR REMOVAL
       DELETE_RESA.
           OPEN I-O fresa
              ACCEPT RES-REMOVE-SCREEN
              READ fresa
              INVALID KEY
                 MOVE "NO RESERVATION FOR THIS GIVEN NUMBER" 
                    TO ERROR-MESSAGE
              NOT INVALID KEY
                 OPEN INPUT fcli
                    MOVE fr_numCl TO fcl_numCl
                    READ fcli
                    INVALID KEY
                       MOVE "CORRUPT RESERVATION" 
                       TO ERROR-MESSAGE
                     NOT INVALID KEY
                       ACCEPT RES-REMOVE-SCREEN
                       MOVE " " TO ERROR-MESSAGE
                       IF MENU-VALIDATE = "Y" THEN
                          DELETE fresa RECORD
                       ELSE
                          MOVE "SUPPRESSION ABORT" TO ERROR-MESSAGE
                       END-IF
                 CLOSE fcli
              END-READ 

           CLOSE fresa.

       
       SEARC SECTION.

       
      * PERSONNEL ID MUST BE IN WS-LOGIN BEFORE CALL SEARCH_PERSONNEL
       SEARCH_PERSONNEL.
           OPEN INPUT fpers
              MOVE 0 TO Wfin
              MOVE 0 TO Wtrouve
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


       SRCH_ROOM.
              OPEN INPUT fcha
              MOVE 0 to Wchoix1
               PERFORM WITH TEST AFTER UNTIL 
               Wchoix1 = 1 OR Wchoix1 = 2 OR Wchoix1 = 2 OR Wchoix1 = 3         
                 DISPLAY "1 - Recherche par id"
                 DISPLAY "2 - Recherche par type"
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
                 END IF
                 IF Wchoix2 = fc_type THEN
                    DISPLAY fc_typeCh
                 END IF
                END-PERFORM
              CLOSE fcha.