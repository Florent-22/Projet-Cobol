      * Screens declarations


      ***** MENUS *****
       01  CONNECTION-SCREEN.
           05  BLANK SCREEN.
           05  LINE  2 COL  71 PIC 9(8) FROM WS-CURRENT-DATE.
           05  LINE  3 PIC X(80) VALUE ALL "-".
           05  LINE  6 COL 15 VALUE "PLEASE LOGIN:".
           05  LINE  8 COL 20 VALUE "IDENTIFICATION CODE:".
           05  LINE  9 COL 20 VALUE "PASSWORD:".
           05  LINE 8 COL 41 PIC 9(4) USING WS-LOGIN.
           05  LINE 9 COL 41 PIC X(30) USING WS-PASSWORD.
           05  LINE 24 COL  2 PIC X(79) FROM ERROR-MESSAGE.

       01  LOGOUT-SCREEN.
           05  BLANK SCREEN.
           05  LINE  8 COL 12 VALUE "GOODBYE".
           05  LINE  8 COL  20 PIC A(30) FROM WS-CURRENT-USER-FIRSTNAME.

       01  A-RECEPTION-SCREEN.
           05  BLANK SCREEN.
           05  LINE  2 COL  71 PIC 9(8) FROM WS-CURRENT-DATE.
           05  LINE  2 COL  2 VALUE "WELCOME".
           05  LINE  2 COL  10 PIC A(30) FROM WS-CURRENT-USER-FIRSTNAME.
           05  LINE  3 PIC X(80) VALUE ALL "-".
           05  LINE  6 COL  20 BACKGROUND-COLOR IS 3 
           VALUE "RECEPTION MENU".
           05  LINE  8 COL 20 VALUE "PLEASE SELECT:".
           05  LINE  10 COL 25 VALUE "1. PLANNING".
           05  LINE  11 COL 25 VALUE "2. RESERVATIONS".
           05  LINE 12 COL 25 VALUE "3. CUSTOMERS".
           05  LINE 13 COL 25 VALUE "4. ROOM STATISTICS".
           05  LINE 14 COL 25 VALUE "5. ADMINISTRATION PANNEL".
           05  LINE 18 COL 25 VALUE "0. EXIT".
           05  LINE 20 COL  2 VALUE "YOUR SELECTION >".
           05  LINE 20 COL 19 PIC Z USING MENU-PICK.
           05  LINE 24 COL  2 PIC X(79) FROM ERROR-MESSAGE.
      
       01  RECEPTION-SCREEN.
           05  BLANK SCREEN.
           05  LINE  2 COL  71 PIC 9(8) FROM WS-CURRENT-DATE.
           05  LINE  2 COL  2 VALUE "WELCOME".
           05  LINE  2 COL  10 PIC A(30) FROM WS-CURRENT-USER-FIRSTNAME.
           05  LINE  3 PIC X(80) VALUE ALL "-".
           05  LINE  8 COL 20 VALUE "PLEASE SELECT:".
           05  LINE  10 COL 25 VALUE "1. PLANNING".
           05  LINE  11 COL 25 VALUE "2. RESERVATIONS".
           05  LINE 12 COL 25 VALUE "3. CUSTOMERS".
           05  LINE 13 COL 25 VALUE "4. ROOM STATISTICS".
           05  LINE 15 COL 25 VALUE "0. EXIT".
           05  LINE 20 COL  2 VALUE "YOUR SELECTION >".
           05  LINE 20 COL 19 PIC Z USING MENU-PICK.
           05  LINE 24 COL  2 PIC X(79) FROM ERROR-MESSAGE.

       01  ADMINISTRATION-SCREEN.
           05  BLANK SCREEN.
           05  LINE  2 COL  71 PIC 9(8) FROM WS-CURRENT-DATE.
           05  LINE  2 COL  2 VALUE "WELCOME".
           05  LINE  2 COL  10 PIC A(30) FROM WS-CURRENT-USER-FIRSTNAME.
           05  LINE  3 PIC X(80) VALUE ALL "-".
           05  LINE  8 COL 20 VALUE "PLEASE SELECT:".
           05  LINE  10 COL 25 VALUE "1. ROOMS".
           05  LINE  11 COL 25 VALUE "2. STAFF".
           05  LINE 12 COL 25 VALUE "3. MISSIONS SUPPRESSION".
           05  LINE 13 COL 25 VALUE "4. CUSTOMERS SUPPRESSION".
           05  LINE 15 COL 25 VALUE "0. EXIT".
           05  LINE 20 COL  2 VALUE "YOUR SELECTION >".
           05  LINE 20 COL 19 PIC Z USING MENU-PICK.
           05  LINE 24 COL  2 PIC X(79) FROM ERROR-MESSAGE.

       01  CLEANING-SCREEN.
           05  BLANK SCREEN.
           05  LINE  2 COL  71 PIC 9(8) FROM WS-CURRENT-DATE.
           05  LINE  2 COL  2 VALUE "WELCOME".
           05  LINE  2 COL  10 PIC A(30) FROM WS-CURRENT-USER-FIRSTNAME.
           05  LINE  3 PIC X(80) VALUE ALL "-".
           05  LINE  8 COL 20 VALUE "PLEASE SELECT:".
           05  LINE  10 COL 25 VALUE "1. MISSIONS".
           05  LINE  11 COL 25 VALUE "2. ASSIGNING A MISSION".
           05  LINE 12 COL 25 VALUE "3. CLOCK IN ON A MISSION".
           05  LINE 13 COL 25 VALUE "4. PERF STATISTICS".
           05  LINE 15 COL 25 VALUE "0. EXIT".
           05  LINE 20 COL  2 VALUE "YOUR SELECTION >".
           05  LINE 20 COL 19 PIC Z USING MENU-PICK.
           05  LINE 24 COL  2 PIC X(79) FROM ERROR-MESSAGE.

       01  ROOM-EDITING-SCREEN.
           05  BLANK SCREEN.
           05  LINE  2 COL  71 PIC 9(8) FROM WS-CURRENT-DATE.
           05  LINE  2 COL  2 VALUE "WELCOME".
           05  LINE  2 COL  10 PIC A(30) FROM WS-CURRENT-USER-FIRSTNAME.
           05  LINE  3 PIC X(80) VALUE ALL "-".
           05  LINE  8 COL 2 VALUE "ROOM NUMBER:".
           05  LINE 8 COL 15 PIC 9(4) FROM fc_numCh.
           05 LINE 10 COL 5 VALUE "ROOM TYPE:".
           05  LINE  10 COL 18 PIC A(30) USING fc_typeCh.
           05 LINE 11 COL 5 VALUE "SURFACE:".
           05  LINE  11 COL 18 PIC 9(2) USING fc_superficie.
           05 LINE 11 COL 21 VALUE "m2".
           05 LINE 12 COL 5 VALUE "BED TYPE:".
           05  LINE 12 COL 18 PIC 9(1) USING fc_lit.
           05  LINE 12 COL 21 VALUE 
           "(0 -> NORMAL 1 -> KING SIZE 2 -> DOUBLE)".
           05 LINE 13 COL 5 VALUE "DESCRIPTION:".
           05  LINE 13 COL 18 PIC A(100) USING fc_description.
           05 LINE 14 COL 5 VALUE "PRICE:".
           05  LINE 14 COL 18 PIC 9(3) USING fc_prix_heure_entier.
           05 LINE 14 COL 21 VALUE ",".
           05  LINE 14 COL 22 PIC 9(2) USING fc_prix_heure_decimal.
           05 LINE 14 COL 25 VALUE "euros".
           05  LINE 20 COL  2 VALUE "VALIDATE ? (Y/N) >".
           05  LINE 20 COL 21 PIC A USING MENU-VALIDATE.
           05  LINE 24 COL  2 PIC X(79) FROM ERROR-MESSAGE.

       01  RES-EDITING-SCREEN.
           05  BLANK SCREEN.
           05  LINE  2 COL  71 PIC 9(8) FROM WS-CURRENT-DATE.
           05  LINE  2 COL  2 VALUE "WELCOME".
           05  LINE  2 COL  10 PIC A(30) FROM WS-CURRENT-USER-FIRSTNAME.
           05  LINE  3 PIC X(80) VALUE ALL "-".
           05  LINE  8 COL 2 VALUE "RESERVATION NUMBER:".
           05  LINE 8 COL 22 PIC 9(6) USING fr_numResa.
           05 LINE 10 COL 5 VALUE "ROOM NUMBER:".
           05  LINE  10 COL 18 PIC 9(4) USING fr_numCh.
           05 LINE 11 COL 5 VALUE "CLIENT NAME:".
           05  LINE  11 COL 18 PIC A(30) USING fcl_nom.
           05  LINE  12 COL 18 PIC A(30) USING fcl_prenom.
           05 LINE 13 COL 5 VALUE "DURATION:".
           05  LINE 13 COL 15 PIC 9(2) USING fr_duree_hours.
           05 LINE 13 COL 17 VALUE "h".
           05  LINE 13 COL 18 PIC 9(2) USING fr_duree_minute.
           05 LINE 14 COL 5 VALUE "STARTS:".
           05 LINE 14 COL 12 PIC 9(2) USING fr_date_debut_day.
           05 LINE 14 COL 14 VALUE "/".
           05 LINE 14 COL 15 PIC 9(2) USING fr_date_debut_month.
           05 LINE 14 COL 17 VALUE "/".
           05 LINE 14 COL 18 PIC 9(4) USING fr_date_debut_year.
           05 LINE 14 COL 24 PIC 9(2) USING fr_date_debut_hours.
           05 LINE 14 COL 26 VALUE "h".
           05 LINE 14 COL 27 PIC 9(2) USING fr_date_debut_minute.
           05 LINE 15 COL 5 VALUE "ENDS:".
           05 LINE 15 COL 12 PIC 9(2) USING fr_date_fin_day.
           05 LINE 15 COL 14 VALUE "/".
           05 LINE 15 COL 15 PIC 9(2) USING fr_date_fin_month.
           05 LINE 15 COL 17 VALUE "/".
           05 LINE 15 COL 18 PIC 9(4) USING fr_date_fin_year.
           05 LINE 15 COL 24 PIC 9(2) USING fr_date_fin_hours.
           05 LINE 15 COL 26 VALUE "h".
           05 LINE 15 COL 27 PIC 9(2) USING fr_date_fin_minute.
           05 LINE 20 COL  2 VALUE "VALIDATE ? (Y/N) >".
           05 LINE 20 COL 21 PIC A USING MENU-VALIDATE.
           05 LINE 24 COL  2 PIC X(79) FROM ERROR-MESSAGE.


       01  RES-REMOVE-SCREEN.
           05  BLANK SCREEN.
           05  LINE  2 COL  71 PIC 9(8) FROM WS-CURRENT-DATE.
           05  LINE  2 COL  2 VALUE "WELCOME".
           05  LINE  2 COL  10 PIC A(30) FROM WS-CURRENT-USER-FIRSTNAME.
           05  LINE  3 PIC X(80) VALUE ALL "-".
           05 LINE 5 COL 30 FOREGROUND-COLOR IS 4 
           VALUE "! REMOVE RESERVATION !".
           05  LINE  8 COL 2 VALUE "RESERVATION NUMBER:".
           05  LINE 8 COL 22 PIC 9(6) USING fr_numResa.
           05 LINE 10 COL 5 VALUE "ROOM NUMBER:".
           05  LINE  10 COL 18 PIC 9(4) FROM fr_numCh.
           05 LINE 11 COL 5 VALUE "CLIENT NAME:".
           05  LINE  11 COL 18 PIC A(30) FROM fcl_nom.
           05  LINE  12 COL 18 PIC A(30) FROM fcl_prenom.
           05 LINE 13 COL 5 VALUE "DURATION:".
           05  LINE 13 COL 15 PIC 9(2) FROM fr_duree_hours.
           05 LINE 13 COL 17 VALUE "h".
           05  LINE 13 COL 18 PIC 9(2) FROM fr_duree_minute.
           05 LINE 14 COL 5 VALUE "STARTS:".
           05 LINE 14 COL 12 PIC 9(2) FROM fr_date_debut_day.
           05 LINE 14 COL 14 VALUE "/".
           05 LINE 14 COL 15 PIC 9(2) FROM fr_date_debut_month.
           05 LINE 14 COL 17 VALUE "/".
           05 LINE 14 COL 18 PIC 9(4) FROM fr_date_debut_year.
           05 LINE 14 COL 24 PIC 9(2) FROM fr_date_debut_hours.
           05 LINE 14 COL 26 VALUE "h".
           05 LINE 14 COL 27 PIC 9(2) FROM fr_date_debut_minute.
           05 LINE 15 COL 5 VALUE "ENDS:".
           05 LINE 15 COL 12 PIC 9(2) FROM fr_date_fin_day.
           05 LINE 15 COL 14 VALUE "/".
           05 LINE 15 COL 15 PIC 9(2) FROM fr_date_fin_month.
           05 LINE 15 COL 17 VALUE "/".
           05 LINE 15 COL 18 PIC 9(4) FROM fr_date_fin_year.
           05 LINE 15 COL 24 PIC 9(2) FROM fr_date_fin_hours.
           05 LINE 15 COL 26 VALUE "h".
           05 LINE 15 COL 27 PIC 9(2) FROM fr_date_fin_minute.
           05 LINE 16 COL 5 VALUE "TOTAL PRICE:".
           05 LINE 16 COL 18 PIC 9(3) FROM WS-TOTAL-PRICE-ENTIER.
           05 LINE 16 COL 21 VALUE ",".
           05 LINE 16 COL 22 PIC 9(2) FROM WS-TOTAL-PRICE-DECIMAL.
           05 LINE 16 COL 25 VALUE "euros".
           05 LINE 20 COL  2 VALUE "VALIDATE ? (Y/N) >".
           05 LINE 20 COL 21 PIC A USING MENU-VALIDATE.
           05 LINE 24 COL  2 PIC X(79) FROM ERROR-MESSAGE.



       01  PERS-EDITING-SCREEN.
           05  BLANK SCREEN.
           05  LINE  2 COL  71 PIC 9(8) FROM WS-CURRENT-DATE.
           05  LINE  2 COL  2 VALUE "WELCOME".
           05  LINE  2 COL  10 PIC A(30) FROM WS-CURRENT-USER-FIRSTNAME.
           05  LINE  3 PIC X(80) VALUE ALL "-".
           05  LINE  8 COL 2 VALUE "PERSONAL NUMBER:".
           05  LINE 8 COL 19 PIC 9(4) FROM fp_numP.
           05 LINE 10 COL 5 VALUE "FIRSTNAME:".
           05  LINE  10 COL 18 PIC A(30) USING fp_nom.
           05 LINE 11 COL 5 VALUE "LASTNAME:".
           05  LINE  11 COL 18 PIC A(30) USING fp_prenom.
           05 LINE 12 COL 5 VALUE "PERS TYPE:".
           05  LINE 12 COL 18 PIC 9 USING fp_type.
           05  LINE 12 COL 25 VALUE 
           "(0 -> RECEPTION 1 -> CLEANING 2 -> ADMIN)".
           05 LINE 13 COL 5 VALUE "PASSWORD:".
           05  LINE 13 COL 18 PIC X(30) USING fp_motDePasse.
           05 LINE 14 COL 5 VALUE "DATE EMBAUCHE:".
           05  LINE 14 COL 21 PIC 9(4) USING fp_year.
           05 LINE 14 COL 25 VALUE "/".
           05  LINE 14 COL 26 PIC 9(2) USING fp_month.
           05 LINE 14 COL 28 VALUE "/".
           05  LINE 14 COL 29 PIC 9(2) USING fp_day.
           05  LINE 15 COL 5 VALUE "ACTIF:".
           05  LINE 15 COL 18 PIC 9 USING fp_actif.
           05  LINE 15 COL 25 VALUE 
           "(0 -> FIRED 1 -> HIRED 2 -> LEAVE)".
           05  LINE 20 COL  2 VALUE "VALIDATE ? (Y/N) >".
           05  LINE 20 COL 21 PIC A USING MENU-VALIDATE.
           05  LINE 24 COL  2 PIC X(79) FROM ERROR-MESSAGE.

      * DISPLAY 6 MISSIONS ON SCREEN
       01  DISP-MISSIONS-SCREEN.
           05  LINE  5 COL 5 VALUE "MISSION NUMBER:".
           05  LINE 5 COL 21 PIC 9(5) FROM 1fm_numM.
           05 LINE 7 COL 5 VALUE "PERSON:".
           05 LINE 7 COL 13 PIC 9(4) FROM 1fm_numP.
           05 LINE 8 COL 5 VALUE "ROOM:".
           05 LINE 8 COL 11 PIC 9(4) FROM 1fm_numCh.
           05 LINE 9 COL 5 VALUE "START AT:".
           05 LINE 9 COL 15 PIC 9(2) FROM 1fm_debut_hours.
           05 LINE 9 COL 17 VALUE "h".
           05 LINE 9 COL 18 PIC 9(2) FROM 1fm_debut_minute.

           05  LINE  5 COL 30 VALUE "MISSION NUMBER:".
           05  LINE 5 COL 46 PIC 9(5) FROM 2fm_numM.
           05 LINE 7 COL 30 VALUE "PERSON:".
           05 LINE 7 COL 38 PIC 9(4) FROM 2fm_numP.
           05 LINE 8 COL 30 VALUE "ROOM:".
           05 LINE 8 COL 36 PIC 9(4) FROM 2fm_numCh.
           05 LINE 9 COL 30 VALUE "START AT:".
           05 LINE 9 COL 40 PIC 9(2) FROM 2fm_debut_hours.
           05 LINE 9 COL 42 VALUE "h".
           05 LINE 9 COL 43 PIC 9(2) FROM 2fm_debut_minute.

           05  LINE  5 COL 55 VALUE "MISSION NUMBER:".
           05  LINE 5 COL 71 PIC 9(5) FROM 3fm_numM.
           05 LINE 7 COL 55 VALUE "PERSON:".
           05 LINE 7 COL 63 PIC 9(4) FROM 3fm_numP.
           05 LINE 8 COL 55 VALUE "ROOM:".
           05 LINE 8 COL 61 PIC 9(4) FROM 3fm_numCh.
           05 LINE 9 COL 55 VALUE "START AT:".
           05 LINE 9 COL 65 PIC 9(2) FROM 3fm_debut_hours.
           05 LINE 9 COL 67 VALUE "h".
           05 LINE 9 COL 68 PIC 9(2) FROM 3fm_debut_minute.
 

           05 LINE 12 COL 5 VALUE "MISSION NUMBER:".
           05 LINE 12 COL 21 PIC 9(5) FROM 4fm_numM.
           05 LINE 14 COL 5 VALUE "PERSON:".
           05 LINE 14 COL 13 PIC 9(4) FROM 4fm_numP.
           05 LINE 15 COL 5 VALUE "ROOM:".
           05 LINE 15 COL 11 PIC 9(4) FROM 4fm_numCh.
           05 LINE 16 COL 5 VALUE "START AT:".
           05 LINE 16 COL 15 PIC 9(2) FROM 4fm_debut_hours.
           05 LINE 16 COL 17 VALUE "h".
           05 LINE 16 COL 18 PIC 9(2) FROM 4fm_debut_minute.

           05 LINE 12 COL 30 VALUE "MISSION NUMBER:".
           05 LINE 12 COL 46 PIC 9(5) FROM 5fm_numM.
           05 LINE 14 COL 30 VALUE "PERSON:".
           05 LINE 14 COL 38 PIC 9(4) FROM 5fm_numP.
           05 LINE 15 COL 30 VALUE "ROOM:".
           05 LINE 15 COL 36 PIC 9(4) FROM 5fm_numCh.
           05 LINE 16 COL 30 VALUE "START AT:".
           05 LINE 16 COL 40 PIC 9(2) FROM 5fm_debut_hours.
           05 LINE 16 COL 42 VALUE "h".
           05 LINE 16 COL 43 PIC 9(2) FROM 5fm_debut_minute.

           05 LINE 12 COL 55 VALUE "MISSION NUMBER:".
           05 LINE 12 COL 71 PIC 9(5) FROM 6fm_numM.
           05 LINE 14 COL 55 VALUE "PERSON:".
           05 LINE 14 COL 63 PIC 9(4) FROM 6fm_numP.
           05 LINE 15 COL 55 VALUE "ROOM:".
           05 LINE 15 COL 61 PIC 9(4) FROM 6fm_numCh.
           05 LINE 16 COL 55 VALUE "START AT:".
           05 LINE 16 COL 65 PIC 9(2) FROM 6fm_debut_hours.
           05 LINE 16 COL 67 VALUE "h".
           05 LINE 16 COL 68 PIC 9(2) FROM 6fm_debut_minute.
           05  LINE 20 COL  2 VALUE ">ENTER FOR NEXT<".
           05  LINE 24 COL  2 PIC X(79) FROM ERROR-MESSAGE.


        01  RESA-EDITING-SCREEN.
           05  BLANK SCREEN.
           05  LINE  2 COL  71 PIC 9(8) FROM WS-CURRENT-DATE.
           05  LINE  2 COL  2 VALUE "WELCOME".
           05  LINE  2 COL  10 PIC A(30) FROM WS-CURRENT-USER-FIRSTNAME.
           05  LINE  3 PIC X(80) VALUE ALL "-".
           05 LINE 8 COL 5 VALUE "RESA. NUM ROOM:".
           05  LINE  8 COL 18 PIC 9(4) USING fr_numCh.
           05 LINE 9 COL 5 VALUE "RESA. NUM CLIENT:".
           05  LINE  9 COL 18 PIC 9(6) USING fr_numCl.
           05 LINE 10 COL 5 VALUE "START DATE:".
           05 LINE 10 COL 20 PIC 9(4) USING fr_date_debut_year.
           05 LINE 10 COL 25 VALUE "/".
           05  LINE 10 COL 26 PIC 9(2) USING fr_date_debut_month.
           05 LINE 10 COL 28 VALUE "/".
           05  LINE 10 COL 29 PIC 9(2) USING fr_date_debut_day.
           05 LINE 10 COL 31 PIC 9(2) USING fr_date_debut_hours.
           05 LINE 10 COL 34 VALUE ":".
           05 LINE 10 COL 36 PIC 9(2) USING fr_date_debut_minute.
           05 LINE 11 COL 5 VALUE "END DATE:".
           05 LINE 11 COL 20 PIC 9(4) USING fr_date_fin_year.
           05 LINE 11 COL 25 VALUE "/".
           05  LINE 11 COL 26 PIC 9(2) USING fr_date_fin_month.
           05 LINE 11 COL 28 VALUE "/".
           05  LINE 11 COL 29 PIC 9(2) USING fr_date_fin_day.
           05 LINE 11 COL 31 PIC 9(2) USING fr_date_fin_hours.
           05 LINE 11 COL 34 VALUE ":".
           05 LINE 11 COL 36 PIC 9(2) USING fr_date_fin_minute.
           05  LINE 20 COL  2 VALUE "VALIDATE ? (Y/N) >".
           05  LINE 20 COL 21 PIC A USING MENU-VALIDATE.
           05  LINE 24 COL  2 PIC X(79) FROM ERROR-MESSAGE.

      * DISPLAY 6 PERSONNEL ON SCREEN 
       01  DISP-PERSONNEL-SCREEN.
           05  LINE  5 COL 5 VALUE "PERSONNEL NUMBER:".
           05  LINE 5 COL 21 PIC 9(5) FROM 1fp_numP.
           05 LINE 7 COL 5 VALUE "NAME:".
           05 LINE 7 COL 13 PIC 9(4) FROM 1fp_nom.
           05 LINE 8 COL 5 VALUE "FIRSTNAME:".
           05 LINE 8 COL 11 PIC 9(4) FROM 1fp_prenom.
           05 LINE 9 COL 5 VALUE "TYPE:".
           05 LINE 9 COL 15 PIC 9(2) FROM 1fp_type.

           05  LINE  5 COL 30 VALUE "PERSONNEL NUMBER:".
           05  LINE 5 COL 46 PIC 9(5) FROM 2fp_numP.
           05 LINE 7 COL 30 VALUE "NAME:".
           05 LINE 7 COL 38 PIC 9(4) FROM 2fp_nom.
           05 LINE 8 COL 30 VALUE "FIRSTNAME:".
           05 LINE 8 COL 36 PIC 9(4) FROM 2fp_prenom.
           05 LINE 9 COL 30 VALUE "TYPE:".
           05 LINE 9 COL 40 PIC 9(2) FROM 2fp_type.

           05  LINE  5 COL 55 VALUE "PERSONNEL NUMBER:".
           05  LINE 5 COL 71 PIC 9(5) FROM 3fp_numP.
           05 LINE 7 COL 55 VALUE "NAME:".
           05 LINE 7 COL 63 PIC 9(4) FROM 3fp_nom.
           05 LINE 8 COL 55 VALUE "FIRSTNAME:".
           05 LINE 8 COL 61 PIC 9(4) FROM 3fp_prenom.
           05 LINE 9 COL 55 VALUE "TYPE:".
           05 LINE 9 COL 65 PIC 9(2) FROM 3fp_type.
 

           05 LINE 12 COL 5 VALUE "PERSONNEL NUMBER:".
           05 LINE 12 COL 21 PIC 9(5) FROM 4fp_numP.
           05 LINE 14 COL 5 VALUE "NAME:".
           05 LINE 14 COL 13 PIC 9(4) FROM 4fp_nom.
           05 LINE 15 COL 5 VALUE "FIRSTNAME:".
           05 LINE 15 COL 11 PIC 9(4) FROM 4fp_prenom.
           05 LINE 16 COL 5 VALUE "TYPE:".
           05 LINE 16 COL 15 PIC 9(2) FROM 4fp_type.

           05 LINE 12 COL 30 VALUE "PERSONNEL NUMBER:".
           05 LINE 12 COL 46 PIC 9(5) FROM 5fp_numP.
           05 LINE 14 COL 30 VALUE "NAME:".
           05 LINE 14 COL 38 PIC 9(4) FROM 5fp_nom.
           05 LINE 15 COL 30 VALUE "FIRSTNAME:".
           05 LINE 15 COL 36 PIC 9(4) FROM 5fp_prenom.
           05 LINE 16 COL 30 VALUE "TYPE:".
           05 LINE 16 COL 40 PIC 9(2) FROM 5fp_type.

           05 LINE 12 COL 55 VALUE "PERSONNEL NUMBER:".
           05 LINE 12 COL 71 PIC 9(5) FROM 6fp_numP.
           05 LINE 14 COL 55 VALUE "NAME:".
           05 LINE 14 COL 63 PIC 9(4) FROM 6fp_nom.
           05 LINE 15 COL 55 VALUE "FIRSTNAME:".
           05 LINE 15 COL 61 PIC 9(4) FROM 6fp_prenom.
           05 LINE 16 COL 55 VALUE "TYPE:".
           05 LINE 16 COL 65 PIC 9(2) FROM 6fp_type.
           05  LINE 20 COL  2 VALUE ">ENTER FOR NEXT<".
           05  LINE 24 COL  2 PIC X(79) FROM ERROR-MESSAGE.

       01  SRCH-CLI-SCREEN.
           05  BLANK SCREEN.
           05  LINE  2 COL  71 PIC 9(8) FROM WS-CURRENT-DATE.
           05  LINE  2 COL  2 VALUE "WELCOME".
           05  LINE  2 COL  10 PIC A(30) FROM WS-CURRENT-USER-FIRSTNAME.
           05  LINE  3 PIC X(80) VALUE ALL "-".
           05  LINE  8 COL 2 VALUE "CLIENT NUMBER:".
           05  LINE 8 COL 22 PIC 9(6) USING fcl_numCl.
           05 LINE 10 COL 5 VALUE "CLIENT NAME:".
           05  LINE  10 COL 18 PIC A(30) FROM fcl_nom.
           05  LINE  11 COL 18 PIC A(30) FROM fcl_prenom.
           05 LINE 12 COL 5 VALUE "TELEPHONE:".
           05  LINE 12 COL 16 PIC 9(10) FROM fcl_tel.
           05 LINE 13 COL 5 VALUE "ADDRESS:".
           05  LINE 13 COL 14 PIC X(100) FROM fcl_adr.
           05 LINE 14 COL 5 VALUE "BIRTHDAY:".
           05 LINE 14 COL 12 PIC 9(2) FROM fcl_day.
           05 LINE 14 COL 14 VALUE "/".
           05 LINE 14 COL 15 PIC 9(2) FROM fcl_month.
           05 LINE 14 COL 17 VALUE "/".
           05 LINE 14 COL 18 PIC 9(4) FROM fcl_year.

           05 LINE 20 COL  2 VALUE "PRESS ENTER TO RETURN TO MENU".
           05 LINE 20 COL 21 PIC A USING MENU-VALIDATE.
           05 LINE 24 COL  2 PIC X(79) FROM ERROR-MESSAGE.