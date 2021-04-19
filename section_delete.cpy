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
                 fp_actif = 0
               END-IF     
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
